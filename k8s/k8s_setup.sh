#!/bin/bash
# Sets up K8s deployment, configmap + svc for patsite

echo "Ensuring namespace 'webpages' is created..."
kubectl create ns webpages
kubectl apply -f k8s_svc.yml
echo "K8s svc created..."
kubectl apply -f k8s_config.yml
echo "K8s configmap created..."
kubectl apply -f k8s_deploy.yml
echo "K8s deployment created."
kubectl apply -f k8s_np.yml
echo "K8s network policy set to denyall traffic to+from pods for webpages ns"
echo "K8s set-up completed :)"


