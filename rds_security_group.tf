resource "aws_security_group" "rds_sec_group" {
    name        = "rds_sec_group"
    description = "Allow MySQL inbound traffic"
    vpc_id      = aws_vpc.wordpress-vpc.id
    tags = {
        Name = "rds_sec_group"
    }
}

resource "aws_security_group_rule" "rds_ingress" {
    security_group_id = aws_security_group.rds_sec_group.id
    type              = "ingress"
    from_port         = 3306
    to_port           = 3306
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "rds_egress" {
    security_group_id = aws_security_group.rds_sec_group.id
    type              = "egress"
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
}

