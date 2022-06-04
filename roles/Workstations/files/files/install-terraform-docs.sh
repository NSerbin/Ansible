#!/bin/bash

function terraform-docs-install() {
    [[ -f /usr/local/bin/terraform-docs ]] && echo "$(/usr/local/bin/terraform-docs version) already installed at /usr/local/bin/terraform-docs" && return 0
    VERSION=$(curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\, | awk '{$1=$1};1')
    wget https://terraform-docs.io/dl/"${VERSION}"/terraform-docs-"${VERSION}"-linux-amd64.tar.gz
    (tar -xzf terraform-docs-"${VERSION}"-linux-amd64.tar.gz && chmod +x terraform-docs)
    (mv terraform-docs /usr/local/bin/ && rm terraform-docs-"${VERSION}"-linux-amd64.tar.gz)

    echo "Installed: $(/usr/local/bin/terraform-docs version)"
}

terraform-docs-install