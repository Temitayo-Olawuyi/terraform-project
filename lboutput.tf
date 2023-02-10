#Create load balancer output

output "elb_target_group_arn" {
value = aws_lb_target_group.Altschoolproject_tg.arn
}

output "elb_load_balancer_dns_name" {
value = aws_lb.Altschoolproject_lb.dns_name
}

output "elb_load_balancer_zone_id" {
value = aws_lb.Altschoolproject_lb.zone_id
}