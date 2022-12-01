## This configuration was generated by terraform-provider-oci

/*
The availability domains will be specific to the tenancy and region. You should
build this per the reference with the command:

tf-oci -command=export -compartment_id=<tenancy-ocid> -services=availability_domain -output_path=.

We have found that subsequent actions used to generate the terraform state will fail if you
specify a path other than the working directory, aka '.' . Do not specify any path other
than the working directory when running this command. Do make sure you have setup the
backend storage in 001_main.tf prior to running the above.
*/

data oci_identity_availability_domain export_clNq-US-ASHBURN-AD-1 {
  compartment_id = var.compartment_ocid
  ad_number      = "1"
}
data oci_identity_availability_domain export_clNq-US-ASHBURN-AD-2 {
  compartment_id = var.compartment_ocid
  ad_number      = "2"
}
data oci_identity_availability_domain export_clNq-US-ASHBURN-AD-3 {
  compartment_id = var.compartment_ocid
  ad_number      = "3"
}

/*

References:
https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-resource-discovery-setup/01-summary.htm

*/