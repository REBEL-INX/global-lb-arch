# https://developer.hashicorp.com/terraform/language/values/outputs

output "lb_static_ip_address" {
  description = "The static IP address of the global load balancer."
  value       = "http://${google_compute_global_address.lb.address}"
}

# https://developer.hashicorp.com/terraform/language/functions/join
output "zones" {
  description = "Comma-separated compute zones"
  # convert set into string delimited by commas (CSV) before output
  value = {
    region_a = join(", ", data.google_compute_zones.region_a.names)
    region_a = join(", ", data.google_compute_zones.region_b.names)
  }
}
