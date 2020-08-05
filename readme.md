## Install
  ```
  helm dependency update ./otus-app
  helm install otus-app ./otus-app
  ```
#  Run tests
  ```
  newman run ./otus_architect.postman_collection.json
  ```

### Install monitoring
  ```
  helm repo add stable https://kubernetes-charts.storage.googleapis.com
  helm repo update
  helm install prom stable/prometheus-operator -f prometheus.yaml -f graphana.yaml --atomic
  helm install nginx stable/nginx-ingress -f monitoring/nginx-ingress.yaml --atomic
  ```
