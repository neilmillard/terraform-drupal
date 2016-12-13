/* this file uses existing subnet and other AWS resource IDs and expects them to exist already */
/* App servers */
resource "aws_instance" "web" {
  count             = 1
  ami               = "${var.aws_subnet_public}"
  instance_type     = "t2.micro"
  subnet_id         = "subnet-6cb33537"
  security_groups   = ["${aws_security_group.web.id}"]
  source_dest_check = false
  user_data         = "${file("cloud-config/web.yml")}"
  key_name          = "interviewUser1"
  tags              = {
    Name = "web-server-${count.index}"
  }
}

/* Load balancer */
resource "aws_elb" "app" {
  name = "web-elb"
  subnet_id = "${var.aws_subnet_public}"
  security_groups = ["${aws_security_group.web.id}"]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  instances = ["${aws_instance.web.*.id}"]
}
