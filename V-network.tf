resource "apstra_datacenter_virtual_network" "terra-test" {
  name                         = "test"
  blueprint_id                 = "dc1"
  type                         = "vxlan"
  routing_zone_id              = "red"
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "192.168.10.1"
  ipv4_subnet                  = "192.168.10.0/24"
  bindings = {
    "leaf-a" = {
      "access_ids" = [ "leaf1", "leaf2" ]
    },
    "leaf-b" = {
      "access_ids" = []
    }
  }
}
