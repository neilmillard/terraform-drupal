resource "aws_instance" "CI" {
  count             = 1
  ami               = "ami-b73b63a0"
  instance_type     = "t2.medium"
  subnet_id         = "subnet-6cb33537"
  security_groups   = ["${aws_security_group.ci.id}"]
  source_dest_check = false
  user_data         = "${file("cloud-config/ci.yml")}"
  key_name          = "interviewUser1"
  tags              = {
                    Name = "CI server"
  }
}