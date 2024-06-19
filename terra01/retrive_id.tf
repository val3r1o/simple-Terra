
data "apstra_datacenter_blueprint" "terra" {
  name = "dc1"
}

#retrive information
#This example outputs a set of graph db node IDs representing

data "apstra_datacenter_systems" "pod1" {
  blueprint_id = apstra_datacenter_blueprint.terra.id
}

output "pod1" {
  value = data.apstra_datacenter_systems.pod1.ids
}
