## Install

  Create namespaces

  ```
  make create-namespaces
  ```

  Install services

  ```
  make install
  ```

  Share database port for local development
  ```
  kubectl port-forward --namespace otus-lab service/otus-app-postgresql 5432:5432
  ```

##  Run tests
  ```
  make test
  ```

### Install monitoring
  ```
  make install-monitoring
  ```

### Remove services
  ```
  make delete-all
  make delete-namespaces
  ```
