#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Install Java
sudo yum install java-17-amazon-corretto -y
# Install Jenkins
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

# Install Terraform
sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform -version

# Install Docker on AMZ Linux2
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo yum install -y docker
sudo service docker start
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins