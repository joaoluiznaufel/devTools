resource "aws_instance" "my-instance" {

  ami             = "${data.aws_ami.server_name.id}"

  instance_type   = "t3.small"

  tags = {
    Name        = "the-name-of-the-instance"
  }
}
