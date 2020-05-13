# Considerações

Conhecemos todos os arquivos dessa vez.

- Temos uma alteração no número de máquinas EC2, dado pelo count = 2 no arquivo ec2.tf

Após a substituição da ami o código deve ficar da seguinte forma:

``` 
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
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = "subnet-06b84f7ade0c43a6c"  # <------ altere para sua subnet
  
  tags = {
    Name = "HelloWorld"
  }
}
```