resource "grafana_data_source" "prometheus" {
  type                = "prometheus"
  name                = "prometheus-server"
  url                 = "http://prometheus-server.infrastructure.svc.cluster.local:80"
}

resource "grafana_data_source" "influxdb" {
  type = "influxdb"
  name = "influxdb"
  url  = "http://influxdb-influxdb2.infrastructure.svc.cluster.local"
}
