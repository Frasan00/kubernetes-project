#!/bin/bash

# make sure to have a cluster running on your machine (es. minikube or k3s) and kubectl installed
# this file auto-deploys on your cluster all the microservicies

cd kubernetes

# select one of the above depending on your needs
# minikube addons enable ingress
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
sudo microk8s enable ingress

# for microk8s use microk8s kubectl ...

# mongo
kubectl apply -f mongo-deployment.yml

# server 
kubectl apply -f server-deployment.yml

# nginx
kubectl apply -f ingress.yml

# Informations
sleep 3
echo " "
echo "Pods "
kubectl get pods
echo " "
echo "Servicies "
kubectl get svc
echo " "
echo "Secrets "
kubectl get secret
echo " "
echo "Ingress "
kubectl get ingress nginx-ingress    dfvb