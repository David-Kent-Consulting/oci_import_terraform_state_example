terraform {

	backend "http" {
		address = "Your Storage Pre-Authentication URL plus the name of the terraform state key file. Below is an example"
		# address = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/Oe6HuLvwOlSLYp8HOciIl1uM6-dlCeDi1289048fBdY5AWkb0O_m2gCe4J1sum/n/idp6wbidjntn/b/example_tf_poc/o/dbs_comp.tfstate"
		update_method = "PUT"
	}	

}

# provider oci {
# 	region = var.region
# }
