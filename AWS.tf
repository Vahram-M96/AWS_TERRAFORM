provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "Redhat" {
  count = 1
ami = "ami-07dfba995513840b5"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.test_group.id]
tags = {
  naem = "Red_hat_EC2"
}
}


resource "aws_instance" "my_Amazon" {
  count = 1
ami = "ami-0a9e2b8a093c02922"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.test_group.id]
user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install nginx
echo "Hello! This is my first test im AWS" >> /usr/share/nginx/html/index.html
sudo service nginx start

EOF

tags = {
  name = "Nginx_server"
}

}

resource "aws_security_group" "test_group" {
  name = "test_group"
  description = "This is for test"

  ingress {

  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
    }

 egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

tags = {
  name = "Test_SG"
  owner = "Vahram"
}

}
