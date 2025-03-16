# Lucky number

## Description

This is a simple application that get `GET` requests by one app (front_app), redirect it to another app (back_app) which return result to front_app and then front_app return response to client.

## How to run

You should install on your device Docker, curl, kubectl and Minikube. All steps are correctly for Windows OS.

You can follow all below command or run *boring_commands.bat* (`.\boring_commands`) instead of 1 -- 12 steps

0. clone repository `git clone https://github.com/ExtremCode/fluffy-octo-waffle.git` and run Docker
1. `minikube start --vm-driver=docker`
2. `docker build -f back_app/Dockerfile -t back_app .` create backend image
3. `docker build -f front_app/Dockerfile -t front_app .` create frontend image
4. `minikube image load back_app:latest` to load back_app image to kubernetes cluster
5. `minikube image load front_app:latest` to load front_app image to cluster
6. `kubectl apply -f k8s-backend-deployment.yml` to create pods for backend
7. `kubectl apply -f k8s-frontend-deployment.yml` to create pods for frontend
8. `kubectl apply -f k8s-backend-service.yml` to create service for backend
9. `kubectl apply -f k8s-frontend-service.yml` to create service for frontend
10. `minikube addons enable ingress` to enable ingress
11. `kubectl apply -f k8s-flask-app-ingress.yml` to create ingress instance for frontend
12. `minikube tunnel` to enable getting requests from external world for frontend. You should write password to use this
13. `curl http://$(minikube ip)` to get your lucky number (run in another terminal)
