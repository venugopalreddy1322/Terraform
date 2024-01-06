variable "uservalue" {
  description = "example of variable type map"
  #type = map(string)
  type = map(map(string))
}

# terraform plan/apply -var-file="prod.tfvars" -this will fetch the variable value form given file
# in this example prod.tfvars -- INCASE if you are using the file name other
# than terraform.tfvars
