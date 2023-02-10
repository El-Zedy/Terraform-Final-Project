output "public-lb-dns" {
  value = aws_lb.public-lb.dns_name
}
output "public-lb-targetgroup-arn" {
  value = aws_lb_target_group.public-lb-targetgroup.arn
}
output "private-lb-dns" {
  value = aws_lb.private-lb.dns_name
}
output "my_private_lb_tg_arn" {
  value = aws_lb_target_group.private-lb-targetgroup.arn
}