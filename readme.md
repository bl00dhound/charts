## Install

  Need to create two namespaces:

  ```
  kubectl create namespace otus-lab
  kubectl create namespace otus-auth
  kubectl create namespace otus-rabbit
  ```

  Install services by helm:

  ```
  helm dependency update ./otus-app -n otus-lab
  helm install otus-app ./otus-app -n otus-lab
  helm install otus-auth ./otus-auth -n otus-auth
  ```

## Install RabbitMQ

  ```
  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm install otus-rabbit bitnami/rabbitmq
  ```

##  Run tests
  ```
  newman run ./otus_architect.postman_collection.json
  ```

### Install monitoring
  ```
  helm repo add stable https://kubernetes-charts.storage.googleapis.com
  helm repo update
  helm install prom stable/prometheus-operator -f prometheus.yaml --atomic
  helm install nginx stable/nginx-ingress -f monitoring/nginx-ingress.yaml --atomic
  ```
