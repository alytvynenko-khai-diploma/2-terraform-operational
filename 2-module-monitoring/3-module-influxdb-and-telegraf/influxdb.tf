resource "helm_release" "influxdb" {
  name       = "influxdb"
  repository = "https://helm.influxdata.com/"
  chart      = "influxdb2"
  version    = "2.1.2"
  namespace  = var.namespace

  values = [file("${path.module}/influxdb-values.yaml")]

  set {
    name = "adminUser.password"
    value = "admin-initial-password" # TODO: replace the password
  }

  set {
    name = "adminUser.token"
    value = "L6CjnlnrSO1wmcP9biNrpp7VdrED6xQ0" # TODO: replace the token by a senvisitive secret value
  }
}
