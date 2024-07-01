
data "apstra_datacenter_blueprint" "POD1" {
  name = "Cisco-DC1"
}

data "apstra_datacenter_virtual_network" "VNET100" {
  blueprint_id = data.apstra_datacenter_blueprint.POD1.id
  name = "vxlan-100-blue"
}

data "apstra_datacenter_ct_virtual_network_single" "TAGVLAN100" {
  vn_id  = data.apstra_datacenter_virtual_network.VNET100.id
  tagged = false
}

resource "apstra_datacenter_connectivity_template" "CTVLAN100" {
  blueprint_id = data.apstra_datacenter_blueprint.POD1.id
  name         = "vxlan-100-blue"
  description  = "vxlan-100-blue"
  primitives   = [
    data.apstra_datacenter_ct_virtual_network_single.TAGVLAN100.primitive
  ]
}
