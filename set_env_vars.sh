#!/bin/bash

export PROJECT_ID=[REPLACE_ME]
export ORGANIZATION_ID=[REPLACE_ME]
export BILLING_ACCOUNT=[REPLACE_ME]
#if running on Argolis, uncomment next line and set GCP_USER_ACCOUNT to Argolis user account
export GCP_USER_ACCOUNT=[REPLACE_ME]
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')

export TEKTON_CLUSTER=tkn-cluster
export WORKLOAD_CLUSTER=wkload-cluster
export ARTIFACT_REPO=my-repo

export KSA_NAME=tekton-ksa
export NAMESPACE=default
export GSA_NAME=tekton-gsa

export KEYRING=tekton-chains-ring
export LOCATION=us-central1
export ZONE=us-central1-c
export KEY=tekton-chains-key
export KEY_VERSION=1
export KMS_URI="gcpkms://projects/${PROJECT_ID}/locations/${LOCATION}/keyRings/${KEYRING}/cryptoKeys/${KEY}/cryptoKeyVersions/${KEY_VERSION}"

export ATTESTOR_NAME=tekton-chains-attestor
export NOTE_ID=projects/${PROJECT_ID}/notes/tekton-default-simplesigning
export ATTESTOR_SA=service-${PROJECT_NUMBER}@gcp-sa-binaryauthorization.iam.gserviceaccount.com
