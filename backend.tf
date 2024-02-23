terraform {
  backend "s3" {
    endpoints                   = { s3 = "https://fra1.digitaloceanspaces.com" }
    bucket                      = "tfstate-air"
    key                         = "terraform.tfstate"
    region                      = "fra1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_get_ec2_platforms      = true
    skip_s3_checksum            = true
  }
}
