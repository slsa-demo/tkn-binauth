
#!/bin/bash

#switch context to tekton cluster
kubectx tkn

#install tasks git-clone and kaniko-chains from tekton hub
tkn hub install task git-clone
tkn hub install task kaniko

#install pipeline that uses kaniko to build container
kubectl apply -f kaniko-pipeline.yaml

#create PVC for the workspace shared across taks
kubectl apply -f workspace-pvc.yaml


