data "apstra_datacenter_blueprint" "POD1" {
  name = "DC-1"
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

resource "apstra_datacenter_generic_system" "GEN-SYS" {
  blueprint_id      = data.apstra_datacenter_blueprint.POD1.id
  name              = "Sys101"
  hostname          = "Sys101"
  links = [
    {
      tags                          = ["SERVER"]
      lag_mode                      = "lacp_active"
      target_switch_id              = tolist(data.apstra_datacenter_systems.LEAVES.ids) [0] // first switch
      target_switch_if_name         = "et-0/0/10"
      target_switch_if_transform_id = 1
      group_label                   = "bond0"
    },
    {
      tags                          = ["SERVER"]
      lag_mode                      = "lacp_active"
      target_switch_id              = tolist(data.apstra_datacenter_systems.LEAVES.ids) [1] // second switch
      target_switch_if_name         = "et-0/0/10"
      target_switch_if_transform_id = 1
      group_label                   = "bond0"
    },
  ]
}
