# Create Load Balancer (ALB) 
resource "aws_lb" "test" { 
    name = "ALB-yousef" 
    internal =false 
    load_balancer_type = "application" 
    security_groups = [aws_security_group.HTTP-SG.id] 
    subnets = [aws_subnet.Public_Subnet1.id, aws_subnet.Public_Subnet2.id] 
    enable_deletion_protection = false 
    tags = { 
        Name = "ALB YOUSEF" 
        }
     }


# Create Target Group 
resource "aws_lb_target_group" "test" { 
    name = "TG-Yousef" 
    port = 80 
    protocol = "HTTP" 
    vpc_id = aws_vpc.main.id 
    health_check { 
        protocol = "HTTP" 
        path = "/" 
        } 
        tags = { 
            Name = "TG-Yousef"
            }
}



# Create Listener for ALB 


resource "aws_lb_listener" "test" { 
    load_balancer_arn = aws_lb.test.arn 
    port = "80" 
    protocol = "HTTP" 
    default_action { 
        type = "forward" 
        target_group_arn = aws_lb_target_group.test.arn
         }
 }