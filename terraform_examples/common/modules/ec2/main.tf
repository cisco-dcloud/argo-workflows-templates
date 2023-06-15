data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2" {
  count = length(var.instances)
  ami              = data.aws_ami.amazon-linux.id
  instance_type    = var.instances[count.index].type
  subnet_id        = var.vpc.private_subnets[0]
  tags = {
    Name = var.instances[count.index].name
  }
}
