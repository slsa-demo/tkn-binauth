#!/bin/bash
source set_env_vars.sh

#get IMAGE DIGEST and URL from the last Pipeline Run
kubectx tkn
export IMAGE_DIGEST=$(tkn pr describe --last -o jsonpath="{.status.taskRuns..taskResults[?(@.name=='IMAGE_DIGEST')].value}")
export IMAGE_URL=$(tkn pr describe --last -o jsonpath="{.status.taskRuns..taskResults[?(@.name=='IMAGE_URL')].value}")

#get security context and rename it to workload cluster
gcloud container clusters get-credentials --zone=${ZONE} "${WORKLOAD_CLUSTER}" 
kubectx workload-cluster=$(kubectx -c)


echo "Deploying a workload that should fail due to BinAuth Policy"
kubectl --context workload-cluster create deployment not-allowed --image=docker.io/veermuchandi/welcome

echo "Deploying a workload that was attested"
kubectl --context workload-cluster create deployment allowed --image=${IMAGE_URL}@${IMAGE_DIGEST}

echo "Verify that the application is running"
kubectl --context workload-cluster get pods -n default -w