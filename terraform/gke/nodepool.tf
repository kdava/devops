
resource "google_container_node_pool" "online_boutique_node_pool" {
  name       = "online-boutique-pool-terraform"
  project    = "idyllic-pottery-316421"
  location   = "northamerica-northeast1"
  cluster    = google_container_cluster.online_boutique.name
  node_count = 1
  autoscaling {
      max_node_count = "20"
      min_node_count = "0"
  }
  management {
      auto_repair  = "true"
      auto_upgrade = "true"
  }
  node_config {
    preemptible     = "false"  
    disk_size_gb    = "10"
    disk_type       = "pd-standard"
    image_type      = "COS_CONTAINERD"
    local_ssd_count = "0"
    machine_type    = "e2-small"

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
  
  node_locations = ["northamerica-northeast1-a", "northamerica-northeast1-b", "northamerica-northeast1-c"]
  upgrade_settings {
      max_surge       = "1"
      max_unavailable = "0"
  }
}
