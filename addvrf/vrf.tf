
# This example creates a routing zone within an
# existing datacenter blueprint.

resource "apstra_datacenter_routing_zone" "blue" {
  name         = "vrf blue"
  blueprint_id = "c76d3c1f-bfc8-4aae-b27b-d2ec6369331e"
  vlan_id      = 5                                    # optional
  vni          = 5000                                 # optional
  dhcp_servers = ["192.168.100.10", "192.168.200.10"] # optional
  #  routing_policy_id = "<routing-policy-node-id-goes-here>" # optional
}
