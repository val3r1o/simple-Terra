#retrive information
#This example outputs a set of graph db node IDs representing

data "apstra_datacenter_systems" "pod1" {
  blueprint_id = "c76d3c1f-bfc8-4aae-b27b-d2ec6369331e"
}

output "pod1" {
  value = data.apstra_datacenter_systems.pod1.ids
}

# --

data "apstra_datacenter_virtual_network_binding_constructor" "dc1" {
  blueprint_id = "c76d3c1f-bfc8-4aae-b27b-d2ec6369331e"
  # vlan_id      = 5 // optional; default behavior allows Apstra to choose
  switch_ids   = ["leaf1", "leaf2", "leaf3"]
}
