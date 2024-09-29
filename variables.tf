variable "project_id" {
  description = "The Hornbach project ID"
}

variable "region" {
  description = "The GCP region to deploy resources"
  default     = "europe-west3"
}

variable "frontend_image" {
  description = "The Docker image for the frontend application"
}

variable "backend_image" {
  description = "The Docker image for the backend application"
}

variable "db_password" {
  description = "The database password (to be stored in Secret Manager)"
  sensitive   = true
}