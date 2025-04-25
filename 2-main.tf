locals {
  infrastructure_namespace = kubernetes_namespace.infrastructure.metadata[0].name
}

module "module-gitlab" {
  source = "./1-module-gitlab"

  namespace = local.infrastructure_namespace
}

module "module-monitoring" {
  source = "./2-module-monitoring"

  namespace = local.infrastructure_namespace
}

module "module-networking" {
  source = "./3-module-networking"

  namespace = local.infrastructure_namespace
}

# External DNS service
# FIXME: enable me only for GCP deployment
# module "external-namecheap" {
#   source = "./4-external-namecheap"

#   load_balancer_ip = "34.56.202.25" # TODO: implement workaround to retrieve the value automatically

#   secret_namecheap_api_user  = var.secret_namecheap_api_user
#   secret_namecheap_api_key   = var.secret_namecheap_api_key
#   secret_namecheap_client_ip = var.secret_namecheap_client_ip
# }
