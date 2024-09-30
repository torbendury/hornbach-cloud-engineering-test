
# Cloud Monitoring and Logging
resource "google_monitoring_dashboard" "dashboard" {
  dashboard_json = jsonencode({
    displayName = "Application Dashboard"
    gridLayout = {
      columns = "2"
      widgets = [
        {
          title = "Frontend Requests"
          xyChart = {
            dataSets = [{
              timeSeriesQuery = {
                timeSeriesFilter = {
                  filter = "metric.type=\"run.googleapis.com/request_count\" resource.type=\"cloud_run_revision\" resource.label.\"service_name\"=\"${google_cloud_run_service.frontend.name}\""
                }
              }
            }]
          }
        },
        {
          title = "Backend Requests"
          xyChart = {
            dataSets = [{
              timeSeriesQuery = {
                timeSeriesFilter = {
                  filter = "metric.type=\"run.googleapis.com/request_count\" resource.type=\"cloud_run_revision\" resource.label.\"service_name\"=\"${google_cloud_run_service.backend.name}\""
                }
              }
            }]
          }
        }
      ]
    }
  })
}
