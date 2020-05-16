provider "aws" {
  region  = "us-east-1"
  # Após a crição dos workspaces substituir linha acima pela abaixo.
  #region = "${terraform.workspace == "production" ? "us-east-1" : "us-east-2"}"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = " " # <------ ALTERE AQUI   
    key            = "terraform-test.tfstate"
    region         = "us-east-1"
  }
}