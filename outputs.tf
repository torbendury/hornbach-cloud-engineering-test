output "frontend_url" {
  value = google_cloud_run_service.frontend.status[0].url
}

output "backend_url" {
  value = google_cloud_run_service.backend.status[0].url
}

output "load_balancer_ip" {
  value = google_compute_global_address.default.address
}
