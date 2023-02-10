output "public-lb-sg-id" {
  value = aws_security_group.public_lb_sg.id
}
output "public-ec2-sg-id" {
  value = aws_security_group.public_ec2_sg.id
}
output "private-lb-sg-id" {
  value = aws_security_group.private_lb_sg.id
}
output "private-ec2-sg-id" {
  value = aws_security_group.private_ec2_sg.id
}