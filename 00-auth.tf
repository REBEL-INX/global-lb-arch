# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project     = "gcp-01-453500"
  region      = "us-central1"
  credentials = "key.json"
}
