resource "google_service_account" "gemini_service_account" {
  account_id   = "gemini-service-account-${var.sandbox_id}"
  display_name = "Service account for Gemini API"
}

resource "google_project_iam_binding" "gemini_vertex_api_binding" {
  project = var.project_id
  role    = "roles/aiplatform.user"

  members = [
    "serviceAccount:${google_service_account.gemini_service_account.email}"
  ]
}

resource "google_service_account_key" "gemini_service_account_key" {
  service_account_id = google_service_account.gemini_service_account.name
}
