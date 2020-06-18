output "instance-ids" {
  description = "incatance ids list"
  value       = module.AWS_ec2.serv_list
}

output "security_group_id" {
  description = "security group id"
  value = module.AWS_secgr.secgr_id
}
output "load-balancer-name" {
  value = module.AWS_elb.load_balancer_id
}
