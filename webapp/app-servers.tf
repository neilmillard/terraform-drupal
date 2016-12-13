/* this file uses existing subnet and other AWS resource IDs and expects them to exist already */
/* App servers */

resource "aws_instance" "app" {
  count = 2
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${var.aws_subnet_public}"
  security_groups = ["${aws_security_group.default.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  source_dest_check = false
  user_data = "${file("cloud-config/app.yml")}"
  tags = {
    Name = "web-app-${count.index}"
  }
}

/* Load balancer */
resource "aws_elb" "app" {
  name = "airpair-example-elb"
  subnet_id = "${var.aws_subnet_public}"
  security_groups = ["${aws_security_group.default.id}", "${aws_security_group.web.id}"]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  instances = ["${aws_instance.app.*.id}"]
}
