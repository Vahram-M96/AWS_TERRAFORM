resource "aws_instance" "test" {
count = var.ec2_count
ami = "ami-0a9e2b8a093c02922"
instance_type = "t2.micro"
vpc_security_group_ids  = var.sec_gr_id
user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install nginx
echo "Hello! This is my first test${count.index + 1} im AWS" >> /usr/share/nginx/html/index.html
sudo service nginx restart
t
EOF

tags = {
  name = "Nginx_server${count.index+1}"
}

}

output "serv_list" {

  value = aws_instance.test[*].id
}
