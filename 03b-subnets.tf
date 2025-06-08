resource "google_compute_subnetwork" "region_b" {
  name                     = "south"
  ip_cidr_range            = "10.92.128.0/24"
  region                   = "us-south1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}
