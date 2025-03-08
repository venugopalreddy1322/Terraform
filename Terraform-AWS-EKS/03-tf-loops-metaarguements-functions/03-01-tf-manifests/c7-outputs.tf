# Output-1
# Basic Output: All Availability Zones mapped to Supported Instance Types
/*output "Azs_with_t2micro" {
  value = {
    for az, t in data.aws_ec2_instance_type_offerings.my_insstance: az => t.instance_types
  }
}
*/
# Output-3
# Filtered Output: with Keys Function - Which gets keys from a Map
# This will return the list of availability zones supported for a instance type
output "Azs_with_t2micro" {
  value = keys({for az, t in data.aws_ec2_instance_type_offerings.instance_type: 
    az => t.instance_types if length(t.instance_types) != 0 })
}
output "Webserver-Public_IPs" {
    description = "Ec2 instance public_ips"
  value = toset([for instance in aws_instance.webserver: instance.public_ip])
}
output "Webserver-public_ip_with_map" {
  value = tomap({for az, instance in aws_instance.webserver: az => instance.public_ip})
}
output "ami_id_for_webserver" {
  value       = data.aws_ami.amz2ami.id
  description = "Dynamically pick Ami using data block "
}