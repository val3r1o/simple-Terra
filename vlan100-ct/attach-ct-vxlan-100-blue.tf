
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

resource "apstra_datacenter_connectivity_template_assignment" "ASSIGN" {
  blueprint_id               = data.apstra_datacenter_blueprint.POD1.id
  application_point_id       = "FkYtMBdeoJ5urBaIEi8"
  connectivity_template_ids   = [
    "bcbcb35f-8f23-4bfb-916e-1b21d07d6904",
    "1f8ac61f-6996-42bb-a34f-4f4a50a7111a",
  ]
}
