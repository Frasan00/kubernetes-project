#!/bin/bash

# make sure to have a cluster running on your machine (es. minikube or k3s) and kubectl installed
# this file auto-deploys on your cluster all the microservicies

cd kubernetes
minikube addons enable ingress

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
kubectl get ingress nginx-ingress