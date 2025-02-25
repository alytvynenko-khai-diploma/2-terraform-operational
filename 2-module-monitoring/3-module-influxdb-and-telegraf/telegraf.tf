resource "helm_release" "telegraf" {
  name       = "telegraf"
  repository = "https://helm.influxdata.com/"
  chart      = "telegraf"
  version    = "1.8.55"
  namespace  = var.namespace

  values = [file("${path.module}/telegraf-values.yaml")]
}
