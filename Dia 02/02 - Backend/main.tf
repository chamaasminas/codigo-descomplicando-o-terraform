provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}
# Pra rodar o backend local remova esse bloco, de um terraform init e depois plan e apply. 
# Pra migrar o backend local para o s3 cole o bloco novamente, dê terraform init e o yes quando for perguntado se deseja migrar

terraform {
  backend "s3" {
    bucket = " " # <------ ALTERE AQUI   
    dynamodb_table = "terraform-state-lock-dynamo"
    key            = "terraform-test.tfstate"
    region         = "us-east-1"
  }
}