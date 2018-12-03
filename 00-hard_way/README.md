# The hard way

-   [kelseyhightower/kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way)

In a bare machine, install all the tools needed to generate SSL and create
all the CA we need to install kubernetes.

## Setup

    vagrant up

It will spin up a bare ubuntu box.

## Step 1) Install tools to generate certs

-   <https://kubernetes.io/docs/concepts/cluster-administration/certificates/#cfssl>: Search for certificates

Install:

-   cfssl
-   cfssljson

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

https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#securing-etcd-clusters

    etcd --listen-client-urls=http://127.0.0.1:2379 --advertise-client-urls=http://127.0.0.1:2379 &
    vagrant@bare:~/cert$ sudo ETCDCTL_API=3 etcdctl member list                                           
    8e9e05c52164694d, started, default, http://localhost:2380, http://127.0.0.1:2379

POINT 1:

If you are running etcd in single node without certs, change it on the config too
to use http not https

POINT 2:

$ curl --cacert ca.pem https://127.0.0.1:6443/version
{
  "major": "1",
  "minor": "12",
  "gitVersion": "v1.12.0",
  "gitCommit": "0ed33881dc4355495f623c6f22e7dd0b7632b7c0",
  "gitTreeState": "clean",
  "buildDate": "2018-09-27T16:55:41Z",
  "goVersion": "go1.10.4",
  "compiler": "gc",
  "platform": "linux/amd64"
}

## Step 2) Install kubectl and autocomplete

Install:

-   kubectl

Q: Only on the master or also the nodes?

### Note

virtualbox will fail if you are running minikube.

    ==> controller: Booting VM...
    There was an error while executing `VBoxManage`, a CLI used by Vagrant
    for controlling VirtualBox. The command and stderr is shown below.
    Command: ["startvm", "1bd2d0fe-0ec6-44e5-9d8d-4bfaee8996dc", "--type", "headless"]
    Stderr: VBoxManage: error: VT-x is being used by another hypervisor (VERR_VMX_IN_VMX_ROOT_MODE).
    VBoxManage: error: VirtualBox can't operate in VMX root mode. Please disable the KVM kernel extension, recompile your kernel and reboot (VERR_VMX_IN_VMX_ROOT_MODE)
    VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component ConsoleWrap, interface IConsole
