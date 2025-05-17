# Creating a EC2 Instance using Terraform
Instance details:
1. Ami with free tier eligible using data source feature
2. Variableized terraform code to change Region, ami, instance type etc
3. Security group which alows ports 22, 80 and 8080, we will change according to our requirements
4. User data which installs Java 17 and Jenkins
5. Attaching already created Key-pair with EC2 Instance
6. Changed the root device default storage from 8gb to 16gb, default dive type will change according to the ami selected between gp2 or gp3 for free tier 
7. Using Using Terraform's aws_ec2_instance_state resource, we can start or stop the instance.