#!/bin/bash

function terraform-docs-install() {
    [[ -f /usr/local/bin/terraform-docs ]] && echo "$(/usr/local/bin/terraform-docs version) already installed at /usr/local/bin/terraform-docs" && return 0
    VERSION=$(curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\, | awk '{$1=$1};1')
    wget https://terraform-docs.io/dl/"${VERSION}"/terraform-docs-"${VERSION}"-linux-amd64.tar.gz
    (tar -xzf terraform-docs-"${VERSION}"-linux-amd64.tar.gz && chmod +x terraform-docs)
    (mv terraform-docs /usr/local/bin/ && rm terraform-docs-"${VERSION}"-linux-amd64.tar.gz)

    echo "Installed: $(/usr/local/bin/terraform-docs version)"
}

function terraform-install() {
  [[ -f /usr/local/bin/terraform ]] && echo "$(/usr/local/bin/terraform version) already installed at /usr/local/bin/terraform" && return 0
  VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1')
  wget https://releases.hashicorp.com/terraform/"${VERSION}"/terraform_"${VERSION}"_linux_amd64.zip
  (unzip terraform_"${VERSION}"_linux_amd64.zip && mv terraform /usr/local/bin/ && rm terraform_"${VERSION}"_linux_amd64.zip) 
  echo "Installed: $(/usr/local/bin/terraform version)"
  
}

terraform-install

terraform-docs-install