resource "tls_private_key" "generate-private-key" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}
resource "aws_key_pair" "keys" {

  key_name = var.key_name 
  public_key = tls_private_key.generate-private-key.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.generate-private-key.private_key_pem}' > aws_keys_pairs.pem
      chmod 400 aws_keys_pairs.pem
    EOT
  }
}