resource "helm_release" "gitlab" {
  name       = "gitlab"
  repository = "https://charts.gitlab.io"
  chart      = "gitlab"
  version    = "8.8.2"
  namespace        = var.namespace

  timeout = 900

  values = [file("${path.module}/gitlab-values.yaml")]

  set {
    name = "global.hosts.domain"
    value = "ci.alytvynenko.net"
  }

  set {
    name = "global.ingress.enabled"
    value = "true"
  }


  # set {
  #   name = "certmanager.install"
  #   value = "false"
  # }


  # set {
  #   name = "prometheus.install"
  #   value = "false"
  # }

  # set {
  #   name = "global.kas.enabled"
  #   value = "false"
  # }

  # set {
  #   name = "global.minio.enabled"
  #   value = "false"
  # }

  # set {
  #   name = "global.registry.enabled"
  #   value = "false"
  # }

}
