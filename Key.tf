resource "aws_key_pair" "my_key" {
  key_name   = "yousef-key"
  public_key = file("key.pub")
}