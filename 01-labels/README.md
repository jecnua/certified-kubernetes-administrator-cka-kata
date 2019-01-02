# Labels

## Prerequisites

*Minikube* is enough for these exercises.

## Exercises

### 01) Create pod with labels

Create a pod with the imperative syntax with the following labels:

- foo=doo
- env=test

image can be anything, just use nginx.

- [Solution](01/solution.md)
- [Solution(pod)](01/pod.yaml)

NOTE: Leave the pod running.

### 02) Display labels with kubectl

- Get only pods with labels env=test in all namespaces
- Show all the labels of the pod running
- Show the content of labels env and foo as columns

- [Solution](02/solution.md)

### 03) Add, modify and delete label on the pod

- Create a new label on the existing pod called one=one
- Modify the label one to have value two
- Delete the label one

- [Solution](03/solution.md)

### 04) Equality and set based selection

Apply the pod.yaml in this directory.

- Get all the pods of team green
- Get all labels where the team IS NOT green and env is qa
- Get all pods with label env
- Get all pods that ARE NOT in qa (but label exists)

- [Solution](04/solution.md)

## Cleanup

Delete all the pod
