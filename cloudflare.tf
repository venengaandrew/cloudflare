terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare-api_token
}

variable "zone_id" {
  default = var.zone_id
}

variable "account_id" {
  default = var.account_id
}

variable "domain" {
  default = var.domain
}

resource "cloudflare_record" "test"{
    zone_id = var.zone_id
    name = "test"
    value = "66.102.210.152"
    type = "A"
    proxied = true
}