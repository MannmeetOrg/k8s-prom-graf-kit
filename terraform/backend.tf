terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"      # Replace with your S3 bucket name
    key            = "k8s-monitoring/terraform.tfstate" # State file path inside the bucket
    region         = "us-east-1"                        # Replace with your AWS region
    dynamodb_table = "terraform-lock-table"             # DynamoDB table for state locking
    encrypt        = true                               # Enable encryption at rest
  }
}



# terraform {
#   backend "azurerm" {
#     resource_group_name   = "your-resource-group-name"    # Replace with your Azure resource group
#     storage_account_name  = "yourstorageaccountname"      # Replace with your Azure storage account name (must be globally unique, lowercase)
#     container_name        = "your-container-name"         # The blob container where the state file will be stored
#     key                   = "k8s-monitoring/terraform.tfstate"  # Path + filename for your Terraform state file
#   }
# }

# terraform {
#   backend "gcs" {
#     bucket  = "your-gcs-bucket-name"        # Replace with your Google Cloud Storage bucket name
#     prefix  = "k8s-monitoring/terraform.tfstate"  # Path inside the bucket for state file
#   }
# }
