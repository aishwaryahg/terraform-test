#create network and subnetwork
resource "google_compute_network" "network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

 

resource "google_compute_subnetwork" "subnetwork" {
  name          = "my-subnetwork"
  network       = google_compute_network.network.id
  ip_cidr_range = "10.0.0.0/24"
}

 

#create a virtual machine
resource "google_compute_instance" "myinstance" {
    name = "my-vm-instance"
    machine_type =  "n1-standard-1"
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
        labels = {
            my_label = "test-vm"
        }
      }
    }
    network_interface {
      network = "my-network"
      subnetwork = google_compute_subnetwork.subnetwork.self_link
    }
}
