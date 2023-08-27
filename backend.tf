terraform {
  backend "s3" {
    endpoint                    = "https://terr-state.fra1.digitaloceanspaces.com"
    bucket                      = "tf-store"
    key                         = "terraform-test.tfstate"
    region                      = "fra1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
