create-namespaces:
	kubectl create namespace otus-lab
	kubectl create namespace otus-auth
	kubectl create namespace otus-billing
	kubectl create namespace otus-rabbit
	sleep 3

install:
	helm dependency update ./otus-app -n otus-lab
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm install otus-rabbit -f ./rabbitMQ/values.yaml bitnami/rabbitmq -n otus-rabbit
	sleep 10
	helm install otus-app ./otus-app -n otus-lab
	helm install otus-auth ./otus-auth -n otus-auth
	helm install otus-billing ./otus-billing -n otus-billing

install-monitoring:
	helm repo add stable https://kubernetes-charts.storage.googleapis.com
	helm repo update
	helm install prom stable/prometheus-operator -f prometheus.yaml --atomic
	helm install nginx stable/nginx-ingress -f monitoring/nginx-ingress.yaml --atomi

delete-all:
	helm delete otus-app -n otus-lab
	helm delete otus-auth -n otus-auth
	helm delete otus-billing -n otus-billing
	helm delete otus-rabbit -n otus-rabbit

delete-namespaces:
	kubectl delete namespace otus-lab
	kubectl delete namespace otus-auth
	kubectl delete namespace otus-billing
	kubectl delete namespace otus-rabbit

test:
	newman run ./otus_postman_collection.json