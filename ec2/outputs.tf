output "public-ec2-id" {
  value = aws_instance.public-ec2[*].id
}
output "private-ec2-id" {
  value = aws_instance.private-ec2[*].id
}