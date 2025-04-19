// ============================
//    Configuration section
// ============================
# FIXME: enable later
module "config-gitlab" {
  source = "./5-config-gitlab"
  namespace = local.infrastructure_namespace
}

# FIXME: disabled because nothing is used
# module "config-grafana" {
#   source = "./6-config-grafana"
#   namespace = local.infrastructure_namespace
# }
