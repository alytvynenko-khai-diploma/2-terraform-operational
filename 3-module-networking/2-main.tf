resource "helm_release" "name" {
  name       = "haproxy"
  repository = "https://haproxytech.github.io/helm-charts"
  chart      = "kubernetes-ingress"
  namespace  = var.namespace
  version    = "1.44.0"

  values = [
    file("${path.module}/haproxy-values.yaml") # TODO: use templatefile()
  ]

}
