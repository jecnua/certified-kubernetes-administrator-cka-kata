# The hard way

-   [kelseyhightower/kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way)

## Setup

    vagrant up

It will spin up a bare ubuntu box.

## Step 1) Install tools to generate certs

-   <https://kubernetes.io/docs/concepts/cluster-administration/certificates/#cfssl>: Search for certificates

Install:

-   cfssl
-   cfssljson

Q: Only on the master or also the nodes?

## Step 2) Install kubectl and autocomplete

Install:

-   kubectl

Q: Only on the master or also the nodes?

## Step 3) Generate certs

-   <https://kubernetes.io/docs/setup/certificates/>

-   Create certificate authority

TLS certificates for the following components:

-   etcd
-   kube-apiserver
-   kube-controller-manager
-   kube-scheduler
-   kubelet
-   kube-proxy

READ: <https://jvns.ca/blog/2017/08/05/how-kubernetes-certificates-work/>

### Note

virtualbox will fail if you are running minikube.

    ==> controller: Booting VM...
    There was an error while executing `VBoxManage`, a CLI used by Vagrant
    for controlling VirtualBox. The command and stderr is shown below.
    Command: ["startvm", "1bd2d0fe-0ec6-44e5-9d8d-4bfaee8996dc", "--type", "headless"]
    Stderr: VBoxManage: error: VT-x is being used by another hypervisor (VERR_VMX_IN_VMX_ROOT_MODE).
    VBoxManage: error: VirtualBox can't operate in VMX root mode. Please disable the KVM kernel extension, recompile your kernel and reboot (VERR_VMX_IN_VMX_ROOT_MODE)
    VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component ConsoleWrap, interface IConsole
