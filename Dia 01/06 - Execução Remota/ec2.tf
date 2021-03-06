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
  instance_type = "t2.micro"
  subnet_id = "subnet-06b84f7ade0c43a6c"  # <------ altere para sua subnet
  key_name = "iaas-week" # <------------ altere para sua key_name
  vpc_security_group_ids = ["${aws_security_grup.allow_ssh.id}"]
  
  provisioner "remote-exec"{
    inline = [
      "touch /tmp/test"
    ]
    connection {
      type = "ssh"
      user = "ubuntu"
      host = "${self.public_ip}"
      private_key = "${file("/app/iaasweek.pem")}" # <-------- Altere para sua chave
    }
  }

  tags = {
    Name = "HelloWorld"
  }
}

