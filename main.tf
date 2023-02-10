module "vpc" {
  source = "./vpc"
  vpc-cidr = var.vpc-cidr
  vpc-name = var.vpc-name
  public-subnets_cidr = var.public-subnets_cidr
  public-az-subnet = var.public-az-subnet
  public-subnets_name = var.public-subnets_name
  private-subnets_cidr = var.private-subnets_cidr
  private-az-subnet = var.private-az-subnet
  private-subnets-name = var.private-subnets-name
}
module "igw" {
  source = "./igw"
  vpc-id = module.vpc.vpc-id
}
module "natgw" {
  source = "./natgw"
  nat-subnet_id = module.vpc.public-subnet-1
}
module "sg" {
 source = "./sg"
 cidr_blocks_allow_all = var.cidr_blocks_allow_all
 vpc_id = module.vpc.vpc-id 
}
module "routtable" {
  source = "./routtable"
  destination_cidr_block = var.destination_cidr_block
  vpc-id = module.vpc.vpc-id
  igw-id = module.igw.igw-id
  natgw-id = module.natgw.natgw-id
  public-subnet-1 = module.vpc.public-subnet-1
  public-subnet-2 = module.vpc.public-subnet-2
  private-subnet-1 = module.vpc.private-subnet-1
  private-subnet-2 = module.vpc.private-subnet-2
}
module "keypair" {
  source = "./keypair"
  algorithm = var.algorithm
  rsa_bits = var.rsa_bits
  key_name = var.key_name 
}
module "ec2" {
  source = "./ec2"
  public-ec2-names = var.public-ec2-names
  ami-id = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  public-subnet-ids = [module.vpc.public-subnet-1,module.vpc.public-subnet-2]
  public-ec2-sg-id = module.sg.public-ec2-sg-id
  key-name = module.keypair.keyoutput
  connection-type = "ssh"
  connection-user = "ubuntu"
  private-subnet-ids = [module.vpc.private-subnet-1,module.vpc.private-subnet-2]
  private-ec2-sg-id  = module.sg.private-ec2-sg-id
  private-ec2-names = var.private-ec2-names
  private_lb_dns = module.lb.private-lb-dns
}
module "lb" {
  source = "./lp"
  vpc-id = module.vpc.vpc-id
  public-lb-sg-id = module.sg.public-lb-sg-id
  public-subnet-ids = [module.vpc.public-subnet-1,module.vpc.public-subnet-2]
  public-ec2 = var.public-ec2-names
  private-lb-sg-id = module.sg.private-lb-sg-id
  private-subnet-ids = [module.vpc.private-subnet-1,module.vpc.private-subnet-2]
  private-ec2 = var.private-ec2-names
  public_target_id = module.ec2.public-ec2-id
  private_target_id = module.ec2.private-ec2-id
}