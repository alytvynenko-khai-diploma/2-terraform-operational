# module "module-grafana" {
#   source = "./1-module-grafana"

#   namespace = var.namespace
# }

module "module-prometheus" {
  source = "./1-module-prometheus"

  namespace = var.namespace
}

module "module-influxdb" {
  source = "./2-module-influxdb"

  namespace = var.namespace
}
