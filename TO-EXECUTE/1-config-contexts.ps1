kubectl config set-context "1-infrastructure" --cluster=docker-desktop --user=docker-desktop --namespace=infrastructure
kubectl config set-context "2-application" --cluster=docker-desktop --user=docker-desktop --namespace=application


kubectl config use-context "1-infrastructure"
kubectl config use-context "2-application"