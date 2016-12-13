resource "aws_instance" "CI" {
  count             = 1
  ami               = "ami-b73b63a0"
  instance_type     = "t2.medium"
  subnet_id         = "subnet-6cb33537"
  security_groups   = ["${var.aws_SG_interviewuser1}"]
  source_dest_check = false
  user_data         = "${file("cloud-config/ci.yml")}"
  tags              = {
                    Name = "CI server"
  }
}