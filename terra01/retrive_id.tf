
# Instantiate a blueprint from the previously-created template
  resource "apstra_datacenter_blueprint" "terra" {
    name        = "dc1"
    template_id = apstra_template_rack_based.terra.id
  }

#retrive information
#This example outputs a set of graph db node IDs representing

data "apstra_datacenter_systems" "pod1" {
  blueprint_id = "c76d3c1f-bfc8-4aae-b27b-d2ec6369331e"
}

output "pod1" {
  value = data.apstra_datacenter_systems.pod1.ids
}
