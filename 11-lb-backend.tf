# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_health_check
# Resource: global Health Check
resource "google_compute_health_check" "lb" {
  name                = "lb-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_backend_service
# Resource: global Backend Service
resource "google_compute_backend_service" "lb" {
  name                  = "lb-backend-service"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  health_checks         = [google_compute_health_check.lb.self_link]
  port_name             = "webserver"
  backend {
    group                 = google_compute_region_instance_group_manager.region_a.instance_group
    capacity_scaler       = 1.0
    balancing_mode        = "RATE"
    max_rate_per_instance = 10
  }
  backend {
    group                 = google_compute_region_instance_group_manager.region_b.instance_group
    capacity_scaler       = 1.0
    balancing_mode        = "RATE"
    max_rate_per_instance = 10
  }
}