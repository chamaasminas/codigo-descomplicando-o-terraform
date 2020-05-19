variable "hash_commit" {
  default = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
}

variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro", "t3.medium"]
  description = "The list of instance type"
}