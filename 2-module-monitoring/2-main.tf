module "module-grafana" {
  source = "./1-module-grafana"

  namespace = var.namespace
}

module "module-prometheus" {
  source = "./2-module-prometheus"

  namespace = var.namespace
}

module "module-influxdb" {
  source = "./3-module-influxdb"

  # namespace = var.namespace
}

module "module-telegraf" {
  source = "./4-module-telegraf"

  # namespace = var.namespace
}
