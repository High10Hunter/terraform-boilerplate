# Terraform boilerplate


## Project folder structure

```
├── environments
│   ├── dev
│   │   ├── 1-initializations
│   │   │   └── aws
│   │   ├── 2-foundations
│   │   │   └── aws
│   │   ├── 3-functionalities
│   │   │   └── aws
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   ├── terraform.tfvars.example
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── stg
│   │   ├── 1-initializations
│   │   │   └── aws
│   │   ├── 2-foundations
│   │   │   └── aws
│   │   ├── 3-functionalities
│   │   │   └── aws
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   ├── terraform.tfvars.example
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── prod
└── modules
    └── aws
        ├── acm-certificate
        ├── backend-bucket
        ├── cognito
        ├── ecr
        ├── ecs
        ├── iot-core
        ├── load-balancers
        ├── nat-instances
        ├── rds
        ├── security-group
        ├── sqs
        └── vpc-subnet-internet-gateway
```
## Usage

### 1) Prepare AWS Credentials 
Ensure you have AWS credentials configured either through environment variables or AWS CLI configuration.

### 2) Initialize project

#### Select develop workspace (dev, stg, prod,...)

```bash 
# move to specific environment & cloud platform 
cd environments/<environment>/initializations/<cloud_platform>
# e.g: cd environments/dev/initializations/aws
```

#### Review the variables in the initialization stage
Copy the `terraform.tfvars.example` in the environment directory to new file `terraform.tfvars` then review to ensure all necessary variables are defined.

#### Initialize project 
```bash
terraform init
terraform plan --var-file="terraform.tfvars"
terraform apply --var-file="terraform.tfvars"
```


### 3) Build up infrastructure
#### Initialize terraform 
Navigate to the environment directory (e.g., `environments/dev`) and run `terraform init` to initialize the environment.

```bash
cd environments/dev
terraform init
terraform workspace select <environment>
```

#### Review the variables
Copy the `terraform.tfvars.example` in the environment directory to new file `terraform.tfvars` then review to ensure all necessary variables are defined.

#### Plan the infrastructure

```bash
terraform plan --var-file="terraform.tfvars"
```

#### Apply changes

```bash
terraform apply --var-file="terraform.tfvars"
```
