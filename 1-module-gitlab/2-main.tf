resource "helm_release" "gitlab" {
  name       = "gitlab"
  repository = "https://charts.gitlab.io"
  chart      = "gitlab"
  version    = "8.8.2"
  namespace  = var.namespace

  values = [file("${path.module}/gitlab-values.yaml")]

  set {
    name  = "global.hosts.domain"
    value = "ci.alytvynenko.net"
  }
}

# FIXME: enable later
# Should be deployed after helm_release and setting API token
# module "gitlab-configuration" {
#   source = "./1-gitlab-configuration"
#   namespace = var.namespace
# }