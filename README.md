# AWS ECS CI/CD Pipeline

Automated deployment pipeline for a Flask application on AWS ECS Fargate.

## What It Does

Push code to GitHub → Pipeline builds Docker image → Deploys to ECS → Auto scales based on load

Zero manual steps after the initial setup.

## Architecture

- **ECS Fargate** — Runs containers without managing servers
- **Application Load Balancer** — Distributes traffic, handles health checks
- **CodePipeline** — Orchestrates the deployment flow
- **CodeBuild** — Builds Docker images, pushes to ECR
- **Auto Scaling** — Adjusts task count based on CPU utilization

## Tech Stack

- Terraform (Infrastructure as Code)
- AWS (ECS, ECR, ALB, CodePipeline, CodeBuild, IAM, VPC)
- Docker
- Python/Flask

## Project Structure
```
aws-ecs-project/
├── app/                    
│   ├── app.py
│   ├── Dockerfile
│   ├── requirements.txt
│   └── buildspec.yml
└── terraform/
    ├── backend-setup/      # S3 bucket for Terraform state
    └── infrastructure/     # All AWS resources
```

## Setup

**1. Create the state bucket:**
```bash
cd terraform/backend-setup
terraform init
terraform apply
```

Note the bucket name from the output.

**2. Configure backend:**

Update `terraform/infrastructure/backend.config` with your bucket name.

**3. Deploy infrastructure:**
```bash
cd terraform/infrastructure
terraform init -backend-config backend.config
terraform apply
```

**4. Approve GitHub connection:**

Go to AWS Console → CodePipeline → Settings → Connections. Click "Update pending connection" and install the AWS Connector app on GitHub.

**5. Push code:**

The pipeline triggers automatically on push to main.

## Tear Down
```bash
cd terraform/infrastructure
terraform destroy

cd terraform/backend-setup
terraform destroy
```
