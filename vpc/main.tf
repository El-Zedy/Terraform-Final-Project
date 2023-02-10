resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    "Name" = var.vpc-name
  }
}
resource "aws_subnet" "public-subnet" {

  count = length(var.public-subnets_cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public-subnets_cidr[count.index]
  availability_zone = var.public-az-subnet[count.index]
  map_public_ip_on_launch = true
  tags = {
    "Name" = var.public-subnets_name[count.index]
  }
}
resource "aws_subnet" "private-subnet" {
  count                   = length(var.private-subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private-subnets_cidr[count.index]
  availability_zone       = var.private-az-subnet[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = var.private-subnets-name[count.index]
  }
}
