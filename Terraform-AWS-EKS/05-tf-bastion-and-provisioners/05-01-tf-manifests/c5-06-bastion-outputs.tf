output "ec2_bastion_public_istance_ids" {
  value = module.ec2_public.id
}
output "ec2_bastion_public_ip" {
  value = module.ec2_public.public_ip
}