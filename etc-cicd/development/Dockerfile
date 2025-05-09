FROM ubuntu:24.04

USER root

RUN \
  apt update --yes && \
  apt upgrade --yes

RUN apt install --yes \
  curl \
  wget \
  gpg \
  lsb-release \
  git

# INSTALL helm
RUN curl --fail \
  --silent --show-error --location \
  --output get_helm.sh \
  https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
  chmod 700 get_helm.sh && \
  ./get_helm.sh

# INSTALL terraform
RUN wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
  apt update --yes && apt install --yes terraform

# INSTALL kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin

# INSTALL kustomize
RUN curl --silent \
 "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
RUN mv kustomize /usr/local/bin

# INSTALL bc
RUN apt install --yes bc
