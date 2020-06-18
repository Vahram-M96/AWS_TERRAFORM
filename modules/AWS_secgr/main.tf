resource "aws_security_group" "sec_group_1" {
  name = "sec_group_1"
  description = "This is security group for Nginx servers "

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


output "secgr_id" {
  value = "${aws_security_group.sec_group_1.id}"
}
