terraform {
  backend "s3" {
    endpoint                    = "https://tfstat-buck.fra1.digitaloceanspaces.com"
    bucket                      = "tfstat-buck"
    key                         = "terraform-test.tfstate"
    region                      = "fra1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
    workspaces {
      prefix = "airflow-"
    }
  }
}
