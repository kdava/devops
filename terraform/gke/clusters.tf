resource "google_container_cluster" "online_boutique" {
  name     = "online-boutique-terraform"
  location = "northamerica-northeast1"
  remove_default_node_pool = true
  initial_node_count       = 1
  addons_config {
                    horizontal_pod_autoscaling {
                      disabled = "false"
                    }

                    http_load_balancing {
                      disabled = "false"
                    }

                    network_policy_config {
                      disabled = "true"
                    }
  }
  cluster_autoscaling {
      enabled = "false"
  }
  node_locations  = ["northamerica-northeast1-a", "northamerica-northeast1-b", "northamerica-northeast1-c"]
  project         = "idyllic-pottery-316421"
}

