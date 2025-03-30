provider "aws" {
  region = "ap-northeast-1"  # 東京リージョン
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }
  }
  required_version = ">= 1.6.6"

  backend "s3" {
    bucket  = "onewonder-tfstate"  # tfstateを保存するS3バケット
    region  = "ap-northeast-1"     # バケットのリージョン
    key     = "terraform-iamusers-from-json/terraform.tfstate"
    encrypt = true                 # 暗号化を有効化
  }
}