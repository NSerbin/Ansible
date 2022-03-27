# Personal Ansible Desktop & VMs Configs
I use Ansible to configure my Workstations and Raspberry PI 4.

## Disclaimer
This repository contains a copy of the Ansible configuration that I use for laptop, desktop as well as my Raspberry PI 4.
Please don't directly use this against your own machines, as it is something I developed for myself and may not translate to your use-case. 
It even configures OpenSSH, so if you run it you may get locked out.

## How does it work?
The folder structure breaks down like this:

`begin.yml`: This is the Playbook to use for full update/install/upgrade all my sistems based on roles.

`ansible.cfg`: Configuration settings for Ansible goes here.

`inventory`: This is the inventory file. This is how Ansible knows what group to put a machine in.

`roles/`: This directory contains my Workstation, and RPI roles.

`roles/Workstations`: This role runs only on hosts that are designated to be real PCs I use (Desktop and Laptop). It contains things that are intended to be on every host, such as default configs, users, etc.

`roles/Rpi`: This role runs only on hosts that are designated to be real PCs I use (Desktop and Laptop).

I wanna say thanks to @LearnLinuxTV my work is based in his job/youtube list...
