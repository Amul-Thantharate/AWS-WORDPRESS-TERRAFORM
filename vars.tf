variable "region" {
    description = "The AWS region to deploy resources."
}

variable "vpc-cidr" {
    description = "The CIDR block for the VPC."
    type = string
}

variable "public-subnet-cidr" {
    description = "The CIDR block for the public subnet."
    type = list(string)
}

variable "private-subnet-cidr" {
    description = "The CIDR block for the private subnet."
    type = list(string)
}

variable "aws_azs" {
    description = "The availability zones to deploy resources."
    type = list(string)
} 

variable "instance_type" {
    description = "The instance type to deploy."
} 

variable "volume_size" {
    description = "The size of the volume."
}

variable "rds_instance_class" {
    description = "The instance class for the RDS instance."
}

variable "rds_admin_username" {
    description = "The username for the RDS instance."
}

variable "rds_admin_password" {
    description = "The password for the RDS instance."
}

variable "rds_storage_size" {
    description = "The storage size for the RDS instance."
}

variable "rds_db_name" {
    description = "The name of the database."
}

