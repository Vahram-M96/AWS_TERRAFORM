resource "aws_elb" "new_elb" {
  count  = var.ec2_count > 1 ? 1:0
  name               = "new-elb"
  availability_zones = ["eu-central-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
    instances              = var.servers

  tags = {
    Name = "aws_elb_1"
   }
 }

output "load_balancer_id" {
  value = aws_elb.new_elb[*].id
}
