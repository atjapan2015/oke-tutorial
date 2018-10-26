resource "oci_core_security_list" "loadbalancers" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.label_prefix}seclistloadbalancersubnets"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"

  # Enables responses from a web application through the service load balancers

  egress_security_rules = [
    {
      protocol = "6"
      destination   = "0.0.0.0/0"
      stateless = "1"
    }
  ]

  # Enables incoming public traffic to service load balancers

  ingress_security_rules = [
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      stateless = "1"
    }
  ]

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

resource "oci_core_security_list" "worker" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.label_prefix}seclistworkersubnets"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"

  egress_security_rules = [
    {
      destination = "${lookup(var.network_cidrs, "WorkerSubnetAD1")}"
      protocol    = "all"
      stateless   = "1"
    },
    {
      destination = "${lookup(var.network_cidrs, "WorkerSubnetAD2")}"
      protocol    = "all"
      stateless   = "1"
    },
    {
      destination = "${lookup(var.network_cidrs, "WorkerSubnetAD3")}"
      protocol    = "all"
      stateless   = "1"
    },
    {
      destination = "0.0.0.0/0"
      protocol    = "all"
      stateless   = "0"
    },
  ]

  ingress_security_rules = [
    {
      protocol = "1"
      source   = "${var.external_icmp_ingress}"

      icmp_options {
        "type" = 3
        "code" = 4
      }
    },
    {
      # Enables intra-VCN traffic
      source = "${lookup(var.network_cidrs, "WorkerSubnetAD1")}"
      protocol    = "all"
      stateless   = "1"
    },
    {
      # Enables intra-VCN traffic
      source = "${lookup(var.network_cidrs, "WorkerSubnetAD2")}"
      protocol    = "all"
      stateless   = "1"
    },
    {
      # Enables intra-VCN traffic
      source = "${lookup(var.network_cidrs, "WorkerSubnetAD3")}"
      protocol    = "all"
      stateless   = "1"
    },
    {
	  # enable Container Engine for Kubernetes to access worker nodes via SSH
      protocol = "6"
      source   = "130.35.0.0/16"
      stateless   = "0"
      tcp_options {
        "max" = 22
        "min" = 22
      }
    },
    {
	  # enable Container Engine for Kubernetes to access worker nodes via SSH
      protocol = "6"
      source   = "138.1.0.0/17"
      stateless   = "0"
      tcp_options {
        "max" = 22
        "min" = 22
      }
    },
    {
	  # new stateful ingress rule to enable access to worker nodes on the default NodePort range
      protocol = "6"
      source   = "0.0.0.0/0"
      stateless   = "0"
      tcp_options {
        "max" = 32767
        "min" = 30000
      }
    },
    {
      protocol = "6"
      source   = "0.0.0.0/0"
      stateless   = "0"
      tcp_options {
        "max" = 22
        "min" = 22
      }
    },
  ]

  provisioner "local-exec" {
    command = "sleep 5"
  }
}
