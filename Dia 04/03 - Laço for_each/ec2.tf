data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["777015859311"] # Gomex ID, não mude sem mudar o filtro
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id
  #### Primeiro exemplo ####
  #for_each = {
  #  dev     = "t2.micro"
  #  staging = "t3.medium"
  #}
  #instance_type = each.value

  #### Segundo exemplo ####
  #for_each      = toset(var.instance_type)
  #instance_type = each.value

  tags = {
    Name = "HelloWorld"
  }

}
