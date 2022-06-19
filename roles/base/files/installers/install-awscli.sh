#!/bin/bash

function awscli-install(){
    [[ -f /usr/local/bin/aws ]] && echo "awscli $(aws --version) already installed at $(which aws)" && echo $'' && return 0    
    curl -o awscli.zip https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
    unzip awscli.zip
    (./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws)
    rm -rf awscli.zip awscli-bundle
    echo "Installed: awscli Version: $(aws --version)"
}

awscli-install