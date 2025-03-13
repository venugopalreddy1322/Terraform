resource "null_resource" "copr_ec2_keys" {
  depends_on = [module.ec2_public]
  connection {
    type = "ssh"
    host = module.ec2_public.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/eks-terraform-ssh-key.pem")
  }
# File provisioner to copy ssh key to /tmp/terraform-key.pem
provisioner "file" {
  source = "private-key/eks-terraform-ssh-key.pem"
  destination = "/tmp/terraform-key.pem"
}
# Remote-exec provisioner
provisioner "remote-exec" {
  inline = [ 
    "sudo chmod 400 /tmp/terraform-key.pem"
   ]
}
# Local-exec provisioner
provisioner "local-exec" {
  command = "echo VPC created on 'date' and VPC_ID: ${modue.vpc.vpc_id} >> creation-time-vpc-id.txt"
  working_dir = "local-exec-output-files"
}
}