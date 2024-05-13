resource "aws_security_group" "web_sg" {
    name        = "web_sg"
    description = "Allow HTTP and SSH inbound traffic"
    vpc_id      = aws_vpc.wordpress-vpc.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group_rule" "web_sg_egress" {
    security_group_id = aws_security_group.web_sg.id
    type              = "egress"
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
}