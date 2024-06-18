## Create an IPv4 resource pool 
resource "apstra_ipv4_pool" "dc1" {
  name = "pool_IPv4_workload"
  subnets = [
    { network = "192.168.100.0/24" },
    { network = "192.168.101.0/24" },
  ]
}

