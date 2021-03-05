terraform {
  required_providers {
    digitalocean = {
      source  = "registry.terraform.io/digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}