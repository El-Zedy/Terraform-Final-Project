resource "aws_eip" "nat_ip" {
  tags = {
    "Name" = "Lab3-eip"
  }
}
resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = var.nat-subnet_id 
  tags = {
    "Name" = "Lab3-nat-gw"
  }
}