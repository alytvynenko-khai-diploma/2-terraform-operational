resource "helm_release" "gitlab" {
  name       = "gitlab"
  repository = "https://charts.gitlab.io"
  chart      = "gitlab"
  version    = "8.8.2"
  namespace  = var.namespace
  timeout    = 1000

  values = [file("${path.module}/gitlab-values.yaml")]

  set {
    name  = "global.hosts.domain"
    value = "ci.alytvynenko.net"
  }

  set {
    name  = "global.hosts.https"
    value = "false" # FIXME: SSL is disabled at the moment
  }

  set {
    name  = "nginx-ingress.enabled"
    value = "false" # Disabled, custom haproxy used instead
  }

  set {
    name  = "global.ingress.enabled"
    value = "false" # Disabled, custom haproxy used instead
  }
}
