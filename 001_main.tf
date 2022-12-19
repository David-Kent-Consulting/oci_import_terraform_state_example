terraform {

	backend "http" {
		address = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/qUKcDpQ9-WyGmfZjVBa-xf7ezGKqKJ17aagHgQNjDa66CrqeYNSZvas450u8QTMY/n/idp6wbidjntn/b/wojteczko_tf_poc/o/dbs_comp.tfstate"
		# address = "https://objectstorage.us-ashburn-1.oraclecloud.com/p/Oe6HuLvwOlSLYp8HOciIl1uM6-dlCeDi1289048fBdY5AWkb0O_m2gCe4J1sum/n/idp6wbidjntn/b/example_tf_poc/o/dbs_comp.tfstate"
		update_method = "PUT"
	}	

}

# provider oci {
# 	region = var.region
# }
