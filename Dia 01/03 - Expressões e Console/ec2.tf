data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["777015859311"] # Gomex ID, não mude sem mudar o filtro
}

resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0012d86847c9c4218" # O hardcoded é trocado pela linha abaixo
  # ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = "subnet-06b84f7ade0c43a6c"  # <------ altere para sua subnet
  
  tags = {
    Name = "HelloWorld"
  }
}