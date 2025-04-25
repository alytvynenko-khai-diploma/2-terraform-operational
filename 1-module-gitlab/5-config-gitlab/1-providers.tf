terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "17.9.0"
    }
  }
}

provider "gitlab" {
  # token = "" # TODO: add OAuth2 Token, Project, Group, Personal Access Token or CI Job Token
  base_url = "http://gitlab.ci.alytvynenko.net/api/v4/"
  token    = "glpat-gvCMeVU_QnRVUCsAQHQk" # TODO: manually generate and place the token
  insecure = true                         # FIXME: remove
}
