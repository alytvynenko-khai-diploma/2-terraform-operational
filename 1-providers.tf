terraform {
  required_version = ">= 1.10.5"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

locals {
  kubernetes_config_path    = "~/.kube/config" # TODO: set up kubernetes provider
  kubernetes_config_context = "docker-desktop" # TODO: set up kubernetes provider

  project_id = "chrome-lane-454119-a6"
  region  = "europe-north2" # The cheapest region: https://cloudprice.net/gcp/regions
  zones    = ["${local.region}-a"]
  cluster_name = "gke-main"

  data_host = "https://${data.google_container_cluster.main.endpoint}"
  data_token = data.google_client_config.default.access_token
  data_cluster_ca_certificate = base64decode(data.google_container_cluster.main.master_auth[0].cluster_ca_certificate)
}

data "google_client_config" "default" {}

data "google_container_cluster" "main" {
  name     = local.cluster_name
  location = local.region
}

provider "google" {
  credentials = "${file("account.json")}"
  project     = local.project_id
  region      = local.region
  zone        = local.zones[0]
}

# ============================
#        Remote testing
# ============================
provider "kubernetes" {
  host                   = local.data_host
  token                  = local.data_token
  cluster_ca_certificate = local.data_cluster_ca_certificate
}

provider "helm" {
  # Fixed according to: https://github.com/hashicorp/terraform-provider-helm/issues/630#issuecomment-996682323
  repository_config_path = "${path.module}/.helm/repositories.yaml"
  repository_cache = "${path.module}/.helm"
  kubernetes {
    host                   = local.data_host
    token                  = local.data_token
    cluster_ca_certificate = local.data_cluster_ca_certificate
  }
}

# ============================
#        Local testing
# ============================
# provider "kubernetes" {
#   config_path    = local.kubernetes_config_path
#   config_context = local.kubernetes_config_context
# }

# provider "helm" {
#   kubernetes {
#     config_path    = local.kubernetes_config_path
#     config_context = local.kubernetes_config_context
#   }
# }
