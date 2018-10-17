# Certified Kubernetes Administrator (CKA) kata

As far as 04-24-2018 was on ubuntu *16*
and tips said *1.11.1* [pdf](https://www.cncf.io/certification/tips)

## Requirements

- Vagrant
- Virtualbox
- Optional: Make, rubocop, shellcheck

## Run

Spin it up with:

    make up

Stop/Destroy with:

    make down

## Login

    vagrant ssh k8s-controller
    vagrant ssh k8s-node

## Tested on

- MacOSx/Linux
- Virtualbox 5.12
- Vagrant 2.1.1
