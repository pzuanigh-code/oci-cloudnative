# LICENSE UPL 1.0
#
# Copyright (c) 2019 Oracle and/or its affiliates. All rights reserved.
# 
output "Mushop" {
  value = "http://${data.oci_core_vnic.mushop_vnic.public_ip_address}"
}

output "autonomous_database_password" {
  value = "${random_string.autonomous_database_wallet_password.result}"
}

output "dev" {
  value = "Made with \u2764 by Oracle A-Team"
}


