#!/usr/bin/env bash

set -o errexit

# https://kubernetes.io/releases/
KUBECTL=1.21.4
# https://github.com/kubernetes-sigs/kustomize/releases
KUSTOMIZE=4.3.0
# https://github.com/helm/helm/releases
HELM_V3=3.6.3
# https://github.com/go-task/task/releases
TASK=3.7.0

mkdir -p /tmp 
cd /tmp

echo "downloading kubectl ${KUBECTL}"
curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL}/bin/linux/amd64/kubectl \
-o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
kubectl version --client

echo "downloading kustomize ${KUSTOMIZE}"
curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE}/kustomize_v${KUSTOMIZE}_linux_amd64.tar.gz | \
tar xz && mv kustomize /usr/local/bin/kustomize
kustomize version

echo "downloading helm ${HELM_V3}"
curl -sSL https://get.helm.sh/helm-v${HELM_V3}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64
helm version

echo "downloading yq"
curl -sL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
-o /usr/local/bin/yq && chmod +x /usr/local/bin/yq
yq --version

echo "downloading jq"
curl -sL https://github.com/stedolan/jq/releases/latest/download/jq-linux64 \
-o /usr/local/bin/jq && chmod +x /usr/local/bin/jq
jq --version

echo "downloading task"
curl -sSL https://github.com/go-task/task/releases/download/v${TASK}/task_linux_arm.tar.gz | \
  tar xz && mv task /usr/local/bin/task && chmod +x /usr/local/bin/task
task --version

cd /
rm -rf /tmp
