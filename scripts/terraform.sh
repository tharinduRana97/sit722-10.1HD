#!/bin/bash

# Set error handling
set -e

# Navigate to the Terraform directory
cd ./scripts/terraform

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Validate Terraform configuration
echo "Validating Terraform configuration..."
terraform validate

# Generate a Terraform execution plan
echo "Creating Terraform plan..."
terraform plan -out=tfplan

# Apply the Terraform plan
echo "Applying the Terraform plan..."
terraform apply tfplan

# Cleanup plan file after deployment (optional)
rm -f tfplan

echo "Infrastructure deployed successfully!"