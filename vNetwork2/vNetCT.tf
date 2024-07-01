
data "apstra_datacenter_blueprint" "POD1" {
  name = "Cisco-DC1"
}

resource "apstra_datacenter_routing_zone" "BLUE-VRF" {
  name         = "blue-terra"
  blueprint_id = data.apstra_datacenter_blueprint.POD1.id
  vni          = 500010
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

data "apstra_datacenter_virtual_network_binding_constructor" "VNET-BIND" {
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
  bindings = data.apstra_datacenter_virtual_network_binding_constructor.VNET-BIND.bindings
}

// resource "apstra_datacenter_generic_system" "GEN-SYS" {
//  blueprint_id      = data.apstra_datacenter_blueprint.POD1.id
//  name              = "sys101"
//  hostname          = "sys101"
//  links = [
//    {
//      tags                          = ["SERVER"]
//      lag_mode                      = "lacp_active"
//      target_switch_id              = tolist(data.apstra_datacenter_systems.LEAVES.ids) [0] // first switch
//      target_switch_if_name         = "et-0/0/2"
//      target_switch_if_transform_id = 1
//      group_label                   = "bond0"
//    },
//    {
//      tags                          = ["SERVER"]
//      lag_mode                      = "lacp_active"
//      target_switch_id              = tolist(data.apstra_datacenter_systems.LEAVES.ids) [1] // second switch
//      target_switch_if_name         = "et-0/0/2"
//      target_switch_if_transform_id = 1
//      group_label                   = "bond0"
//    },
//  ]
//}

//Create VLAN 100 CT :

data "apstra_datacenter_virtual_networks" "GETVLAN100" {
  //depends_on = [
  //apstra_datacenter_virtual_network.VLAN100,
  //apstra_datacenter_generic_system.GEN-SYS,
  //] // needed otherwise data source will run too early
  blueprint_id = data.apstra_datacenter_blueprint.POD1.id
  filters = [
  {
    name = "vxlan-100-blue"
  },
  ]
}

data "apstra_datacenter_ct_virtual_network_single" "TAGVLAN100" {
    vn_id = tolist(data.apstra_datacenter_virtual_networks.GETVLAN100.ids)[0]
    tagged = true
}

resource "apstra_datacenter_connectivity_template" "CTVLAN100" {
  blueprint_id = data.apstra_datacenter_blueprint.POD1.id
  name         = "vxlan-100-blue"
  description  = "vxlan-100-blue"
  primitives   = [
    data.apstra_datacenter_ct_virtual_network_single.TAGVLAN100.primitive
  ]
}

resource "apstra_datacenter_connectivity_templates_assignment" "ASSIGN-CT-LEAF1" {
  blueprint_id              = apstra_datacenter_blueprint.POD1.id
  application_point_id      = one(data.apstra_datacenter_systems.LEAF11.ids)
}

resource "apstra_datacenter_connectivity_templates_assignment" "ASSIGN-CT-LEAF2" {
  blueprint_id              = apstra_datacenter_blueprint.POD1.id
  application_point_id      = one(data.apstra_datacenter_systems.LEAF2.ids)
  connectivity_template_ids = [
    apstra_datacenter_connectivity_template.ct_default_route.id,
    ]
}
