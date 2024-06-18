resource "apstra_datacenter_virtual_network" "terra-test" {
  name                         = "test"
  blueprint_id                 = "Valerio_Martini_08968_Jun_SE_Demo_4211_c07775c1345e - evpn-vex-virtual"
  type                         = "vxlan"
  routing_zone_id              = "red"
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "192.168.10.1"
  ipv4_subnet                  = "192.168.10.0/24"
  bindings = {
    "leaf-a" = {
      "access_ids" = [ "access-a-1", "access-a-2" ]
    },
    "leaf-b" = {
      "access_ids" = []
    }
  }
}
