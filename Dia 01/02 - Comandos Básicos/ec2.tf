resource "aws_instance" "web" {
  ami           = "ami-0012d86847c9c4218"
  instance_type = "t2.micro"
  subnet_id = "subnet-06b84f7ade0c43a6c" # <------ altere para sua subnet
  
  tags = {
    Name = "HelloWorld"
  }
}