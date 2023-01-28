#!/bin/bash

function terraform-docs-install() {
  # Check if terraform-docs is installed
  if ! command -v terraform-docs > /dev/null; then
    echo "terraform-docs not found, installing..."
    # Get the latest Release
    wget $(curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep -o "https://.*terraform-docs_.*_linux_amd64.zip") -O terraform-docs.zip
    # unzip and move binary to /usr/local/bin
    unzip terraform-docs.zip && rm terraform-docs.zip
    sudo mv terraform-docs /usr/local/bin
    echo "Terraform successfully installed."
  else
    echo "terraform-docs already installed"
  fi
}

function terraform-install() {
  # Check if terraform is installed
  if ! which terraform > /dev/null; then
      echo "terraform-docs not found, installing..."
      # Get the latest Release of Terraform
      wget https://releases.hashicorp.com/terraform/latest/terraform_latest_linux_amd64.zip
      unzip terraform_latest_linux_amd64.zip && rm terraform_latest_linux_amd64.zip
      sudo mv terraform /usr/local/bin/
      echo "Terraform successfully installed and added to PATH."
  else
      echo "Terraform is already installed."
  fi
}

terraform-install

terraform-docs-install
