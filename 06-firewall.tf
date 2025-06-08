# For main VPC
resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name
  # direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

#  Allow Wed trafic Firewall rule
resource "google_compute_firewall" "allow_web" {
  name        = "allow-web-traffic"
  network     = google_compute_network.main.name
  description = "HTTP traffic for NGNX re"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "icmp" {
  name        = "icmp"
  network     = google_compute_network.main.name
  description = "Allow ICMP"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}
