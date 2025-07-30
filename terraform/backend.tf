terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"      # Replace with your S3 bucket name
    key            = "k8s-monitoring/terraform.tfstate" # State file path inside the bucket
    region         = "us-east-1"                        # Replace with your AWS region
    dynamodb_table = "terraform-lock-table"             # DynamoDB table for state locking
    encrypt        = true                               # Enable encryption at rest
  }
}
