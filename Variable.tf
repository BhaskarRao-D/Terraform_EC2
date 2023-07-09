variable "ami" {
  type    = string
  default = "ami-03c7c1f17ee073747"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnets" {
  type    = list(any)
  default = ["subnet-0c6c6e719a6a9f952", "subnet-0108b01f0ce563e87"]
}
