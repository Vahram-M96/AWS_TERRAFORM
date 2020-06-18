## AWS_TERRAFORM
### Description:
In this project we will create some resources in AWS cloud  by using  [Terraform](https://learn.hashicorp.com/terraform) environment creation tool. In creation process we will use Terraform modules.

>Pre-requirements 
>1. Account in AWS([AWS_account](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc))
>2. Pre-installed Terraform(version v0.12.26)([Terraform_install](https://learn.hashicorp.com/terraform/getting-started/install.html))  
   >_If  you don't have this components please follow the links in order to create AWS account and install Terraform._ 

###   Modules:
   1. AWS_ec2  
    * This module is used to create AWS EC2 instances. In module the **count** parameter is used to create more than one EC2 instances based on given value.
   2. AWS_secgr  
    * This module is used to create the security group.  (For more information about [AWS_security_groups](https://www.threatstack.com/blog/aws-security-groups-what-they-are-and-how-to-get-the-most-out-of-them) )
   3. AWS_elb
    * This module is used to create load balancer([AWS_elb](https://aws.amazon.com/elasticloadbalancing/)) for backend Nginx servers. 
  
  ### Usage:
  1. Get all files to your working directory.
  2. Provide necessary cridentials for AWS provider([AWS Provider cridetials](https://www.terraform.io/docs/providers/aws/index.html))
  3. Execute the following commands :  
``` 
# terraform init(it will download plagin for AWS provider)
# terraform apply(to create environment )
 ```   
 
 >Please note that you can chnge the value of parameters mantioned in files _variables. tf_ .(give them new value in _terraform. tfvars_ file and the default value for that parameter will be overwritten)