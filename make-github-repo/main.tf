terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


# Configure the GitHub Provider
provider "github" {
}


# Create a GitHub repo
resource "github_repository" "first-repo" {
  name        = "repo-created-by-terraform"
  # description = ""

  visibility = "public"
}


