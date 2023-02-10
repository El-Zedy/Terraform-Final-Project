################# PUBLIC LB ################################
resource "aws_lb" "public-lb" {
  name               = "publiclp"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.public-lb-sg-id]
  subnets            = [for sbt in var.public-subnet-ids : sbt]
}
resource "aws_lb_target_group" "public-lb-targetgroup" {
  name     = "Public-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
}
resource "aws_lb_listener" "public-lb-listener" {
  load_balancer_arn = aws_lb.public-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public-lb-targetgroup.arn
  }
}
resource "aws_lb_target_group_attachment" "public-lb-tagetgroup-attachment" {
  count            = length(var.public-ec2)
  target_group_arn = aws_lb_target_group.public-lb-targetgroup.arn
  target_id        = var.public_target_id[count.index]
  port             = 80
}
################# PRIVATE LB ################################
resource "aws_lb" "private-lb" {
  name               = "privatelp"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.private-lb-sg-id]
  subnets            = [for sbt in var.private-subnet-ids : sbt]
}
resource "aws_lb_target_group" "private-lb-targetgroup" {
  name     = "private-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
}
resource "aws_lb_listener" "private-lb-listener" {
  load_balancer_arn = aws_lb.private-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private-lb-targetgroup.arn
  }
}
resource "aws_lb_target_group_attachment" "private-lb-tagetgroup-attachment" {
  count            = length(var.private-ec2)
  target_group_arn = aws_lb_target_group.private-lb-targetgroup.arn
  target_id        = var.private_target_id[count.index]
  port             = 80
}