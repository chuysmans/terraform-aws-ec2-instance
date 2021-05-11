# Provision resources in AWS (QA Branch)
This Terraform configuration will provision a VPC and EC2 instance into an aws account


## Details
This will create a new VPC with 3 public and 3 private subnets: 

```
azs             = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
```

Following that, a webserver is created and placed into the first public subnet. 

