## This configuration was generated by terraform-provider-oci

resource oci_database_pluggable_database export_pluggable_database_1 {
  container_database_id = "ocid1.database.oc1.iad.anuwcljrdugb54qa4mjkp56hpm3p4wklhlarpus3bko64jdrwjsmeieeiemq"
  defined_tags = {
  }
  freeform_tags = {
    platform      = "Managed by Terraform"
    environment   = "dev"
    account_code  = "ITS"
  }
  #pdb_admin_password = <<Optional value not found in discovery>>
  pdb_name = "KENTPDBT01"
  #should_pdb_admin_account_be_locked = <<Optional value not found in discovery>>
  #tde_wallet_password = <<Optional value not found in discovery>>
}

resource oci_database_db_system export_kentcdbt01 {
  availability_domain = var.availability_domain--clNq-US-ASHBURN-AD-3
  #backup_network_nsg_ids = <<Optional value not found in discovery>>
  #backup_subnet_id = <<Optional value not found in discovery>>
  #cluster_name = <<Optional value not found in discovery>>
  compartment_id = var.compartment_ocid
  cpu_core_count = "1"
  data_collection_options {
    is_diagnostics_events_enabled = "false"
    is_health_monitoring_enabled  = "false"
    is_incident_logs_enabled      = "false"
  }
  data_storage_percentage = "80"
  data_storage_size_in_gb = "256"
  database_edition        = "ENTERPRISE_EDITION"
  db_home {
    #create_async = <<Optional value not found in discovery>>
    database {
      admin_password = "<placeholder for missing required attribute>" #Required attribute not found in discovery, placeholder value set to avoid plan failure
      #backup_id = <<Optional value not found in discovery>>
      #backup_tde_password = <<Optional value not found in discovery>>
      character_set = "AL32UTF8"
      #database_id = <<Optional value not found in discovery>>
      #database_software_image_id = <<Optional value not found in discovery>>
      db_backup_config {
        auto_backup_enabled = "false"
        auto_backup_window  = ""
        #recovery_window_in_days = <<Optional value not found in discovery>>
      }
      #db_domain = <<Optional value not found in discovery>>
      db_name     = "DBT01"
      db_workload = "OLTP"
      defined_tags = {
        "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hankwojteczko@davidkentconsulting.com"
        "Oracle-Tags.CreatedOn" = "2022-12-19T15:22:28.696Z"
      }
      freeform_tags = {
      }
      #kms_key_id = <<Optional value not found in discovery>>
      #kms_key_version_id = <<Optional value not found in discovery>>
      ncharacter_set = "AL16UTF16"
      pdb_name       = "KENTPDBT01"
      #tde_wallet_password = <<Optional value not found in discovery>>
      #time_stamp_for_point_in_time_recovery = <<Optional value not found in discovery>>
      #vault_id = <<Optional value not found in discovery>>
    }
    #database_software_image_id = <<Optional value not found in discovery>>
    db_version = "19.17.0.0"
    #defined_tags = <<Optional value not found in discovery>>
    display_name = "dbhome20221219152229"
    freeform_tags = {
    }
  }
  db_system_options {
    storage_management = "ASM"
  }
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hankwojteczko@davidkentconsulting.com"
    "Oracle-Tags.CreatedOn" = "2022-12-19T15:22:27.551Z"
  }
  disk_redundancy = "HIGH"
  display_name    = "kentcdbt01"
  domain          = "dbssub.dbsvcn.oraclevcn.com"
  fault_domains = [
    "FAULT-DOMAIN-3",
  ]
  freeform_tags = {
  }
  hostname = "kentdbt01"
  #kms_key_id = <<Optional value not found in discovery>>
  #kms_key_version_id = <<Optional value not found in discovery>>
  license_model = "BRING_YOUR_OWN_LICENSE"
  #maintenance_window_details = <<Optional value not found in discovery>>
  node_count = "1"
  #nsg_ids = <<Optional value not found in discovery>>
  #private_ip = <<Optional value not found in discovery>>
  reco_storage_size_in_gb = "256"
  shape                   = "VM.Standard.E4.Flex"
  source                  = "NONE"
  #source_db_system_id = <<Optional value not found in discovery>>
  #sparse_diskgroup = <<Optional value not found in discovery>>
  ssh_public_keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDL8gQX4afW9tLDKFZPsQ6Qtc57mnXLecCb9Mc7k8GCjsIdNx3dAy/Sw0BbdidmVhuDRx8g+SyHDTQIBkpRUdrjojhHBSUrw8BTUszQUONO5uurb/yT7OGSRa4z8wBkMTeZVwCdvxENm55mPtU02CvkvIf226V5MakZrzTlqEm3ok/gldrMwcJtGzCIsiznw6ipAzSOyA+OcWetP47toO99UA1Qm0dfwqgeam5jffUGszweUZXii0Sl0PQO2c3G3VM63F2ZOemrHVF2hWolSTC14RbSE1ahSH4N8XDO2Q5HqrVBHkDGZIOmLAMdDX1LDr5ZnTWUJX/yKcZYukOqrFu9VSqjG21foZUR8IuZJT+acZl2VJg7I/j/LOZxk5VUV69vaGhxiz2MK652mR/d7jUjfgPtJlXc77XkT6zBzMIB0S53wMSaenesFxx9ZlxFLPwPtYV31zTGQ5o0bW46YAQz74cfLYxDIobnUhiR0i8oTUPBxV1rwih/Eh2wJP0Noyc= opc@kentbast01",
  ]
  storage_volume_performance_mode = "HIGH_PERFORMANCE"
  subnet_id                       = oci_core_subnet.export_dbs_sub.id
  time_zone                       = "UTC"

  # Required attributes that were not found in discovery have been added to lifecycle ignore_changes
  # This is done to avoid terraform plan failure for the existing infrastructure
  lifecycle {
    ignore_changes = [db_home[0].database[0].admin_password]
  }
}

