#Create Load Balancer.

resource "aws_lb" "Altschoolproject_lb" {
  name               = "Altschoolproject-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Altschoolproject_alb_sg.id]
  subnets            = [aws_subnet.Altschoolproject_subnet1.id, aws_subnet.Altschoolproject_subnet2.id, aws_subnet.Altschoolproject_subnet3.id]


#enable_cross_zone_load_balancing = true
 
  enable_deletion_protection = false
}