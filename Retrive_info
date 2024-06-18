#retrive information
# This example outputs a set of graph db node IDs representing

# Terraform provder apstra
terraform {
        required_providers {
                apstra = {
                        source = "Juniper/apstra"
                        version = "0.58.2"
                }
        }
}

# Apstra Provider Details
provider "apstra" {
  url                     = "https://admin:VictoriousJackal2%5E@172.20.114.3"
  tls_validation_disabled = true                         # optional
  blueprint_mutex_enabled = false
  experimental            = true
  api_timeout             = 0                            # optional; 0 == infinite

}

data "apstra_datacenter_systems" "pod2_nonprod_leafs" {
  blueprint_id = Valerio_Martini_08968_Jun_SE_Demo_4211_c07775c1345e - evpn-vex-virtual
  filters = [
    {
      role        = "leaf"
      system_type = "switch"
      tag_ids     = ["pod2", "dev"]
    },
  ]
}

output "pod2_nonprod_leafs" {
  value = data.apstra_datacenter_systems.pod2_nonprod_leafs.ids
}

data "apstra_datacenter_virtual_network_binding_constructor" "example" {
  blueprint_id = "Valerio_Martini_08968_Jun_SE_Demo_4211_c07775c1345e - evpn-vex-virtual"
  vlan_id      = 5 // optional; default behavior allows Apstra to choose
  switch_ids   = [ "leaf1", "leaf2", "leaf3"]
}
