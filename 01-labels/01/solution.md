# Solution

    kubectl run nginx --image nginx --generator=run-pod/v1 \
      --labels "foo=doo,env=test" --dry-run -o yaml
