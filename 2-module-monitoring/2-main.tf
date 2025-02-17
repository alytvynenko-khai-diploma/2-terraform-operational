module "module-grafana" {
  source = "./1-module-grafana"

  namespace = var.namespace
}

module "module-prometheus" {
  source = "./2-module-prometheus"

  namespace = var.namespace
}

module "module-influxdb-and-telegraf" {
  source = "./3-module-influxdb-and-telegraf"

  namespace = var.namespace
}
