#Define Subnets

resource "aws_subnet" "Public_Subnet1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.3.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name = "Public_Subnet1"
    }


  
}



resource "aws_subnet" "Public_Subnet2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.4.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "Public_Subnet2"
    }
  
}



resource "aws_subnet" "subnet1" { 
    vpc_id = aws_vpc.main.id 
    cidr_block = "192.168.1.0/24" 
    availability_zone = "us-east-1a" 
   tags = {
     Name = "Private_Subnet1" 
        } 
}


resource "aws_subnet" "subnet2" { 
    vpc_id = aws_vpc.main.id 
    cidr_block = "192.168.2.0/24" 
    availability_zone = "us-east-1b" 
   tags = {
     Name = "Private_Subnet1" 
        } 
}