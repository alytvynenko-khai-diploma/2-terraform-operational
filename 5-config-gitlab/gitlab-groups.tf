locals {
  group_variable_list = {
    "INFLUXDB_TOKEN": "L6CjnlnrSO1wmcP9biNrpp7VdrED6xQ0", # TODO: start using dynamically
    "INFLUXDB_URL": "http://influxdb-influxdb2.infrastructure.svc.cluster.local",
    "INFLUXDB_ORG": "influxdata",
    "INFLUXDB_BUCKET": "default",
  }
}

resource "gitlab_group" "devops-only" {
  name = "1-devops-only"
  path = "1-devops-only"
  auto_devops_enabled = false
  visibility_level = "public" # TODO: LDAP topic SCRUM-43

  description = "[TF MANAGED] The GitLab group created only for DevOps Engineers and DevOps purposes"
}

# TODO: LDAP topic SCRUM-43
# resource "gitlab_group" "developer-only" {
#   name = "2-developer-only"
#   path = "2-developer-only"
#   auto_devops_enabled = false
#   visibility_level = "public" # TODO: LDAP topic SCRUM-43

#   description = "[TF MANAGED] The GitLab group created only for Developers and developer purposes"
# }

# resource "gitlab_group_variable" "influxdb-token" {
#   for_each = local.group_variable_list

#   key = each.key
#   value = each.value

#   group = gitlab_group.devops-only.id
#   masked = false
#   hidden = false # TODO: enable it later
#   environment_scope = "*"
# }
