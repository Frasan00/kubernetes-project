#!/bin/bash

kubectl delete all --all
kubectl delete ingress nginx-ingress
kubectl delete pods -n ingress-nginx -l app.kubernetes.io/name=ingress-nginx
