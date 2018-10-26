
module "network" {
  source                                  = "./network"
  compartment_ocid                        = "${var.compartment_ocid}"
  tenancy_ocid                            = "${var.tenancy_ocid}"
  vcn_dns_name                            = "${var.vcn_dns_name}"
  label_prefix                            = "${var.label_prefix}"
}
	
