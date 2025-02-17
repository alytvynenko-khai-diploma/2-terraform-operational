resource "helm_release" "influxdb" {
  name       = "influxdb"
  repository = "https://helm.influxdata.com/"
  chart      = "influxdb2"
  version = "2.1.2"
  namespace = var.namespace

  values = [file("${path.module}/influxdb-values.yaml")]
}
