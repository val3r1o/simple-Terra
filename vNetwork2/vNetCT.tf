
data "apstra_datacenter_blueprint" "pod1" {
  name = "dc1"
}

  resource "apstra_datacenter_routing_zone" "BLUE-VRF" {
    name         = "blue-terra"
    blueprint_id = data.apstra_datacenter_blueprint.pod1.id
    vni          = 500010
  }

data "apstra_datacenter_systems" "leafs" {
    blueprint_id = data.apstra_datacenter_blueprint.pod1.id
    filters = [
      {
      role        = "leaf"
      system_type = "switch"
    }
   ]
  }

  data "apstra_datacenter_virtual_network_binding_constructor" "vnet_bindng_constructor" {
    blueprint_id = data.apstra_datacenter_blueprint.pod1.id
    switch_ids   = data.apstra_datacenter_systems.leafs.ids
  }


data "apstra_datacenter_virtual_network_binding_constructor" "vlan100" {
  blueprint_id = data.apstra_datacenter_blueprint.pod1.id
  vlan_id      = 100 
  switch_ids   = [ one(data.apstra_datacenter_systems.leafs.ids)]
}

resource "apstra_datacenter_virtual_network" "vlan100" {
  name                         = "VLAN-100"
  blueprint_id                 = data.apstra_datacenter_blueprint.pod1.id
  type                         = "vxlan"
  routing_zone_id              = apstra_datacenter_routing_zone.BLUE-VRF.id
  ipv4_connectivity_enabled    = true
  ipv4_virtual_gateway_enabled = true
  ipv4_virtual_gateway         = "10.0.100.1"
  ipv4_subnet                  = "10.0.100.0/24"
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.vlan100.bindings
}

//Create VLAN 100 CT :

data "apstra_datacenter_virtual_networks" "getvlan100" {
  depends_on = [
  apstra_datacenter_virtual_network.vlan100,
  apstra_datacenter_generic_system.FW,
  ] // needed otherwise data source will run too early
  blueprint_id = apstra_datacenter_blueprint.pod1.id
  filters = [
  {
    name = "VLAN-100"
  },
  ]
}

data "apstra_datacenter_ct_virtual_network_single" "taggedvlan100" {
    vn_id = tolist(data.apstra_datacenter_virtual_networks.getvlan100.ids)[0]
    tagged = true
}

resource "apstra_datacenter_connectivity_template" "CTvlan100" {
  blueprint_id = apstra_datacenter_blueprint.terraform-pod1.id
  name         = "VLAN-100-Tagged"
  description  = "VLAN-100-Tagged"
  primitives   = [
    data.apstra_datacenter_ct_virtual_network_single.taggedvlan100.primitive
  ]
}
