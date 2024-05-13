resource "aws_instance" "wordpress" {
    ami           = data.aws_ami.amazon-linux.id
    instance_type = var.instance_type
    subnet_id     = element(aws_subnet.public-subnet.*.id, 0)
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    key_name = aws_key_pair.wor-press.key_name
    associate_public_ip_address = true

    tags = {
        Name = "wordpress"
    }
}