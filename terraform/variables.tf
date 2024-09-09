variable "hcloud_token" {
  type      = string
  sensitive = true
}

variable "server_name" {
  type = string
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "user_name" {
  type = string
}

variable "image" {
  type    = string
  default = "ubuntu-22.04"
}


variable "server_type" {
  type    = string
  default = "cpx11"
}

variable "location" {
  type    = string
  default = "fsn1"
}

variable "public_key_path" {
  type = string
}

variable "private_key_path" {
  type = string
}
