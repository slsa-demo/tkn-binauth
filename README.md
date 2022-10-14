# WORK IN PROGRESS

# Build Provenance using Tekton Chains and verify with Binary Authorization

## Prerequisites

Tools
* kubectl
* gcloud
* kubectx
* jq


## Set up two clusters 

Here we will set up two clusters:
1. Tekton cluster to run Tekton pipelines and Tekton Chains configured using Workload Identity. This cluster will be used for CICD i.e., build application containers and deploy.
2. Workload cluster that is secured with Binary Authorization to run only those containers that meet the Binary Authorization criteria

### Edit the environment variables 
Edit [set_env_vars.sh](./set_env_vars.sh) to replace the values for environment variables such a project name, billing account, organization id, service accounts etc.

### Create GKE clusters
Run the script that will create a project, enable required APIs and create two clusters

```
./setup_k8s_clusters.sh
```
Ensure both cluster are in running status by verifying using the command

```
gcloud container clusters list
```

## Install Tekton and Tekton Chains

On the Tekton cluster, we will now install Tekton, Tekton Pipelines and setup KMS key so that Tekton chains can attest using the key, and the chains configs are updated to be able to do so. Workload identity will be configured so that kubernetes service account has necessary access to push images to artifact registry. Google service account associated with this Kubernetes service account will be given necessary access through IAM.

```
./setup_tekton.sh
```

## Run pipeline 

WORK IN PROGRESS







