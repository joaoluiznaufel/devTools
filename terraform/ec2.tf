resource "aws_instance" "my-instance" {

  ami             = "${data.aws_ami.server_name.id}"
  instance_type   = "t3.small"
  key_name = "<name of your public key>"

  tags = {
    Name        = "the-name-of-the-instance"
  }
}
