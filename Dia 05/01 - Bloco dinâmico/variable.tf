variable "hash_commit" {
  default = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
}

variable "blocks" {
  type = list(object({
    device_name = string
    volume_size = string
    volume_type = string
  }))
  description = "list of EBS block"
}