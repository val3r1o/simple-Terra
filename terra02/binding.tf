
data "apstra_datacenter_virtual_network_binding_constructor" "dc1" {
  blueprint_id = c76d3c1f-bfc8-4aae-b27b-d2ec6369331e
  vlan_id      = 5 // optional; default behavior allows Apstra to choose
  switch_ids   = [ "9GK8uFLZDIi3iB84t_g"]
}