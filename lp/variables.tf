variable "vpc-id" {
}
variable "public-lb-sg-id" {
}
variable "public-subnet-ids" {
}
variable "public-ec2" {
}
variable "private-lb-sg-id" {
}
variable "private-subnet-ids" {
}
variable "private-ec2" {
}
variable "private_target_id" {
    type = list(string)
}
variable "public_target_id" {
    type = list(string)

}