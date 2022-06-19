#!/bin/bash

function kubectl-install(){
  [[ -f /usr/local/bin/kubectl ]] && echo "Kubectl $(kubectl version -oyaml --client|awk '/gitVersion/{print $2;}') already installed at $(which kubectl)" && echo $'' && return 0    
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  (chmod +x kubectl && mv kubectl /usr/local/bin)
  echo "Installed: kubectl Version: $(kubectl version -oyaml)"
}

function eksctl-install(){
  [[ -f /usr/local/bin/eksctl ]] && echo "Eksctl $(/usr/local/bin/eksctl version) already installed at $(which eksctl)" && echo $'' && return 0    
  VERSION=$(curl -s https://api.github.com/repos/weaveworks/eksctl/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\, | awk '{$1=$1};1')
  wget https://github.com/weaveworks/eksctl/releases/download/"${VERSION}"/eksctl_Linux_amd64.tar.gz
  (tar -xzf eksctl_Linux_amd64.tar.gz && mv eksctl /usr/local/bin && rm eksctl_Linux_amd64.tar.gz)
  echo "Installed: eksctl Version: $(/usr/local/bin/eksctl version)"
}

function kubectx-install(){
  [[ -f /usr/local/bin/kubectx ]] && [[ -f /usr/local/bin/kubens ]] && echo "Kubectx already installed at $(which kubectx)" && echo $'' && echo "Kubens already installed at $(which kubens)" && return 0
  git clone https://github.com/ahmetb/kubectx /opt/kubectx
  (ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx && ln -s /opt/kubectx/kubens /usr/local/bin/kubens)

  echo "Kubectx is installed at $(which kubectx)"
  echo "Kubens is installed at $(which kubens)"
}

kubectl-install

eksctl-install

kubectx-install