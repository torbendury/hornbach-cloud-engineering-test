
# Cloud Run Frontend
resource "google_cloud_run_service" "frontend" {
  name     = "${var.project_id}-frontend"
  location = var.region

  template {
    spec {
      containers {
        image = var.frontend_image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Cloud Run Backend
resource "google_cloud_run_service" "backend" {
  name     = "${var.project_id}-backend"
  location = var.region

  template {
    spec {
      containers {
        image = var.backend_image
        env {
          name  = "FIRESTORE_PROJECT_ID"
          value = var.project_id
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
