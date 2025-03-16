minikube start --vm-driver=docker
docker build -f back_app/Dockerfile -t back_app .
docker build -f front_app/Dockerfile -t front_app .
minikube image load back_app:latest
minikube image load front_app:latest
kubectl apply -f k8s-backend-deployment.yml
kubectl apply -f k8s-frontend-deployment.yml
kubectl apply -f k8s-backend-service.yml
kubectl apply -f k8s-frontend-service.yml
minikube addons enable ingress
kubectl apply -f k8s-flask-app-ingress.yml
minikube tunnel