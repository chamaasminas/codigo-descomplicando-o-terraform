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
# A primeira execução é sem esses blocos de código abaixo

resource "aws_instance" "test" {
  #esses valores são achados após o terraform state pull
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  }
}

# Importação Complexa
resource "aws_security_group" "elb_sg" {
  #resource (arguments)
}
