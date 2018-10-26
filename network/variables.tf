variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "vcn_dns_name" {}

variable "network_cidrs" {
  type = "map"
  default = {
    VCN-CIDR          = "10.0.0.0/16"
    LBSubnetAD1       = "10.0.20.0/24"
    LBSubnetAD2       = "10.0.21.0/24"
    WorkerSubnetAD1   = "10.0.10.0/24"
    WorkerSubnetAD2   = "10.0.11.0/24"
    WorkerSubnetAD3   = "10.0.12.0/24"
  }
}

variable "network_subnet_dns" {
  type = "map"
  default = {
    LBSubnetAD1     = "lbsubnet1"
    LBSubnetAD2     = "lbsubnet2"
    WorkerSubnetAD1 = "workersubnet1"
    WorkerSubnetAD2 = "workersubnet2"
    WorkerSubnetAD3 = "workersubnet3"
  }
}



variable "control_plane_subnet_access" {
  default = "public"
}

# VCN

variable "label_prefix" {
  type    = "string"
  default = ""
}


variable "external_icmp_ingress" {
  default = "0.0.0.0/0"
}

variable "internal_icmp_ingress" {
  default = "10.0.0.0/16"
}