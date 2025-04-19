# module "module-grafana" {
#   source = "./1-module-grafana"

#   namespace = var.namespace
# }

module "module-prometheus" {
  source = "./1-module-prometheus"

  namespace = var.namespace
}

# module "module-influxdb-and-telegraf" {
#   source = "./2-module-influxdb-and-telegraf"

#   namespace = var.namespace
# }
