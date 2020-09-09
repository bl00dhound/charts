install-apps:
	# kubectl create namespace otus-lab
	# kubectl create namespace otus-auth
	# kubectl create namespace otus-billing
	# helm dependency update ./otus-app -n otus-lab
	helm install otus-app ./otus-app -n otus-lab
	helm install otus-auth ./otus-auth -n otus-auth
	helm install otus-billing ./otus-billing -n otus-billing

rabbit:
	kubectl create namespace otus-rabbit
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm install otus-rabbit -f ./rabbitMQ/values.yaml bitnami/rabbitmq -n otus-rabbit

delete-all:
	helm delete otus-app -n otus-lab
	helm delete otus-auth -n otus-auth
	helm delete otus-rabbit -n otus-rabbit
	helm delete otus-billing -n otus-billing