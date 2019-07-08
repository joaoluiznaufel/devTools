data "aws_ami" "server_name" {
  most_recent = true

  filter {
    name   = "name"
    values = ["name of the AMI"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"] # owner ID
}
