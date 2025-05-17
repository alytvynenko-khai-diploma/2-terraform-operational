locals {
  infrastructure_namespace = kubernetes_namespace.this["infrastructure"].metadata[0].name
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
  depends_on = [ kubernetes_namespace.this ]

  source = "./3-module-networking"

  namespace = local.infrastructure_namespace # TODO: change to "app-and-infra"
}
