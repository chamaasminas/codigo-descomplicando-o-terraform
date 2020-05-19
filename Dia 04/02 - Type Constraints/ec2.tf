data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["777015859311"] # Gomex ID, não mude sem mudar o filtro
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = var.sg
  tags = {
    Name = "HelloWorld"
    Env  = var.environment
  }

}
