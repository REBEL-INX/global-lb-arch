# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
# https://cloud.google.com/compute/docs/regions-zones

resource "google_compute_subnetwork" "region_a" {
  name                     = "west"
  ip_cidr_range            = "10.92.28.0/24"
  region                   = "us-west1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}
