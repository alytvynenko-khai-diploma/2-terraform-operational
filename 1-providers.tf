terraform {
  required_version = ">= 1.10.5"

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.17.0"
    }
  }
}

locals {
  kubernetes_config_path = "~/.kube/config" # TODO: set up kubernetes provider
  kubernetes_config_context = "docker-desktop" # TODO: set up kubernetes provider
}

provider "kubernetes" {
  config_path    = local.kubernetes_config_path
  config_context = local.kubernetes_config_context
}

provider "helm" {
  kubernetes {
    config_path    = local.kubernetes_config_path
    config_context = local.kubernetes_config_context
  }
}
