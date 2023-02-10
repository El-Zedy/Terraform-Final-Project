output "vpc-id" {
  value = aws_vpc.vpc.id
}
output "public-subnet-1" {
  value = aws_subnet.public-subnet[0].id
}
output "public-subnet-2" {
  value = aws_subnet.public-subnet[1].id
}
output "private-subnet-1" {
  value = aws_subnet.private-subnet[0].id
}
output "private-subnet-2" {
  value = aws_subnet.private-subnet[1].id
}