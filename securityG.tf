# Create Security Group 
resource "aws_security_group" "HTTP-SG" { 
    vpc_id = aws_vpc.main.id 
    ingress { 
        from_port = 80 
        to_port = 80 
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"] 
        }

    # Add SSH ingress rule 
    ingress { 
        from_port = 22 
        to_port = 22 
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
         Name = "HTTP-SG"
          } 
     }


# Create Security Group
 resource "aws_security_group" "bastion" { 
    name = "bastion"
    vpc_id = aws_vpc.main.id 
    ingress { 
        from_port = 22 
        to_port = 22 
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
         Name = "Jumper-SG"
          } 
 }