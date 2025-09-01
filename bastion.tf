# Create EC2 Instances 
resource "aws_instance" "jumper_instance" { 
    ami = "ami-00ca32bbc84273381" 

    instance_type = "t2.micro" 

    subnet_id = aws_subnet.Public_Subnet1.id


    associate_public_ip_address = true 

    security_groups = [aws_security_group.bastion.id]

    key_name = aws_key_pair.my_key.key_name


    tags = { 
        Name = "jump server"
    }
}