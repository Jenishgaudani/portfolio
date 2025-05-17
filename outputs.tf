output "website_url" {
    value = "http://${google_storage_bucket.personal_site.name}.storage.googleapis.com/index.html"
}