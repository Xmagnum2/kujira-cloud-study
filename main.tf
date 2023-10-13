terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.5.0"
    }
  }
  
  backend "s3" {
    encrypt        = true
    bucket         = "sugiyama-s3"
    # dynamodb_table = "terraform-state-lock"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
  }
}
locals {
  app_name = "sugiyama"

  # IPアドレスを追加したい場合はここに追記
  allowed_ips = [
    "AAA.BBB.CCC.DDD/XX"
  ]

  # dockerイメージ
  # {registry}/{repository}:{tag}
  images = "1234567890.dkr.ecr.ap-northeast-1.amazonaws.com/your_app:latest"
}

variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}

provider "aws" {
  region     = "ap-northeast-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  default_tags {
    tags = {
      application   = local.app_name
      Name          = local.app_name
      administrator = "sugiyama"
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
