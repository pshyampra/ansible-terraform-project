resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  vpc_id      = "vpc-029828d8de4870fcd"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${data.http.my_ip.body}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
}
}
data "http" "my_ip" {
  url = "https://api64.ipify.org?format=text"
}

resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  vpc_id      = "vpc-029828d8de4870fcd"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  vpc_id      = "vpc-029828d8de4870fcd"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${data.http.my_ip.body}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
}
}

