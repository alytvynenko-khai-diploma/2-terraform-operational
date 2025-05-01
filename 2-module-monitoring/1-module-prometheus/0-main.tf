resource "helm_release" "kube-prometheus-stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "70.7.0"
  namespace  = var.namespace

  values = [file("${path.module}/prometheus-values.yaml")]
}
