variable "hash_commit" {
  default = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
}

variable "environment" {
  type        = string
  default     = "staging"
  description = "The environment of instance"

}

variable "sg"{
  type        = list(number)
  default     = [1,2,3,4]
  description = "The list of sg for this instance"
}
