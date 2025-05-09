resource "helm_release" "haproxy" {
  name       = "haproxy"
  repository = "https://haproxytech.github.io/helm-charts"
  chart      = "kubernetes-ingress"
  namespace  = "app-and-infra"
  version    = "1.44.0"

  values = [
    file("${path.module}/haproxy-values.yaml") # TODO: use templatefile()
  ]
}

resource "kubernetes_config_map" "haproxy-tcp-ports" {
  metadata {
    name      = "haproxy-tcp-ports"
    namespace = "app-and-infra"
  }

  data = {
    "22": "infrastructure/gitlab-gitlab-shell:22"
  }
}
