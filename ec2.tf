resource "aws_instance" "demo_terraform" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "A-M"
  count                  = "1"
  vpc_security_group_ids = ["${aws_security_group.demo-sg.id}"]
  subnet_id              = element(var.subnets, count.index)
}

output "instance_id" {
  value       = aws_instance.demo_terraform.*.id
  description = "The instance_id will display"
  sensitive   = false

--------------------------------------------------------------------------Demo but not tested the below one.

resource "random_shuffle" "subnet_shuffle" {
  input        = var.subnets
  result_count = 1  # Only pick one subnet
}

resource "aws_instance" "demo_terraform" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "A-M"
  count                  = "1"
  vpc_security_group_ids = ["${aws_security_group.demo-sg.id}"]
  subnet_id = random_shuffle.subnet_shuffle.result[0]  # Pick the first element from the shuffled list
}
