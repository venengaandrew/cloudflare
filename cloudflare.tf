terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token
}

variable "api_token"{
    default = null
}

variable "zone_id" {
  default = null
}

variable "account_id" {
  default = null
}

variable "domain" {
  default = null
}

resource "cloudflare_record" "test"{
    zone_id = var.zone_id
    name = "test"
    value = "66.102.210.152"
    type = "A"
    proxied = true
}

resource "cloudflare_zone_settings_override" "venenga-net-settings"{
    zone_id = var.zone_id

    settings {
        tls_1_3 = "on"
        automatic_https_rewrites = "on"
        ssl = "strict"
    }
}