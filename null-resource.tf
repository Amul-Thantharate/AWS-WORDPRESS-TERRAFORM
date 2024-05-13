resource "null_resource" "nullremote1" {

        provisioner "remote-exec" {
                inline = [
                        "sudo yum update -y",
                        "sudo mkfs.ext4 /dev/xvdb",
                        "sudo yum install git httpd -y",
                        "sudo mount /dev/xvdb /var/www/html",
                        "sudo amazon-linux-extras install -y mariadb10.5 php8.2",
                        "sudo git clone https://github.com/WordPress/WordPress.git",
                        "sudo mv WordPress/* /var/www/html/",
                        "sudo chown -R /var/ww/html/",
                        "sudo systemctl start httpd"
                ]
        }
        connection {
                type = "ssh"
                host = aws_instance.wordpress.public_ip
                user = "ec2-user"
                private_key = tls_private_key.wor-press.private_key_pem
            }

}

