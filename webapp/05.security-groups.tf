/* Security group for the web */
resource "aws_security_group" "web" {
  name = "web-access"
  description = "Security group for web that allows web traffic from internet"
  vpc_id = "${var.aws_vpc_id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags {
    Name = "web-access"
  }
}

/* Security group for the web */
resource "aws_security_group" "webssh" {
  name = "webssh-access"
  description = "Security group for web that allows web and ssh traffic from internet"
  vpc_id = "${var.aws_vpc_id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags {
    Name = "web-access"
  }
}