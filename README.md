# Terraform-Final-Project
![Alt Text](https://github.com/El-Zedy/Terraform-Final-Project/blob/main/screenshots/infrastructure.png)
This repository contains Terraform code for a solution that creates a highly available infrastructure on AWS.

### Consisting of:
- Public and private subnets
- Internet gateway
- NAT gateway
- Private and public Application Load Balancer 
- Private and public EC2 instances running behind the load balancer.

The solution uses custom not public **modules** to implement the infrastructure and a **remote bucket** for **the state file**. The first Loadbalancer is public, and the other one that sends the traffic to the private machines is private. **The state file is stored in an S3 bucket**.

## Requirements
To use this solution, you will need:

  - An AWS account
  - Terraform 1.0 or later
  - AWS CLI
  - Git
  
  ## Usage
  To use this project, follow these steps:
  1. Clone the repository to your local machine using the command:
 
    git clone https://github.com/El-Zedy/Terraform-Final-Project.git
  2. Create a new workspace called "dev" and switch to it:
    
    terraform workspace new dev
    terraform workspace select dev
  3. Initialize the workspace and download the required modules:
  
    terraform init
  4. Set up the remote bucket for state file:
    
    terraform 
    {
    backend "s3"
      {
        bucket = "YOUR_BUCKET_NAME"
        key    = "YOUR_KEY_NAME"
        region = "YOUR_REGION"
      }
    }
  5. Use the datasource to get the image ID for EC2:
  
    data "aws_ami" "ubuntu"
    {
      most_recent = true
      owners      = ["099720109477"]
      filter 
      {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
      }
      filter
      {
      name   = "virtualization-type"
      values = ["hvm"]
      }
    }
  6. Create the infrastructure by running:
  
    terraform apply
  7. Verify the infrastructure by accessing the public DNS of the load balancer when you send traffic to it from a browser and it returns the content of the private EC2s.
  
  8. View the S3 bucket to see the state file
  
  9. check the `ips.txt` to check your public and private EC2s ips.
  
  10.check all screenshots at the `screenshots` directory to clarify everything.
  
## Contact
If you have any questions or suggestions regarding this project, please contact the project owner at muhammadhassanelzedy@gmail.com .




