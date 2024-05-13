## Wordpress Deployment on AWS using Terraform 

# Introduction
In today’s digital landscape, having a reliable and scalable infrastructure is paramount for running web applications like WordPress. In this tutorial, we will deploy a WordPress application on AWS using Terraform. Terraform is an open-source infrastructure as code software tool created by HashiCorp. It enables users to define and provision data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON. Terraform manages external resources with providers, which are plugins that translate the API interactions with the service. Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

# Prerequisites
- AWS Account
- Terraform Installed
- Basic knowledge of AWS and Terraform
- AWS CLI Installed

# Steps
1. **Create a Route 53 Hosted Zone**
    - Go to the AWS Management Console and open the Route 53 console at https://console.aws.amazon.com/route53/.
    - In the navigation pane, choose Hosted zones.
    - Choose Create Hosted Zone.
    - In the Create Hosted Zone pane, enter the domain name that you want to use for your WordPress site.
    - Choose Create.
    - Note down the NS and SOA records.

2. **Create The AWS Credentials From AWS IAM Console**
    - Go to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/iam/.
    - In the navigation pane, choose Users.
    - Choose Add user.
    - For User name, enter a name for the new user.
    - Choose Programmatic access.
    - Choose Next: Permissions.
    - Choose Attach existing policies directly.
    - In the search box, type AdministratorAccess.
    - Select the AdministratorAccess policy.
    - Choose Next: Tags.
    - Choose Next: Review.
    - Choose Create user.
    - Note down the Access key ID and Secret access key.

3. **Configure AWS CLI**
    - Run `aws configure` command and enter the Access key ID, Secret access key, Default region name, and Default output format.

4. **Git Clone the Repository**
    - Run `git clone https://github.com/Amul-Thantharate/wordpress-aws-terraform.git` command to clone the repository.

5. **Update the Terraform Variables**
    - Go to the `wordpress-aws-terraform` directory.
    - Create a `terraform.tfvars` file.
    - Add the following things that are available in the `variables.tf` file.
    - Update the backend configuration in the `backend.tf` file. 
    - Update the provider configuration in the `provider.tf` file.

6. **Initialize the Terraform and plan**
    - Run `terraform init` command to initialize the Terraform.
    - Run `terraform plan` command to see the resources that will be created.

7. **Deploy the WordPress Application**
    - Run `terraform apply` command to deploy the WordPress application.
    - Enter `yes` when prompted.

8. **Access the WordPress Application**
    - Go to the `Outputs` section in the Terraform output.
    - Copy the `wordpress_url` and paste it in the browser.
    - Complete the WordPress installation by entering the required details.
    - Or your domain name will be pointed to the WordPress application.

9. **Destroy the WordPress Application**
    - Run `terraform destroy` command to destroy the WordPress application.
    - Enter `yes` when prompted.

# Conclusion    
In this tutorial, we have successfully deployed a WordPress application on AWS using Terraform. Terraform is a powerful tool that allows you to define and provision infrastructure as code. By following the steps outlined in this tutorial, you can easily deploy WordPress on AWS and manage your infrastructure in a scalable and efficient manner. I hope you found this tutorial helpful and informative. If you have any questions or feedback, please feel free to leave a comment below. Thank you for reading!

# Author
- [Amul Thantharate](https://www.linkedin.com/in/amul-thantharate/)
- [GitHub](https://www.gihub.com/Amul-Thantharate)
- [Medium](https://amulthantharate.medium.com/)
- [LinkedIn](https://www.linkedin.com/in/amul-thantharate/)
