
provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true  

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] 
}

resource "aws_instance" "app_server" {
   ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
   Name = var.instance_name
  }

}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  name = "example-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_dns_hostnames    = true
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "meu-app"
  tags = {
    Project = "Projeto1"
    ManagedBy = "Terraform"
  }
}




resource "aws_s3_account_public_access_block" "this" {
  count = var.create ? 1 : 0
  account_id = var.account_id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

