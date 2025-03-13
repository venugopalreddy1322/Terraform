# Datasource of AWS Availability Zones
data "aws_availability_zones" "available" {
  state = available
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"
  # vpc basic details
  name            = "${local.name}-${var.vpc_name}"
  cidr            = var.vpc_cidr_block
  #azs             = var.vpc_availability_zones
  azs = data.aws_availability_zones.available.names
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # database subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "Public-subnets"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared" 
  }
  private_subnet_tags = {
    Type = "Private-subnets"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared" 
  }
  database_subnet_tags = {
    Type = "Database-subnets"
  }
  tags = local.common_tags
  vpc_tags = local.common_tags
  
  map_public_ip_on_launch = true

}