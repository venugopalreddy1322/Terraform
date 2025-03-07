module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"
  # vpc basic details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  # database subnets
  create_database_subnet_group  = true
  create_database_subnet_route_table= true
  database_subnets = ["10.0.251.0/24", "10.0.252.0/24"]

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true
  
  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "Public-subnets"
  }
  private_subnet_tags = {
    Type = "Private-subnets"
  }
  database_subnet_tags = {
    Type = "Database-subnets"
  }
  tags = {
    Owner = "Venu"
    Environment = "Dev"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }
  map_public_ip_on_launch = true

}