# Security group for public Bastion Host
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"
  name        = "${local.name}-public-bastion-sg"
  description = "Security group for BastionHost with SSH ports from anywhere and egress all-all"
  vpc_id      = module.vpc.vpc_id
  # Ingress rules and CIDR Blocks
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress rules and CIDR Blocks
  egress_rules = ["all-all"]
  tags = local.common_tags
}