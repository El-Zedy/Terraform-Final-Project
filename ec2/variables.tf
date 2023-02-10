variable "ami-id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "public-subnet-ids" {
}
variable "public-ec2-sg-id" {
}
variable "key-name" {
  type = string
}
variable "private_lb_dns" {
}
variable "connection-type" {
}
variable "connection-user" {
}

variable "public-ec2-names" {
}
variable "private-ec2-names" {
}
variable "private-subnet-ids" {
}
variable "private-ec2-sg-id" {
}