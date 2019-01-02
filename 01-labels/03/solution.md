# Solutions

1)

    kubectl label pod nginx one=one
    kubectl get pods --show-labels

2)

    kubectl label pod nginx one=two --overwrite
    kubectl get pods --show-labels

3)

    kubectl label pod nginx one-
    kubectl get pods --show-labels
