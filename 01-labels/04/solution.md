# Solutions

1)

    kubectl get pods --show-labels -l team==green

2)

    kubectl get pods --show-labels -l team!=green,env=qa

3)

    kubectl get pods --show-labels -l 'env'

4)

    kubectl get pods --show-labels -l 'env,env notin (qa)'
