terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.5.0"
    }
  }
}

locals {
  app_name = "your_app"

  # IPアドレスを追加したい場合はここに追記
  allowed_ips = [
    "AAA.BBB.CCC.DDD/XX"
  ]

  # dockerイメージ
  # {registry}/{repository}:{tag}
  images = "1234567890.dkr.ecr.ap-northeast-1.amazonaws.com/your_app:latest"
}

variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  region     = "ap-northeast-1"
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = {
      application   = local.app_name
      Name          = local.app_name
      administrator = "your_name"
    }
  }
}

# resource "aws_ecr_repository" "your_app" {
#   name                 = "your_app"
#   image_tag_mutability = "MUTABLE"
#   force_delete         = true

#   image_scanning_configuration {
#     scan_on_push = true
#   }
# }
