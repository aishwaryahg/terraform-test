resource "google_storage_bucket" "bkt-dev" {
  count = var.env=="dev" ? 3 : 3
  name = "bktdev-gcpdev-tf00${count.index}"
  location = var.region
}

resource "google_storage_bucket" "bkt-prod" {
  count = var.env=="dev" ? 0 : 3
  name = "bktprod-gcpprod-tf00${count.index}"
  location = var.region
}
