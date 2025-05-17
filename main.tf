provider "google" {
  credentials = file("jenishwebsite-460023-8c2ab0a45d45.json")
  project = "jenishwebsite-460023"
  region  = "us-central1"
}

resource "google_storage_bucket" "personal_site" {
  name          = "jenishwebsite-460023-portfolio"
  location      = "US"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.personal_site.name

  role = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}

resource "google_storage_bucket_object" "index" {
  name   = "index.html"
  bucket = google_storage_bucket.personal_site.name
  source = "website-files/index.html"
  content_type = "text/html"
}

