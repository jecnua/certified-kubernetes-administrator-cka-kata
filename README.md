# Certified Kubernetes Administrator (CKA) kata

![status](https://img.shields.io/badge/project_status-active-green.svg)

As far as 04-24-2018 was on ubuntu *16* and the tips document
says *1.11.1* [pdf](https://www.cncf.io/certification/tips)

## Requirements

- Vagrant
- Virtualbox
- Optional: Make, rubocop, shellcheck

~1.5GB of RAM

## Run

Spin it up with:

    make up

Stop/Destroy with:

    make down

## Login

To login on the controller:

    vagrant ssh controller

To login on the node:

    vagrant ssh node01

## Tested on

- Ubuntu Linux 18.02
- Virtualbox 5.2.10
- Vagrant 2.2.0
