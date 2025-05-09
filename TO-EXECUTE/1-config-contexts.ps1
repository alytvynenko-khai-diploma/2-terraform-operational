# 1. Create config contexts

kubectl config set-context "0-infrastructure" --cluster=docker-desktop --user=docker-desktop --namespace=infrastructure

kubectl config set-context "1-application" --cluster=docker-desktop --user=docker-desktop --namespace=application

kubectl config set-context "2-app-and-infra" --cluster=docker-desktop --user=docker-desktop --namespace=app-and-infra

# 2. Use created contexts

kubectl config use-context "0-infrastructure"

kubectl config use-context "1-application"

kubectl config use-context "2-app-and-infra"

