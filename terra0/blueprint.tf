




# This example outputs a list of blueprint IDs
data "apstra_blueprints" "dc1" {
  reference_design = "datacenter" // optional filter argument
}

output "apstra_blueprints" {
  value = data.apstra_blueprints.dc1
}

output "print_bluePrint_id" {
        value = apstra_datacenter_blueprint.dc1.id
}
