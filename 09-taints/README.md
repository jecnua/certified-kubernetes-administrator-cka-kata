# Taints

Exercises with taints and tolerance.

## Setup (GCE)

You will need a multi node setup to test it. For example on google cloud run:

    gcloud container clusters create test \
    --num-nodes 2 \
    --machine-type n1-standard-2 \
    --scopes "https://www.googleapis.com/auth/projecthosting,cloud-platform"

## 0) Check for taints

The normal get nodes won't show you taints:

    kubectl get nodes
    NAME                                  STATUS    ROLES     AGE       VERSION
    gke-test-default-pool-169fc780-dwhp   Ready     <none>    5m        v1.9.7-gke.11
    gke-test-default-pool-169fc780-k2m6   Ready     <none>    5m        v1.9.7-gke.11
    gke-test-default-pool-169fc780-lcks   Ready     <none>    5m        v1.9.7-gke.11
    gke-test-default-pool-169fc780-rqgt   Ready     <none>    5m        v1.9.7-gke.11

Nor will -o wide.

## 1) Create a Taint

Create a simple taint:

    kubectl taint node gke-test-default-pool-169fc780-lcks env=unstable:NoSchedule

## 2) List all taints on all nodes

    $ kubectl get nodes -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.taints[*].key}{" "}{.spec.taints[*].value}{":"}{.spec.taints[*].effect}{"\n"}'
    gke-test-default-pool-169fc780-dwhp      :
    gke-test-default-pool-169fc780-k2m6      :
    gke-test-default-pool-169fc780-lcks     env unstable:NoSchedule
    gke-test-default-pool-169fc780-rqgt      :

or using custom colums:

    $ kubectl get nodes -o=custom-columns=NAME:.metadata.name,TAINTS:.spec.taints
    NAME                                  TAINTS
    gke-test-default-pool-169fc780-dwhp   <none>
    gke-test-default-pool-169fc780-k2m6   <none>
    gke-test-default-pool-169fc780-lcks   [map[effect:NoSchedule key:env value:unstable]]
    gke-test-default-pool-169fc780-rqgt   <none>

## 4) Run 20 pods with no tolerance

    kubectl get pods -o=jsonpath='{range .items[*]}{.spec.nodeName}{"\n"}' | sort | uniq

## 3) Run 20 pods with no tolerance

    kubectl get pods -o=jsonpath='{range .items[*]}{.spec.nodeName}{"\n"}' | sort | uniq

## 4) Remove a Taint

    kubectl taint node gke-test-default-pool-169fc780-lcks env-
