resource "aws_db_subnet_group" "default" {
    name = "wordpress_db_subnet_group"
    subnet_ids = [aws_subnet.private-subnet[0].id, aws_subnet.private-subnet[1].id]
    tags = {
        "Name" = "wordpress_db_subnet_group"
    }
}

resource "aws_db_instance" "wordpress" {
    identifier = "wordpress"
    allocated_storage = var.rds_storage_size
    engine = "mysql"
    engine_version = "8.0.35"
    instance_class = var.rds_instance_class
    username = var.rds_admin_username
    password = var.rds_admin_password
    db_subnet_group_name = aws_db_subnet_group.default.name
    vpc_security_group_ids = [ aws_security_group.rds_sec_group.id ]
    skip_final_snapshot = true
    parameter_group_name = "default.mysql8.0"

}