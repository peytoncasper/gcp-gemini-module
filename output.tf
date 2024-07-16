output "gemini_service_account_key_json" {
  value = google_service_account_key.gemini_service_account_key.private_key
}