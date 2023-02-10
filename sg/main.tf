resource "aws_security_group" "public_lb_sg" {
  vpc_id      = var.vpc_id
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks_allow_all
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks_allow_all
  }
  tags = {
    "Name" = "public_lb_sg"
  }
}
resource "aws_security_group" "public_ec2_sg" {
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks_allow_all
  }
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_lb_sg.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks_allow_all
  }
  tags = {
    "Name" = "public_ec2_sg"
  }
}
resource "aws_security_group" "private_lb_sg" {
  vpc_id      = var.vpc_id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_ec2_sg.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks_allow_all
  }
  tags = {
    "Name" = "private_lb_sg"
  }
}
resource "aws_security_group" "private_ec2_sg" {
  vpc_id      = var.vpc_id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.private_lb_sg.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks_allow_all
  }
  tags = {
    "Name" = "private_ec2_sg"
  }
}