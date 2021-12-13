terraform {
  required_version = ">= 0.13.4"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.13.0"
    }
  }
}
