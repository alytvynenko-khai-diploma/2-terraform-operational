terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "17.9.0"
    }
  }
}

provider "gitlab" {
  # token = "" # TODO: add OAuth2 Token, Project, Group, Personal Access Token or CI Job Token
  base_url = "http://gitlab.ci.alytvynenko.net/api/v4/"
  token = "glpat-GCsz31cjWW8rkix3rp77" # TODO: manually generate and place the token
  insecure = true # FIXME: remove
}
