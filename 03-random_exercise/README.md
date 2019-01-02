# Random

## 01) Jobs

Create a Job that runs 60 time with 2 jobs running in parallel

- [https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/](https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/)

## 02) Kubectl sort

Apply the yaml first. result should be:

    aca
    aba
    aaa

- [https://kubernetes.io/docs/reference/kubectl/cheatsheet/](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

## 03) Init container and mount

You have an init container with a volume mount. Add an init container that
creates an empty file in the volume.

## 99) Find which pod is taking max cpu (test on real cluster and install heapster)

$ pods=$(kubectl get pods --selector=job-name=pi --output=jsonpath={.items..metadata.name})
$ echo $pods
