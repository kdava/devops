provider "google" {
  project = "idyllic-pottery-316421"
}

terraform {
	required_providers {
		google = {
	    version = "~> 3.71.0"
		}
  }
}
