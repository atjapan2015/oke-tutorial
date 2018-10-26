
##### LB Subnets

resource "oci_core_subnet" "loadbalancerAD1" {
  availability_domain        = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block                 = "${lookup(var.network_cidrs, "LBSubnetAD1")}"
  compartment_id             = "${var.compartment_ocid}"
  display_name               = "${lookup(var.network_subnet_dns, "LBSubnetAD1")}"
  dns_label                  = "${lookup(var.network_subnet_dns, "LBSubnetAD1")}"
  vcn_id                     = "${oci_core_virtual_network.VCN.id}"
  route_table_id             = "${oci_core_route_table.routetable-0.id}"
  dhcp_options_id            = "${oci_core_virtual_network.VCN.default_dhcp_options_id}"
  security_list_ids          = ["${oci_core_security_list.loadbalancers.id}"]
  prohibit_public_ip_on_vnic = "false"

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_subnet" "loadbalancerAD2" {
  availability_domain        = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  cidr_block                 = "${lookup(var.network_cidrs, "LBSubnetAD2")}"
  compartment_id             = "${var.compartment_ocid}"
  display_name               = "${lookup(var.network_subnet_dns, "LBSubnetAD2")}"
  dns_label                  = "${lookup(var.network_subnet_dns, "LBSubnetAD2")}"
  vcn_id                     = "${oci_core_virtual_network.VCN.id}"
  route_table_id             = "${oci_core_route_table.routetable-0.id}"
  dhcp_options_id            = "${oci_core_virtual_network.VCN.default_dhcp_options_id}"
  security_list_ids          = ["${oci_core_security_list.loadbalancers.id}"]
  prohibit_public_ip_on_vnic = "false"

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_subnet" "workerAD1" {
  availability_domain        = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block                 = "${lookup(var.network_cidrs, "WorkerSubnetAD1")}"
  compartment_id             = "${var.compartment_ocid}"
  display_name               = "${lookup(var.network_subnet_dns, "WorkerSubnetAD1")}"
  dns_label                  = "${lookup(var.network_subnet_dns, "WorkerSubnetAD1")}"
  vcn_id                     = "${oci_core_virtual_network.VCN.id}"
  route_table_id             = "${oci_core_route_table.routetable-0.id}"
  dhcp_options_id            = "${oci_core_virtual_network.VCN.default_dhcp_options_id}"
  security_list_ids          = ["${oci_core_security_list.worker.id}"]
  prohibit_public_ip_on_vnic = "false"

  provisioner "local-exec" {
    command = "sleep 5"
  }
}


resource "oci_core_subnet" "workerAD2" {
  availability_domain        = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  cidr_block                 = "${lookup(var.network_cidrs, "WorkerSubnetAD2")}"
  compartment_id             = "${var.compartment_ocid}"
  display_name               = "${lookup(var.network_subnet_dns, "WorkerSubnetAD2")}"
  dns_label                  = "${lookup(var.network_subnet_dns, "WorkerSubnetAD2")}"
  vcn_id                     = "${oci_core_virtual_network.VCN.id}"
  route_table_id             = "${oci_core_route_table.routetable-0.id}"
  dhcp_options_id            = "${oci_core_virtual_network.VCN.default_dhcp_options_id}"
  security_list_ids          = ["${oci_core_security_list.worker.id}"]
  prohibit_public_ip_on_vnic = "false"

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_subnet" "workerAD3" {
  availability_domain        = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[2],"name")}"
  cidr_block                 = "${lookup(var.network_cidrs, "WorkerSubnetAD3")}"
  compartment_id             = "${var.compartment_ocid}"
  display_name               = "${lookup(var.network_subnet_dns, "WorkerSubnetAD3")}"
  dns_label                  = "${lookup(var.network_subnet_dns, "WorkerSubnetAD3")}"
  vcn_id                     = "${oci_core_virtual_network.VCN.id}"
  route_table_id             = "${oci_core_route_table.routetable-0.id}"
  dhcp_options_id            = "${oci_core_virtual_network.VCN.default_dhcp_options_id}"
  security_list_ids          = ["${oci_core_security_list.worker.id}"]
  prohibit_public_ip_on_vnic = "false"

  provisioner "local-exec" {
    command = "sleep 5"
  }
}
