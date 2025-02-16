terraform {
  required_version = ">= 1.10.5"

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config" # TODO: set up kubernetes provider
  config_context = "my-context"     # TODO: set up kubernetes provider
}
