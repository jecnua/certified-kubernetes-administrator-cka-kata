# Solution

    kubectl get pv \
      -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}' \
      --sort-by '{.spec.capacity.storage}'
