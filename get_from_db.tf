resource "google_storage_bucket_object" "get-from-db" {
  name   = "get-from-db.zip"
  bucket = "${google_storage_bucket.bucket.name}"
  source = "./functions/get-from-db.zip"
}

resource "google_cloudfunctions_function" "get-from-db" {
  name = "get-from-db"
  description = "Fetching from MongoDB"
  available_memory_mb = 128
  trigger_http = true
  timeout = 60
  entry_point = "get_from_db"
  runtime = "python37"
  source_archive_bucket = "${google_storage_bucket.bucket.name}"
  source_archive_object = "${google_storage_bucket_object.get-from-db.name}"
  environment_variables = {
    user_name = "${var.MONGODB_USERNAME}"
    user_pass = "${var.MONGODB_PASSWORD}"
    ip = "${var.service}"
  }
}
