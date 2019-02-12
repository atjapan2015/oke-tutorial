variable tenancy_ocid {
}

variable compartment_ocid {
}

variable fingerprint {
}

variable private_key_path {
}

variable "private_key_password" {
  default = ""
}

variable user_ocid {
}

variable region {
	default = "eu-frankfurt-1"
}


variable cidr-block {
	default = "10.0.0.0/16"
}

variable "disable_auto_retries" {
	default = "false"
}

variable "vcn_dns_name" {
  default = "Tutorial1"
}

variable "label_prefix" {
  description = "To create unique identifier for multiple clusters in a compartment."
  type        = "string"
  default     = "cm_"
}




