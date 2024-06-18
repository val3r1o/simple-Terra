# Terraform export for vJunOS with apstra
terraform {
        required_providers {
                apstra = {
                        source = "Juniper/apstra"
                        version = "0.58.2"
                }
        }
}

# Apstra Provider Details
provider "apstra" {
  url                     = "https://admin:VictoriousJackal2%5E@172.20.114.3"
  tls_validation_disabled = true                         # optional
  blueprint_mutex_enabled = false
  experimental            = true
  api_timeout             = 0                            # optional; 0 == infinite

}
