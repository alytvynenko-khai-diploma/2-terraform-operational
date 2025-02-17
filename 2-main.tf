locals {
  infrastructure_namespace = kubernetes_namespace.infrastructure.metadata[0].name
}

module "module-gitlab" {
  source = "./1-module-gitlab"

  # namespace = local.infrastructure_namespace
}

module "module-monitoring" {
  source = "./2-module-monitoring"

  namespace = local.infrastructure_namespace
}
