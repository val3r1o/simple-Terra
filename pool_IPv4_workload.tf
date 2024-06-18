
## Create an IPv4 resource pool according to the instructions in the lab guide.
resource "apstra_ipv4_pool" "lab_guide" {
  name = "apstra-pool"
  subnets = [
    { network = "192.168.100.0/24" },
    { network = "192.168.101.0/24" },
  ]
}

