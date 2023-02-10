resource "aws_route_table" "puplic_routeT" {
  vpc_id = var.vpc-id 
  tags = {
    "Name" = "lab3-puplic_routet"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.puplic_routeT.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.igw-id 
}

resource "aws_route_table_association" "public1" {
  subnet_id      = var.public-subnet-1 
  route_table_id = aws_route_table.puplic_routeT.id
}
resource "aws_route_table_association" "public2" {
  subnet_id      = var.public-subnet-2 
  route_table_id = aws_route_table.puplic_routeT.id
}
################### PRIVATE ############################

resource "aws_route_table" "private_routT" {
  vpc_id = var.vpc-id
  tags = {
    "Name" = "lab3-private_routet"
  }
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_routT.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.natgw-id 
}

resource "aws_route_table_association" "private1" {
  subnet_id      = var.private-subnet-1 
  route_table_id = aws_route_table.private_routT.id
}
resource "aws_route_table_association" "private2" {
  subnet_id      = var.private-subnet-2 
  route_table_id = aws_route_table.private_routT.id
}