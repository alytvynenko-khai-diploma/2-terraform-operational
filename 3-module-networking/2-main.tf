resource "helm_release" "haproxy" {
  # count = 0 # TODO: remove, gitlab-nginx used instead

  name       = "haproxy"
  repository = "https://haproxytech.github.io/helm-charts"
  chart      = "kubernetes-ingress"
  namespace  = var.namespace
  version    = "1.44.0"

  values = [
    file("${path.module}/haproxy-values.yaml") # TODO: use templatefile()
  ]
}
