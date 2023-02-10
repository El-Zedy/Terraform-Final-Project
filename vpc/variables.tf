variable "vpc-cidr" {
  type = string
}
variable "vpc-name" {
  type = string
}
variable "public-subnets_cidr" {
  type = list(string)
}
variable "public-az-subnet" {
  type = list(string)
}
variable "public-subnets_name" {
  type = list(string)
}
variable "private-subnets_cidr" {
}
variable "private-az-subnet" {
}
variable "private-subnets-name" {
}
