# Create an ASN resource pool 
resource "apstra_asn_pool" "lab_test" {
  name = "pool_ASN_leaf_spine"
  ranges = [
    {
      first = 65000
      last  = 65100
    }
  ]
}
