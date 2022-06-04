#!/bin/bash

function eksctl-install(){
  [[ -f /usr/local/bin/eksctl ]] && echo "$(/usr/local/bin/eksctl version) already installed at /usr/local/bin/eksctl" && return 0    
  VERSION=$(curl -s https://api.github.com/repos/weaveworks/eksctl/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\, | awk '{$1=$1};1')
  wget https://github.com/weaveworks/eksctl/releases/download/"${VERSION}"/eksctl_Linux_amd64.tar.gz
  (tar -xzf eksctl_Linux_amd64.tar.gz && mv eksctl /usr/local/bin && rm eksctl_Linux_amd64.tar.gz)
  
  echo "Installed: eksctl Version: $(/usr/local/bin/eksctl version)"

}

eksctl-install