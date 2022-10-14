#!/bin/bash

export PROJECT_ID=[REPLACE_ME]
export ORGANIZATION_ID=[REPLACE_ME]
export BILLING_ACCOUNT=[REPLACE_ME]
export GCP_USER_ACCOUNT=[REPLACE_ME]

export TEKTON_CLUSTER=tkn-cluster
export WORKLOAD_CLUSTER=wkload-cluster

export KSA_NAME=tekton-ksa
export NAMESPACE=default
export GSA_NAME=tekton-gsa

export KEYRING=tekton-chains-ring
export LOCATION=us-central1
export KEY=tekton-chains-key
export KEY_VERSION=1
export KMS_URI="gcpkms://projects/${KEY_PROJECT}/locations/${LOCATION}/keyRings/${KEYRING}/cryptoKeys/${KEY}/cryptoKeyVersions/${KEY_VERSION}"

export ATTESTOR_NAME=tekton-chains-attestor
export NOTE_ID=projects/${PROJECT_ID}/notes/tekton-default-simplesigning