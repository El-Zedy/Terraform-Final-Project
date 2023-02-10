################ PUBLIC EC2 ########################
resource "aws_instance" "public-ec2" {
  count                       = length(var.public-ec2-names)
  ami                         = var.ami-id
  instance_type               = var.instance_type
  subnet_id                   = var.public-subnet-ids[count.index]
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.public-ec2-sg-id]
  key_name                    = var.key-name
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y ",
      "echo 'server {\nlisten 80 default_server;\nlisten [::]:80 default_server;\nserver_name _;\nlocation / {\nproxy_pass http://${var.private_lb_dns};\n}\n}' > default",
      "sudo mv default /etc/nginx/sites-enabled/default",
      "sudo systemctl restart nginx"
    ]
  }
  connection {
    host        = self.public_ip
    type        = var.connection-type
    user        = var.connection-user
    private_key = file("aws_keys_pairs.pem")
  }
  provisioner "local-exec" {
    command = "echo public-ip: ${self.public_ip} >> PublicIPs.txt"
  }
  tags = {
    "Name" = var.public-ec2-names[count.index]
  }
}
################ PRIVATE EC2 ########################
resource "aws_instance" "private-ec2" {
  count                       = length(var.private-ec2-names)
  ami                         = var.ami-id
  instance_type               = var.instance_type
  subnet_id                   = var.private-subnet-ids[count.index]
  associate_public_ip_address = false
  vpc_security_group_ids      = [var.private-ec2-sg-id]
  key_name                    = var.key-name
  user_data                   = file("user_data.sh")
  tags = {
    "Name" = var.private-ec2-names[count.index]
  }
  provisioner "local-exec" {
    command = "echo private-iP: ${self.private_ip} >> PrivateIPs.txt"
  }
}


