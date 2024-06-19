
# Instantiate a blueprint from the previously-created template
  resource "apstra_datacenter_blueprint" "terra" {
    name        = "dc1"
    template_id = apstra_template_rack_based.selected.id
  }

  #ROUTING-ZONE
  resource "apstra_datacenter_routing_zone" "blue" {
    name         = "blue"
    blueprint_id = apstra_datacenter_blueprint.terra.id
    vni          = 60000
  
  }

data "apstra_datacenter_systems" "leafs" {
    blueprint_id = apstra_datacenter_blueprint.terra.id
    filters = [
      {
      role        = "leaf"
      system_type = "switch"
    }
   ]
  }
  
  data "apstra_datacenter_virtual_network_binding_constructor" "vnet_bindng_constructor" {
    blueprint_id = apstra_datacenter_blueprint.terra.id
    switch_ids   = data.apstra_datacenter_systems.leafs.ids
  }
  
  resource "apstra_datacenter_virtual_network" "app_networks" {
    name                         = "test-vn"
    blueprint_id                 = apstra_datacenter_blueprint.terra.id
    type                         = "vxlan"
    routing_zone_id              = apstra_datacenter_routing_zone.blue.id
    ipv4_connectivity_enabled    = true
    ipv4_virtual_gateway_enabled = true
    bindings                     = data.apstra_datacenter_virtual_network_binding_constructor.vnet_bindng_constructor.bindings
  }
