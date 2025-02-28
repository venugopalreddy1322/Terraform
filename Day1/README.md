
# IaC with Terraform and Jenkins for AWS

## Project Overview
This project utilizes Terraform to create and manage AWS infrastructure in a Jenkins pipeline. The pipeline automatically fetches the latest code from GitHub and sets up the complete infrastructure as code (IaC).

## Features
- **Automated Infrastructure Creation:** Leverages Terraform to provision and manage AWS resources.
- **CI/CD Pipeline:** Jenkins pipeline integrates with GitHub to fetch the latest code and apply infrastructure changes.
- **Infrastructure as Code (IaC):** Ensures consistent and reproducible infrastructure deployments.

## Prerequisites
- Jenkins installed and configured on a server (e.g., EC2 instance, Vagrant machine).
- AWS account with appropriate permissions to manage resources.
- Terraform installed on the Jenkins server.
- GitHub repository containing your Terraform code.

## Setup Instructions

### 1. Clone the Repository
Clone this GitHub repository to your local machine:
```sh
git clone https://github.com/venugopalreddy1322/Terraform.git
```

### 2. Configure AWS Credentials
Ensure AWS credentials are configured on the Jenkins server. You can use the AWS CLI to configure credentials:
```sh
aws configure
```
Or, set up environment variables:
```sh
export AWS_ACCESS_KEY_ID=your_access_key_id
export AWS_SECRET_ACCESS_KEY=your_secret_access_key
```

### 3. Jenkins Pipeline Configuration
Create a Jenkins pipeline with the following configuration:

```groovy
pipeline {
    agent any
    stages {
        stage('Clean Up') {
            steps {
                deleteDir()
            }
        }
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Stage') {
            steps {
                dir('Day1') {
                    sh """
                        terraform init
                        terraform plan
                        terraform apply --auto-approve
                    """
                }
            }    
        }
        stage('Input message') {
            steps {
                input message: 'Destroy Terraform Resources' 
            }
        }
        stage('Search and Destroy') {
            steps {
                sh 'cd Day1; terraform destroy --auto-approve'
            }
        }
    }
}
```

### 4. Terraform Configuration
Please refer Terraform configuration files (`main.tf`, `variables.tf`, `outputs.tf`) are define the desired AWS infrastructure.

### 5. Run the Pipeline
Trigger the Jenkins pipeline using GitHub Webhook feature to automatically fetch the latest code from GitHub and provision the AWS infrastructure using Terraform.

## Contributing
Feel free to contribute by submitting issues, pull requests, or suggestions to improve the project.


