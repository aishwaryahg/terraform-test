terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project     = "terraform-on-gcp-388710"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = file("C:\\terraform\\credentials.json")
}
