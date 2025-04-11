resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = var.namespace
  version    = "8.10.0"

  values = [
    file("${path.module}/grafana-values.yaml") # TODO: use templatefile()
  ]

  set {
    name  = "adminPassword"
    value = "admin" # TODO: replace the default password by a secret value
  }
}
