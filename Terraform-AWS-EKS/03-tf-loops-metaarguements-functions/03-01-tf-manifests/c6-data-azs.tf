# Get List of Availability Zones in a Specific Region
# Region is set in Provider.tf 
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
# Get the List of Availability Zones in a Particular region with t2.micro instance_type supported
data "aws_ec2_instance_type_offerings" "instance_type" {
  for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}
