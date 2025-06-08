# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router

# For Iowa
resource "google_compute_router" "region_a" {
  name    = "west-router"
  region  = "us-west1"
  network = google_compute_network.main.id
}
