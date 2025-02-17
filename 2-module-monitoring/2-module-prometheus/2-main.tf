resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "27.3.1"
  namespace  = var.namespace

  values     = [file("${path.module}/prometheus-values.yaml")]
}
