# Create an ASN resource pool according to the instructions in the lab guide.
resource "apstra_asn_pool" "lab_guide" {
  name = "vpod-evpn-asn-pool"
  ranges = [
    {
      first = 65000
      last  = 65100
    }
  ]
}
