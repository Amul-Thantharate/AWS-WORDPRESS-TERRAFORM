resource "tls_private_key" "wor-press" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "wor-press" {
    key_name   = "wor-press"
    public_key = tls_private_key.wor-press.public_key_openssh
    provisioner "local-exec" {
        command = "echo '${tls_private_key.wor-press.private_key_pem}' > wor-press.pem"
      
    }
}

resource "local_file" "wor-press" {
    content  = tls_private_key.wor-press.private_key_pem
    filename = "${path.module}/wor-press.pem"
    file_permission = "0400"
}

output "private_key" {
    value = tls_private_key.wor-press.private_key_pem
    sensitive = true
}
