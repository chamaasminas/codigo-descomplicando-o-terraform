output "ip_address" {
  #### Primeiro exemplo ####
  #value = "${aws_instance.web[*].public_ip}"

  #### Segundo exemplo ####
  #value = {
  #  for instance in aws_instance.web :
  #  instance.id => instance.private_ip
  #}
}