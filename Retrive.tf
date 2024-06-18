#retrive information
#This example outputs a set of graph db node IDs representing

data "apstra_datacenter_systems" "dc1" {
  blueprint_id = c76d3c1f-bfc8-4aae-b27b-d2ec6369331e
}

output "dc1" {
  value = data.apstra_datacenter_systems.dc1.ids
}

data "apstra_datacenter_virtual_network_binding_constructor" "terra_test" {
  blueprint_id = "c76d3c1f-bfc8-4aae-b27b-d2ec6369331e"
  vlan_id      = 2 // optional; default behavior allows Apstra to choose
  switch_ids   = ["leaf1", "leaf2", "sys001"]
}

