variable "instance_type" {
  type = map(string)

  default = {
    "free" : "t2.micro"
  }
}

variable "amis" {
  type = map(string)

  default = {
    "us-east-1" : "ami-0715c1897453cabd1"
    "us-east-2" : "ami-01107263728f3bef4"
  }
}

variable "key_name" {
  default = "terraform-aws"
}

variable "allowed_addresses" {
  type = list(string)

  default = ["186.209.51.62/32"]
}
