terraform {

	backend "http" {
		address = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/6VPJ4QelMOdUyHMVtZ3IFe-fXawu7o65okE30IGAe3vo06WI6mQo1JH86Hm_0jHa/n/idp6wbidjntn/b/wojteczko_tf_poc/o/dbs_comp.tfstate"
		# address = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/Oe6HuLvwOlSLYp8HOciIl1uM6-dlCeDi1289048fBdY5AWkb0O_m2gCe4J1sum/n/idp6wbidjntn/b/example_tf_poc/o/dbs_comp.tfstate"
		update_method = "PUT"
	}	

}

# provider oci {
# 	region = var.region
# }
