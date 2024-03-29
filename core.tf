## This configuration was generated by terraform-provider-oci


resource oci_core_private_ip export_ocid1-dbnode-oc1-iad-anuwcljrdugb54qag45qqambh4jje2nrjlighsh3fmqdhxdugxdeprqm4dsq {
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hankwojteczko@davidkentconsulting.com"
    "Oracle-Tags.CreatedOn" = "2022-12-19T15:22:27.551Z"
  }
  display_name = "ocid1.dbnode.oc1.iad.anuwcljrdugb54qag45qqambh4jje2nrjlighsh3fmqdhxdugxdeprqm4dsq"
  freeform_tags = {
  }
  hostname_label = "kentdbt01"
  ip_address     = "172.16.0.45"
  #vlan_id = <<Optional value not found in discovery>>
  vnic_id = "ocid1.vnic.oc1.iad.abuwcljr2yjvu4xfyaxryowqwp3i4zzcdhiplvs7exh5u5zfwsjwzd7bip3q"
}

resource oci_core_private_ip export_privateip20221219210316 {
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "fssoc1prod"
    "Oracle-Tags.CreatedOn" = "2022-12-19T21:03:16.214Z"
  }
  display_name = "privateip20221219210316"
  freeform_tags = {
  }
  #hostname_label = <<Optional value not found in discovery>>
  ip_address = "172.16.0.49"
  #vlan_id = <<Optional value not found in discovery>>
  vnic_id = "ocid1.vnic.oc1.iad.abuwcljrmak2ocnlx3bflsig5732sfaw6kpb7dxcnyno3vygbsw4djqys42a"
}

resource oci_core_private_ip export_fss-1000000052291476 {
  defined_tags = {
  }
  display_name = "fss-1000000052291476"
  freeform_tags = {
  }
  #hostname_label = <<Optional value not found in discovery>>
  ip_address = "172.16.0.80"
  #vlan_id = <<Optional value not found in discovery>>
  vnic_id = "ocid1.vnic.oc1.iad.abuwcljrrqjtgex75qxkob5qplfhl5fxqmwk7q2gdhwdv2nboia63lvx3csa"
}

resource oci_core_private_ip export_kentemst01 {
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hankwojteczko@davidkentconsulting.com"
    "Oracle-Tags.CreatedOn" = "2022-12-19T15:12:38.539Z"
  }
  display_name = "kentemst01"
  freeform_tags = {
  }
  hostname_label = "kentemst01"
  ip_address     = "172.16.0.121"
  #vlan_id = <<Optional value not found in discovery>>
  vnic_id = "ocid1.vnic.oc1.iad.abuwcljtdxbs3cguyg7d5lkrvff33ti77wos2fuho4z57a2qi5g43lbldqba"
}

resource oci_core_private_ip export_privateip20221219210208 {
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "fssoc1prod"
    "Oracle-Tags.CreatedOn" = "2022-12-19T21:02:08.619Z"
  }
  display_name = "privateip20221219210208"
  freeform_tags = {
  }
  #hostname_label = <<Optional value not found in discovery>>
  ip_address = "172.16.0.173"
  #vlan_id = <<Optional value not found in discovery>>
  vnic_id = "ocid1.vnic.oc1.iad.abuwcljt5n2jh4xunpcmv3qpzsinii3zgeq7qxhs57jnbnpxutdid3a7rzka"
}

resource oci_core_private_ip export_fss-1000000052291476_1 {
  defined_tags = {
  }
  display_name = "fss-1000000052291476"
  freeform_tags = {
  }
  #hostname_label = <<Optional value not found in discovery>>
  ip_address = "172.16.0.184"
  #vlan_id = <<Optional value not found in discovery>>
  vnic_id = "ocid1.vnic.oc1.iad.abuwcljrmak2ocnlx3bflsig5732sfaw6kpb7dxcnyno3vygbsw4djqys42a"
}

resource oci_core_private_ip export_fss-3000000050559614 {
  defined_tags = {
  }
  display_name = "fss-3000000050559614"
  freeform_tags = {
  }
  #hostname_label = <<Optional value not found in discovery>>
  ip_address = "172.16.0.215"
  #vlan_id = <<Optional value not found in discovery>>
  vnic_id = "ocid1.vnic.oc1.iad.abuwcljtpd5srhpny437xo3i7hxjuocyrnbiobk32wgzomuacn5gth7ilwaa"
}

resource oci_core_private_ip export_fss-3000000050559614_1 {
  defined_tags = {
  }
  display_name = "fss-3000000050559614"
  freeform_tags = {
  }
  #hostname_label = <<Optional value not found in discovery>>
  ip_address = "172.16.0.235"
  #vlan_id = <<Optional value not found in discovery>>
  vnic_id = "ocid1.vnic.oc1.iad.abuwcljt5n2jh4xunpcmv3qpzsinii3zgeq7qxhs57jnbnpxutdid3a7rzka"
}

resource oci_core_instance export_kentemst01_1 {
  agent_config {
    are_all_plugins_disabled = "false"
    is_management_disabled   = "false"
    is_monitoring_disabled   = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Oracle Java Management Service"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "OS Management Service Agent"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Management Agent"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Custom Logs Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Run Command"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Block Volume Management"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }
  #async = <<Optional value not found in discovery>>
  availability_config {
    #is_live_migration_preferred = <<Optional value not found in discovery>>
    recovery_action = "RESTORE_INSTANCE"
  }
  availability_domain = var.availability_domain--clNq-US-ASHBURN-AD-2
  #capacity_reservation_id = <<Optional value not found in discovery>>
  compartment_id = var.compartment_ocid
  create_vnic_details {
    #assign_private_dns_record = <<Optional value not found in discovery>>
    assign_public_ip = "false"
    defined_tags = {
      "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hankwojteczko@davidkentconsulting.com"
      "Oracle-Tags.CreatedOn" = "2022-12-19T15:12:38.539Z"
    }
    display_name = "kentemst01"
    freeform_tags = {
    }
    hostname_label = "kentemst01"
    nsg_ids = [
    ]
    private_ip             = "172.16.0.121"
    skip_source_dest_check = "false"
    subnet_id              = oci_core_subnet.export_dbs_sub.id
    #vlan_id = <<Optional value not found in discovery>>
  }
  #dedicated_vm_host_id = <<Optional value not found in discovery>>
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "oracleidentitycloudservice/hankwojteczko@davidkentconsulting.com"
    "Oracle-Tags.CreatedOn" = "2022-12-19T15:12:38.342Z"
  }
  display_name = "kentemst01"
  extended_metadata = {
  }
  fault_domain = var.fault_domain--FAULT-DOMAIN-2
  freeform_tags = {
  }
  instance_options {
    are_legacy_imds_endpoints_disabled = "false"
  }
  #ipxe_script = <<Optional value not found in discovery>>
  #is_pv_encryption_in_transit_enabled = <<Optional value not found in discovery>>
  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "UEFI_64"
    is_consistent_volume_naming_enabled = "true"
    is_pv_encryption_in_transit_enabled = "false"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }
  metadata = {
    "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDL8gQX4afW9tLDKFZPsQ6Qtc57mnXLecCb9Mc7k8GCjsIdNx3dAy/Sw0BbdidmVhuDRx8g+SyHDTQIBkpRUdrjojhHBSUrw8BTUszQUONO5uurb/yT7OGSRa4z8wBkMTeZVwCdvxENm55mPtU02CvkvIf226V5MakZrzTlqEm3ok/gldrMwcJtGzCIsiznw6ipAzSOyA+OcWetP47toO99UA1Qm0dfwqgeam5jffUGszweUZXii0Sl0PQO2c3G3VM63F2ZOemrHVF2hWolSTC14RbSE1ahSH4N8XDO2Q5HqrVBHkDGZIOmLAMdDX1LDr5ZnTWUJX/yKcZYukOqrFu9VSqjG21foZUR8IuZJT+acZl2VJg7I/j/LOZxk5VUV69vaGhxiz2MK652mR/d7jUjfgPtJlXc77XkT6zBzMIB0S53wMSaenesFxx9ZlxFLPwPtYV31zTGQ5o0bW46YAQz74cfLYxDIobnUhiR0i8oTUPBxV1rwih/Eh2wJP0Noyc= opc@kentbast01"
  }
  #preserve_boot_volume = <<Optional value not found in discovery>>
  shape = "VM.Standard.E4.Flex"
  shape_config {
    baseline_ocpu_utilization = ""
    memory_in_gbs             = "8"
    nvmes                     = "0"
    ocpus                     = "1"
  }
  source_details {
    #boot_volume_size_in_gbs = <<Optional value not found in discovery>>
    boot_volume_vpus_per_gb = "10"
    #kms_key_id = <<Optional value not found in discovery>>
    source_id   = var.oci_core_instance--source_details-source_id--export_kentemst01_1
    source_type = "image"
  }
  state = "STOPPED"
}




