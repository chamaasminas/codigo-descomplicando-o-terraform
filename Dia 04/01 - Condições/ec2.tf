data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["777015859311"] # Gomex ID, não mude sem mudar o filtro
}

resource "aws_instance" "web" {
  #count         = var.environment == "production" ? 2 + var.plus : 1
  #count = var.production ? 2 : 1
  count = !var.production ? 2 : 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = count.index < 1 ? "t2.micro" : "t3.medium"
  subnet_id     = " " # <------ altere para sua subnet
  tags = {
    Name = "HelloWorld"
  }
}
