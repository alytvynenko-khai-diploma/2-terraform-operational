module "module-grafana" {
  source = "./1-module-grafana"
}

module "module-prometheus" {
  source = "./2-module-prometheus"
}

module "module-influxdb" {
  source = "./3-module-influxdb"
}

module "module-telegraph" {
  source = "./4-module-telegraph"
}
