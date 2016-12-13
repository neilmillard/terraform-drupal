/* Default security group */
//resource "aws_security_group" "default" {
//  name = ""
//  description = "Default security group that allows inbound and outbound traffic from all instances in the VPC"
//  vpc_id = "${var.aws_vpc_id}"
//
//  ingress {
//    from_port   = "0"
//    to_port     = "0"
//    protocol    = "-1"
//    self        = true
//  }
//
//  tags {
//    Name = "default"
//  }
//}
//
//resource "aws_security_group" "interviewUser1" {
//  name = "interviewUser1_SG_Default"
//  vpc_id = "${var.aws_vpc_id}"
//
//  ingress {
//    from_port = "0"
//    to_port = "0"
//    protocol = "-1"
//    cidr_blocks = [
//    "10.135.0.0/16",
//    "82.69.106.64",
//    "94.126.201.36/32"]
//  }
//}

/* Security group for the ci */
resource "aws_security_group" "ci" {
  name = "ci-access"
  description = "Security group for web that allows web traffic from internet"
  vpc_id = "${var.aws_vpc_id}"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [
        "82.69.106.64",
        "94.126.201.36/32"]
  }

  tags {
    Name = "ci-access"
  }
}
