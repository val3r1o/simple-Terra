# Creating apstra design
resource "apstra_logical_device" "leaf_1_QFX5120-48Y" {
        name = "leaf_1_QFX5120-48Y"
        panels = [
                {
                        rows = 2
                        columns = 22
                        port_groups = [
                                {
                                        port_roles = [
                                                "access",
                                                "generic",
                                                "leaf",
                                                "peer",
                                                "spine",
                                                "superspine",
                                                "unused",
                                    ]
                                        port_count = 4
                                        port_speed = "1G"
                                },
                                {
                                        port_roles = [
                                                "access",
                                                "generic",
                                                "leaf",
                                                "peer",
                                                "spine",
                                                "superspine",
                                                "unused",
                                    ]
                                        port_count = 40
                                        port_speed = "1G"
                                },
                        ]
                }
        ]
}

resource "apstra_interface_map" "leaf_1_QFX5120-48Y" {
        name = "leaf_1_QFX5120-48Y"
        logical_device_id = apstra_logical_device.leaf_1_QFX5120-48Y.id
        device_profile_id = "vJunos-switch"
        interfaces = [
                {
                        "logical_device_port"     = "1/1"
                        "physical_interface_name" = "ge-0/0/0"
                },
                {
                        "logical_device_port"     = "1/2"
                        "physical_interface_name" = "ge-0/0/1"
                },
                {
                        "logical_device_port"     = "1/3"
                        "physical_interface_name" = "ge-0/0/2"
                },
                {
                        "logical_device_port"     = "1/4"
                        "physical_interface_name" = "ge-0/0/3"
                },
                {
                        "logical_device_port"     = "1/5"
                        "physical_interface_name" = "ge-0/0/4"
                },
                {
                        "logical_device_port"     = "1/6"
                        "physical_interface_name" = "ge-0/0/5"
                },
                {
                        "logical_device_port"     = "1/7"
                        "physical_interface_name" = "ge-0/0/6"
                },
                {
                        "logical_device_port"     = "1/8"
                        "physical_interface_name" = "ge-0/0/7"
                },
                {
                        "logical_device_port"     = "1/9"
                        "physical_interface_name" = "ge-0/0/8"
                },
                {
                        "logical_device_port"     = "1/10"
                        "physical_interface_name" = "ge-0/0/9"
                },
                {
                        "logical_device_port"     = "1/11"
                        "physical_interface_name" = "ge-0/0/10"
                },
                {
                        "logical_device_port"     = "1/12"
                        "physical_interface_name" = "ge-0/0/11"
                },
                {
                        "logical_device_port"     = "1/13"
                        "physical_interface_name" = "ge-0/0/12"
                },
                {
                        "logical_device_port"     = "1/14"
                        "physical_interface_name" = "ge-0/0/13"
                },
                {
                        "logical_device_port"     = "1/15"
                        "physical_interface_name" = "ge-0/0/14"
                },
                {
                        "logical_device_port"     = "1/16"
                        "physical_interface_name" = "ge-0/0/15"
                },
                {
                        "logical_device_port"     = "1/17"
                        "physical_interface_name" = "ge-0/0/16"
                },
                {
                        "logical_device_port"     = "1/18"
                        "physical_interface_name" = "ge-0/0/17"
                },
                {
                        "logical_device_port"     = "1/19"
                        "physical_interface_name" = "ge-0/0/18"
                },
                {
                        "logical_device_port"     = "1/20"
                        "physical_interface_name" = "ge-0/0/19"
                },
                {
                        "logical_device_port"     = "1/21"
                        "physical_interface_name" = "ge-0/0/20"
                },
                {
                        "logical_device_port"     = "1/22"
                        "physical_interface_name" = "ge-0/0/21"
                },
                {
                        "logical_device_port"     = "1/23"
                        "physical_interface_name" = "ge-0/0/22"
                },
                {
                        "logical_device_port"     = "1/24"
                        "physical_interface_name" = "ge-0/0/23"
                },
                {
                        "logical_device_port"     = "1/25"
                        "physical_interface_name" = "ge-0/0/24"
                },
                {
                        "logical_device_port"     = "1/26"
                        "physical_interface_name" = "ge-0/0/25"
                },
                {
                        "logical_device_port"     = "1/27"
                        "physical_interface_name" = "ge-0/0/26"
                },
                {
                        "logical_device_port"     = "1/28"
                        "physical_interface_name" = "ge-0/0/27"
                },
                {
                        "logical_device_port"     = "1/29"
                        "physical_interface_name" = "ge-0/0/28"
                },
                {
                        "logical_device_port"     = "1/30"
                        "physical_interface_name" = "ge-0/0/29"
                },
                {
                        "logical_device_port"     = "1/31"
                        "physical_interface_name" = "ge-0/0/30"
                },
                {
                        "logical_device_port"     = "1/32"
                        "physical_interface_name" = "ge-0/0/31"
                },
                {
                        "logical_device_port"     = "1/33"
                        "physical_interface_name" = "ge-0/0/32"
                },
                {
                        "logical_device_port"     = "1/34"
                        "physical_interface_name" = "ge-0/0/33"
                },
                {
                        "logical_device_port"     = "1/35"
                        "physical_interface_name" = "ge-0/0/34"
                },
                {
                        "logical_device_port"     = "1/36"
                        "physical_interface_name" = "ge-0/0/35"
                },
                {
                        "logical_device_port"     = "1/37"
                        "physical_interface_name" = "ge-0/0/36"
                },
                {
                        "logical_device_port"     = "1/38"
                        "physical_interface_name" = "ge-0/0/37"
                },
                {
                        "logical_device_port"     = "1/39"
                        "physical_interface_name" = "ge-0/0/38"
                },
                {
                        "logical_device_port"     = "1/40"
                        "physical_interface_name" = "ge-0/0/39"
                },
                {
                        "logical_device_port"     = "1/41"
                        "physical_interface_name" = "ge-0/0/40"
                },
                {
                        "logical_device_port"     = "1/42"
                        "physical_interface_name" = "ge-0/0/41"
                },
                {
                        "logical_device_port"     = "1/43"
                        "physical_interface_name" = "ge-0/0/42"
                },
                {
                        "logical_device_port"     = "1/44"
                        "physical_interface_name" = "ge-0/0/43"
                },
        ]
        }

resource "apstra_datacenter_device_allocation" "rack_1_001_leaf1" {
                blueprint_id             = apstra_datacenter_blueprint.Terraform-t-1.id
                initial_interface_map_id = apstra_interface_map.leaf_1_QFX5120-48Y.id
                node_name                = "rack_1_001_leaf1"
                #device_key = "" #system id of managed device
                deploy_mode      = "deploy"
          }

resource "apstra_datacenter_device_allocation" "rack_1_001_leaf2" {
                blueprint_id             = apstra_datacenter_blueprint.Terraform-t-1.id
                initial_interface_map_id = apstra_interface_map.leaf_1_QFX5120-48Y.id
                node_name                = "rack_1_001_leaf2"
                #device_key = "" #system id of managed device
                deploy_mode      = "deploy"
          }

resource "apstra_datacenter_device_allocation" "rack_1_002_leaf1" {
                blueprint_id             = apstra_datacenter_blueprint.Terraform-t-1.id
                initial_interface_map_id = apstra_interface_map.leaf_1_QFX5120-48Y.id
                node_name                = "rack_1_002_leaf1"
                #device_key = "" #system id of managed device
                deploy_mode      = "deploy"
          }

resource "apstra_datacenter_device_allocation" "rack_1_002_leaf2" {
                blueprint_id             = apstra_datacenter_blueprint.Terraform-t-1.id
                initial_interface_map_id = apstra_interface_map.leaf_1_QFX5120-48Y.id
                node_name                = "rack_1_002_leaf2"
                #device_key = "" #system id of managed device
                deploy_mode      = "deploy"
          }

resource "apstra_rack_type" "Rack_1" {
        name                       = "Rack_1"
        description                = "Rack Rack_1"
        fabric_connectivity_design = "l3clos"
        leaf_switches = { // leaf switches are a map keyed by switch name, so
                                tor_switch = {
                                        logical_device_id   = apstra_logical_device.leaf_1_QFX5120-48Y.id
                                        spine_link_count    = 2
                                        spine_link_speed    = "1G"
                                        redundancy_protocol = "esi"
                                }
        }
}

resource "apstra_logical_device" "spine_1_QFX5200-32C" {
        name = "spine_1_QFX5200-32C"
        panels = [
                {
                        rows = 1
                        columns = 8
                        port_groups = [
                                {
                                        port_roles = [
                                                "access",
                                                "generic",
                                                "leaf",
                                                "peer",
                                                "spine",
                                                "superspine",
                                                "unused",
                                    ]
                                        port_count = 8
                                        port_speed = "1G"
                                },
                        ]
                }
        ]
}

resource "apstra_interface_map" "spine_1_QFX5200-32C" {
        name = "spine_1_QFX5200-32C"
        logical_device_id = apstra_logical_device.spine_1_QFX5200-32C.id
        device_profile_id = "vJunos-switch"
        interfaces = [
                {
                        "logical_device_port"     = "1/1"
                        "physical_interface_name" = "ge-0/0/0"
                },
                {
                        "logical_device_port"     = "1/2"
                        "physical_interface_name" = "ge-0/0/1"
                },
                {
                        "logical_device_port"     = "1/3"
                        "physical_interface_name" = "ge-0/0/2"
                },
                {
                        "logical_device_port"     = "1/4"
                        "physical_interface_name" = "ge-0/0/3"
                },
                {
                        "logical_device_port"     = "1/5"
                        "physical_interface_name" = "ge-0/0/4"
                },
                {
                        "logical_device_port"     = "1/6"
                        "physical_interface_name" = "ge-0/0/5"
                },
                {
                        "logical_device_port"     = "1/7"
                        "physical_interface_name" = "ge-0/0/6"
                },
                {
                        "logical_device_port"     = "1/8"
                        "physical_interface_name" = "ge-0/0/7"
                },
        ]
        }

resource "apstra_datacenter_device_allocation" "spine1" {
                blueprint_id             = apstra_datacenter_blueprint.Terraform-t-1.id
                initial_interface_map_id = apstra_interface_map.spine_1_QFX5200-32C.id
                node_name                = "spine1"
                #device_key = "" #system id of managed device
                deploy_mode      = "deploy"
          }

resource "apstra_datacenter_device_allocation" "spine2" {
                blueprint_id             = apstra_datacenter_blueprint.Terraform-t-1.id
                initial_interface_map_id = apstra_interface_map.spine_1_QFX5200-32C.id
                node_name                = "spine2"
                #device_key = "" #system id of managed device
                deploy_mode      = "deploy"
          }

resource "apstra_template_rack_based" "Stage3_Template" {
        name                     = "Stage3_Template"
        overlay_control_protocol = "evpn"
        asn_allocation_scheme = "unique"
        spine = {
                logical_device_id = apstra_logical_device.spine_1_QFX5200-32C.id
                count             = 2
        }
        rack_infos = {
                (apstra_rack_type.Rack_1.id) = { count = 2 }
        }
}

# Instantiate a blueprint from a template
resource "apstra_datacenter_blueprint" "Terraform-t-1" {
        name        = "Terraform-t-1"
        template_id = apstra_template_rack_based.Stage3_Template.id
}

# ASN pools and  IPv4 pools will be allocated
resource "apstra_asn_pool" "leaf_asns" {
        name = "leaf_asns"
        ranges = [
                {
                        first = 64500
                        last = 64700
                },
        ]
}

resource "apstra_asn_pool" "spine_asns" {
        name = "spine_asns"
        ranges = [
                {
                        first = 64701
                        last = 65200
                },
        ]
}

resource "apstra_ipv4_pool" "leaf_loopback_ips" {
        name = "leaf_loopback_ips"
        subnets = [
                {
                        network = "10.1.0.0/16"
                },
        ]
}

resource "apstra_ipv4_pool" "spine_loopback_ips" {
        name = "spine_loopback_ips"
        subnets = [
                {
                        network = "10.2.0.0/16"
                },
        ]
}

resource "apstra_ipv4_pool" "spine_leaf_link_ips" {
        name = "spine_leaf_link_ips"
        subnets = [
                {
                        network = "192.168.0.0/16"
                },
        ]
}

resource "apstra_datacenter_resource_pool_allocation" "leaf_asns" {
        blueprint_id = apstra_datacenter_blueprint.Terraform-t-1.id
        role = "leaf_asns"
        pool_ids = [apstra_asn_pool.leaf_asns.id]
}

resource "apstra_datacenter_resource_pool_allocation" "spine_asns" {
        blueprint_id = apstra_datacenter_blueprint.Terraform-t-1.id
        role = "spine_asns"
        pool_ids = [apstra_asn_pool.spine_asns.id]
}

resource "apstra_datacenter_resource_pool_allocation" "spine_loopback_ips" {
        blueprint_id = apstra_datacenter_blueprint.Terraform-t-1.id
        role = "spine_loopback_ips"
        pool_ids = [apstra_ipv4_pool.spine_loopback_ips.id]
}

resource "apstra_datacenter_resource_pool_allocation" "spine_leaf_link_ips" {
        blueprint_id = apstra_datacenter_blueprint.Terraform-t-1.id
        role = "spine_leaf_link_ips"
        pool_ids = [apstra_ipv4_pool.spine_leaf_link_ips.id]
}

resource "apstra_datacenter_resource_pool_allocation" "leaf_loopback_ips" {
        blueprint_id = apstra_datacenter_blueprint.Terraform-t-1.id
        role = "leaf_loopback_ips"
        pool_ids = [apstra_ipv4_pool.leaf_loopback_ips.id]
}

output "print_bluePrint_id" {
        value = apstra_datacenter_blueprint.Terraform-t-1.id
}
