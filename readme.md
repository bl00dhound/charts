## Install
  ```
  helm dependency update ./otus-app
  helm install otus-app ./otus-app
  ```
  Run tests
  ```
  newman run ./otus_architect.postman_collection.json
  ```