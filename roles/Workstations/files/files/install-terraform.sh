#!/bin/bash

function terraform-install() {
  [[ -f /usr/local/bin/terraform ]] && echo "$(/usr/local/bin/terraform version) already installed at /usr/local/bin/terraform" && return 0
  VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1')
  wget https://releases.hashicorp.com/terraform/"${VERSION}"/terraform_"${VERSION}"_linux_amd64.zip
  (unzip terraform_"${VERSION}"_linux_amd64.zip && mv terraform /usr/local/bin/ && rm terraform_"${VERSION}"_linux_amd64.zip)
}

terraform-install