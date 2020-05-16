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
  subnet_id     = " " # <------ altere para sua subnet
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_eip" "ip" {
  vpc = true
  instance = aws_instance.web.id
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = " " # <------ altere para sua subnet
  tags = {
    Name = "HelloWorld"
  }
  depends_on = [aws_instance.web]
}