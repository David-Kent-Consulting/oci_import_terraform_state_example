Working Example to Generate Terrasform State From Existing OCI Infrastructure
=============================================================================
The purpose of this code is to demonstrate the correct practices to generate a terraform state file from existing OCI cloud resources and to
write the state to a storage bucket within OCI.

By: Hank Wojteczko
    Practice Manager - Cloud Professional Services, 
    David Kent Consulting, Inc.
    hankwojteczko@davidkentconsulting.com

Created On: 05-December-2022

Last Modified: n/a

LICENSE REQUIREMENTS
====================
The repository is open to the community and is considered open source under the GNU General Public License Agreement. The programs contained herein are free software; you can redistribute it and/or modify them under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. This code is provided without warranty.
You agree by using this code that you do so at your own risk.

WARNING!
========
Users of this code and/or examples should have at least intermediate experience working with Terraform, and advanced experience working with 
OCI. Incorrect use of Terraform, loss of the terrafor state file, and incorrect use of credentials could cause irrevocable and unrepairable 
damage to cloud resources. Be certain that you take appropriate measures to protect your cloud systems (backups, documentation, etc.) prior 
to use of this example. We also highly advocate that you practice in a sandbox tenancy prior to using this example and/or code to
generate a terraform state in production.

REQUIREMENTS
============
The following requirements are based on when these examples were created as of 05-December-2022. Technology changes fast, so be certain to
consider testing at more current versions.

| Package                           |  Version      |  Source                                                                                                       |
|-----------------------------------|---------------|---------------------------------------------------------------------------------------------------------------|
| Docker Desktop                    | 12.10.21      | https://www.docker.com/products/docker-desktop/                                                               |
| Oracle Linux (container image)    | 8.7.0         | https://hub.docker.com/_/oraclelinux                                                                          |
| Python                            | 3.6 or later  | Install in Linux container                                                                                    |
| PIP3                              | 21.3.1        | Install in Linux container                                                                                    |
| OCI CLI                           | 3.20.3        | https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm                                         |
| OCI Python SDK                    | 2.88.2        | Install in Linux container                                                                                    |
| wget                              | Distro        | Install in Linux container                                                                                    |
| unzip                             | Distro        | Install in Linux container                                                                                    |
| Terraform                         | 1.3.6 or later| https://developer.hashicorp.com/terraform/downloads                                                           |
| OCI Terraform Plug-in             | 4.100.0       | https://releases.hashicorp.com/terraform-provider-oci/4.100.0/terraform-provider-oci_4.100.0_linux_386.zip    |

FILES IN THIS REPOSITORY
========================


PROCEDURE
=========
1. Build the docker container image using the supplied Dockerfile. Make sure the terraform.zip file you
   downloaded from hashicorp is located in the same directory as the Dockerfile.
2. Start the container image.
3. Establish a shell to the container image.
4. Run 'oci setup config' and create the PEM files.
5. Create an API key in OCI for the service user that will own the Terraform state file.
6. Test OCI connectivity with 'oci iam user list'
7. Test the Terraform OCI plug-in with 'tf-oci' and verify that the version 4.100.0 prints to standard out.
8. Modify the .bash_profile file as shown below:
   export TF_VAR_tenancy_ocid=<your tenancy ODIC>
   export TF_VAR_user_ocid=<service user OCID>
   export TF_VAR_fingerprint=<fingerprint of the API key created in step 4>
   export TF_VAR_private_key_path=~/.oci
   export TF_VAR_region=<region where this terraform code will pull the state from>
9.  Get the compartment's OCID and export it as a memory variable in the shell, such as child_compartment
10. Create a directory and change to it.
11. Create a storage bucket in OCI.
12. Create a pre-authenticated request with read-write access to the bucket.
13. Copy the pre-authenticated request and test access to it using curl.
14. Modify the 001_main.tf file provided in this repo with the full URL to the
    pre-authenticated request URL and add to it the name of the key file you will be
    storing the terraform state key file to.
15. Run 'terraform init' and ensure it runs without error.
16. Run 'terraform apply --auto-approve' and make sure it completes without error.
17. Check the storage bucket for the newly created key file.
18. Get the availability domains with the command:
    tf-oci -command=export -compartment_id=$child_compartment -services=availability_domain -output_path=.
19. Run an ls and verify that the files availability_domain.tf, provider.tf,vars.tf were created.
20. Create files for the complete state for all resources in the compartment. For example, to import all objects
    for network, compute, database, and file storage, you would run:
    tf-oci -command=export -compartment_id=$child_compartment -services=availability_domain,core,database,file_storage -output_path=.
21. List the files that were generated.
22. Repeat the above command, except add the "generate_state" option. LEAVE OUT the service availability_domain
    from the command:
    tf-oci -command=export -compartment_id=$child_compartment -services=core,database,file_storage -output_path=. -generate_state
23. Run 'terraform validate' and make sure there are no errors.
24. Run 'terraform plan' and ensure all resources have added.
    CAVEAT: It may be necessary to manually import a few resources into the terraform state. You MUST
    import each resource manually and then re-run 'terraform plan'. The terraform state is not
    complete until terraform reports that the state and cloud infrastructure are the same with the following message:
    "No changes. Your infrastructure matches the configuration."

    CAVEAT: You must backup and version your terraform state key file.
            You must always use terraform to manage the cloud infrastructure from this point forward.
            DO NOT make changes to cloud infrastructure with CLI or the OCI console other than
            starting/stopping resources. Damage to cloud resources and corruption to the terraform
            state key file may result from such actions.

REFERENCES
==========

Install Docker:
https://docs.docker.com/engine/install/

Get Started with OCI CLI
https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm

Setup OCI for Terraform
https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-provider/01-summary.htm 

OCI Terraform plug-in to use for resource discovery
https://registry.terraform.io/providers/oracle/oci/latest/docs/guides/resource_discovery#use-cases-and-benefits

OCI SDK for Python
https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/pythonsdk.htm

Hashicorp Terraform Downloads
https://developer.hashicorp.com/terraform/downloads
