# EKS Cluster Input variables
variable "cluster_name" {
  description = "EKS Cluster name, also used as a prefix in names of related resources."
  type = string
  default = "eksdemo"
}