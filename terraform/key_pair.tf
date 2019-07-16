resource "aws_key_pair" "sysop" {
  key_name   = "<name of your public key>"
  public_key = "ssh-rsa <your key>"
}
