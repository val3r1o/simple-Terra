
data "apstra_datacenter_blueprint" "terra" {
  name = "Cisco-DC1"
}

  resource "apstra_datacenter_routing_zone" "blue" {
    name         = "blue-terra"
    blueprint_id = data.apstra_datacenter_blueprint.terra.id
    vni          = 500010

  }

data "apstra_datacenter_systems" "leafs" {
    blueprint_id = data.apstra_datacenter_blueprint.terra.id
    filters = [
      {
      role        = "leaf"
      system_type = "switch"
    }
   ]
  }

  data "apstra_datacenter_virtual_network_binding_constructor" "vnet_bindng_constructor" {
    blueprint_id = data.apstra_datacenter_blueprint.terra.id
    switch_ids   = data.apstra_datacenter_systems.leafs.ids
  }

  resource "apstra_datacenter_virtual_network" "app_networks" {
    name                         = "terraa-vni"
    blueprint_id                 = data.apstra_datacenter_blueprint.terra.id
    type                         = "vxlan"
    routing_zone_id              = apstra_datacenter_routing_zone.blue.id
    ipv4_connectivity_enabled    = true
    ipv4_virtual_gateway_enabled = true
    reserve_vlan                 = yes
    vni                          = 10000010
    bindings                     = data.apstra_datacenter_virtual_network_binding_constructor.vnet_bindng_constructor.bindings
  }
