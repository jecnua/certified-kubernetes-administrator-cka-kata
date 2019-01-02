# Solutions

1)

    kubectl get pods --show-labels

2)

    kubectl get pods --label-columns foo,env

3)

    kubectl get pods --all-namespaces -l env=test
