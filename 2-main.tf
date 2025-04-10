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
module "external-namecheap" {
  source = "./4-external-namecheap"

  load_balancer_ip = "34.30.177.31"
}
