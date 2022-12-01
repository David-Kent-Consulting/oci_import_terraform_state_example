terraform {

	backend "http" {
		address = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/Oe6HuLvwOlSLYp8H0v5iQOciIl1uM6-dlCeDip0bIBBdY5AWkb0O_m2gCe4J1sum/n/idp6wbidjntn/b/wojteczko_tf_poc/o/dbs_comp.tfstate"
		update_method = "PUT"
	}	

}

# provider oci {
# 	region = var.region
# }
