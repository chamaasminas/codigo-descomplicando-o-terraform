module "servers"{
    source = "./servers"
    servers = 2
    #servers = 1 <---- segundo exemplo

}

# Pegando output dos módulos filhos
output "ip_address" {
  value = module.servers.ip_address
}

