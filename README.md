# Terraform Highly Available Webapp

Introduction
---
This project provisions a highly available web application infrastructure on AWS using Terraform. It leverages an Application Load Balancer (ALB) to distribute traffic across an Auto Scaling Group (ASG) of EC2 instances, ensuring scalability and fault tolerance. A bastion host is included to provide secure SSH access to private instances, while S3 is integrated for backup storage. The architecture is deployed across public and private subnets, with a NAT Gateway enabling private instances to access the internet securely.

<p align="center">
  <img src="https://github.com/user-attachments/assets/78ef6365-1a67-4435-9cfd-7bbf30ae313c" alt="Project Screenshot" width="600"/>
</p>

## Objectives

- High Availability: Deploy a web app with ALB and Auto Scaling to handle traffic and ensure reliability.

- Secure Access: Use a Bastion Host for safe SSH access to private instances.If you are not familiar with Bastion Hosts, you can refer to this [Documentation](https://www.geeksforgeeks.org/blogs/what-is-aws-bastion-host/)

- Data Backup: Store application data in S3 for persistence and recovery.

- Access Control: Implement IAM roles to manage permissions securely.


## Setup

1. Clone the Project
   
2. After making the required adjusments ( key name , your s3 bucket name , ... etc ) you should run it by these commands in order .

```bash
terraform init
terraform plan
terraform apply
```

## Output

- After deploying all resources to AWS, verify that everything is working correctly by accessing the private instances through the ALB’s DNS.

  <p align="center">
  <img src="https://github.com/user-attachments/assets/c73d4dac-cab3-4f30-a1c6-817823108b45" alt="Project Screenshot" width="600"/>
  </p>

- On EC2 dashboard, we notice that there are 2 Private instances and a bastion "Jump" Host as required.
  
  <p align="center">
  <img src="https://github.com/user-attachments/assets/b2fee905-0a47-4d10-a233-9abea768fe64" alt="Project Screenshot" width="600"/>
  </p>
  
- Access the private instance through the jump server 

 ```bash
 scp -i "keypath" "keypath" ec2-user@BastionIP:/home/ec2-user/     # copy the key to bastion host 
 ssh -i "key.pem"  ec2-user@BastionIP     # SSH connection to Bastion host
 ssh -i "/home/ec2-user/.ssh/key.pem" ec2-user@PrivateIP        ## SSH connection to private instance through Bastion
 ```

- Access the internet to verify that the private instance can reach via the NAT gateway

  <p align="center">
  <img src="https://github.com/user-attachments/assets/5cd5bfca-cb7f-437e-809e-de1db4e0dd16" alt="Project Screenshot" width="600"/>
  </p>

- To understand the concept of Auto Scaling, try terminating one of the private instances (before making any change).
  
  <p align="center">
  <img src="https://github.com/user-attachments/assets/a965d338-cd82-4abf-9571-a74ec91af7ac" alt="Project Screenshot" width="600"/>
  </p>

- After the change
   <p align="center">
   <img src="https://github.com/user-attachments/assets/ee90a652-163f-49cb-b060-5ab605414f5d" alt="Project Screenshot" width="600"/>
   </p>


   <p align="center">
   <img src="https://github.com/user-attachments/assets/b9697ef4-1c5e-4baf-8f3f-469298b446c2" alt="Project Screenshot" width="600"/>
   </p>

- Now, test the functionality of the S3 bucket by uploading and retrieving files to ensure backup operations work correctly.

```bash
echo "test" > testfile.txt      # Creating testfile.txt 
aws s3 cp testfile.txt s3://bucket name/     # Uplaoding the test file to your S3 bucket
```

- Refresh S3 Bucket , we notice that the file has been uploaded 

   <p align="center">
   <img src="https://github.com/user-attachments/assets/fc576636-911c-4666-8f02-ce4156c49cd6" alt="Project Screenshot" width="600"/>
   </p>



## Conclusion

This project demonstrates how to deploy a highly available and secure web application on AWS using Terraform. By combining ALB, Auto Scaling, Bastion Host, S3 backups, and IAM roles, it ensures scalability, security, and fault tolerance. Provides hands-on experience with key AWS services and IaC best practices, making it an ideal foundation for managing cloud-based applications efficiently.

  


