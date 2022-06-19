#!/bin/bash

function p10k-install(){
    [[ -f /.oh-my-zsh/custom/themes/powerlevel10k ]] && echo "PowerLevel10k already installed" && echo $'' && return 0
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/themes/powerlevel10k
    echo "PowerLevel10k Installed"
}

function zsh-autosuggestions-install(){
    [[ -f /.oh-my-zsh/custom/plugins/zsh-autosuggestions ]] && echo "zsh-autosuggestions already installed" && echo $'' && return 0
    git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/autosuggestions
    echo "zsh-autosuggestions Installed"
}

function zsh-syntax-highlighting-install(){
    [[ -f /.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]] && echo "zsh-syntax-highlighting already installed" && echo $'' && return 0
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
    echo "zsh-syntax-highlighting Installed"
}

function zsh-dircolors-nord-install(){
    [[ -f /.oh-my-zsh/custom/plugins/zsh-dircolors-nord ]] && echo "zsh-dircolors-nord already installed" && echo $'' && return 0
    git clone --recursive https://github.com/coltondick/zsh-dircolors-nord.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-dircolors-nord
    echo "zsh-dircolors-nord Installed"
}

p10k-install
zsh-autosuggestions-install
zsh-syntax-highlighting-install
zsh-dircolors-nord-install