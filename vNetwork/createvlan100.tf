data "apstra_datacenter_blueprint" "POD1" {
  name = "Cisco-DC1"
}

resource "apstra_datacenter_routing_zone" "BLUE-VRF" {
  name         = "blue-terra"
  blueprint_id = data.apstra_datacenter_blueprint.POD1.id
  vlan_id      = 3900
  vni          = 10003900
}

data "apstra_datacenter_systems" "LEAVES" {
    blueprint_id = data.apstra_datacenter_blueprint.POD1.id
    filters = [
      {
      role        = "leaf"
      system_type = "switch"
    }
   ]
  }

data "apstra_datacenter_virtual_network_binding_constructor" "VNETBIND" {
  blueprint_id = data.apstra_datacenter_blueprint.POD1.id
  vlan_id      = 100 
  switch_ids   = data.apstra_datacenter_systems.LEAVES.ids
}

resource "apstra_datacenter_virtual_network" "VLAN100" {
  name                         = "vxlan-100-blue"
  blueprint_id                 = data.apstra_datacenter_blueprint.POD1.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.BLUE-VRF.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.0.100.1"
  ipv4_subnet                  = "10.0.100.0/24"
  vni                          = 10000100
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.VNETBIND.bindings
}
