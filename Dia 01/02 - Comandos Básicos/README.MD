# Considerações

Nessa aula trabalhamos em cima dos arquivs ec2.tf e main.tf.

- Para rodar o backend local basta remover o bloco terraform no arquivo main.tf.
Ele ficaria da seguinte forma:

```
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}
```