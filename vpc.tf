resource "aws_vpc" "wordpress-vpc" {
    cidr_block = var.vpc-cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "wordpress-vpc"
    }
}

resource "aws_subnet" "public-subnet" {
    count = length(var.public-subnet-cidr)
    vpc_id = aws_vpc.wordpress-vpc.id
    cidr_block = var.public-subnet-cidr[count.index]
    availability_zone = var.aws_azs[count.index]
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet-${count.index + 1}"
    }
}

resource "aws_subnet" "private-subnet" {
    count = length(var.private-subnet-cidr)
    vpc_id = aws_vpc.wordpress-vpc.id
    cidr_block = var.private-subnet-cidr[count.index]
    availability_zone = var.aws_azs[count.index]
    tags = {
        Name = "private-subnet-${count.index + 1}"
    }
}

resource "aws_internet_gateway" "wordpress-igw" {
    vpc_id = aws_vpc.wordpress-vpc.id
    tags = {
        Name = "wordpress-igw"
    }
}

resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.wordpress-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.wordpress-igw.id
    }
    tags = {
        Name = "public-route-table"
    }
}

resource "aws_route_table_association" "public-subnet-association" {
    count = length(aws_subnet.public-subnet)
    subnet_id = aws_subnet.public-subnet[count.index].id
    route_table_id = aws_route_table.public-route-table.id
}

resource "aws_nat_gateway" "wordpress-ngw" {
    allocation_id = aws_eip.wordpress-eip.id
    subnet_id = aws_subnet.public-subnet[0].id
    tags = {
        Name = "wordpress-ngw"
    }
}

resource "aws_eip" "wordpress-eip" {
    vpc = true
    tags = {
        Name = "wordpress-eip"
    }
}

resource "aws_route_table_association" "private-subnet-association" {
    count = length(aws_subnet.private-subnet)
    subnet_id = aws_subnet.private-subnet[count.index].id
    route_table_id = aws_route_table.public-route-table.id
}

