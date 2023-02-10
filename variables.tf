variable "vpc-cidr" {
}
variable "vpc-name" {
  type = string
}
variable "public-az-subnet" {
}
variable "public-subnets_cidr" {
}
variable "public-subnets_name" {
  type = list
}
variable "private-subnets_cidr" {
}
variable "private-az-subnet" {
}
variable "private-subnets-name" {
}
variable "destination_cidr_block" {
}
variable "cidr_blocks_allow_all" {
}
variable "algorithm" {
}
variable "rsa_bits" {
}
variable "key_name" {
}
variable "instance_type" {
}
variable "public-ec2-names" {
}
variable "private-ec2-names" {
}