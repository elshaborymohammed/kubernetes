#!/usr/bin/env make

.PHONY: 
	minikue-start minikue-status namespaces\
	deployment get remove apply delete port-forward \
	ingress.apply ingress.delete ingress.get ingress.watch ingress.describe

minikue-start:
	minikube start --driver=docker

minikue-status:
	minikube status

namespaces:
	kubectl get namespace

deployment:
	kubectl create deployment nginx-deployment --image=nginx

remove:
	kubectl delete deployment hello-kubernetes-first || true
	kubectl delete service hello-kubernetes-first || true

apply:
	kubectl apply -f hello-kubernetes-first.yaml
ingress.apply:
	kubectl apply -f ingress.yaml

delete:
	kubectl delete -f hello-kubernetes-first.yaml

ingress.delete:
	kubectl delete -f ingress.yaml
ingress.watch:
	kubectl get ingress -A --watch
ingress.get:
	kubectl get ingress -A
ingress.describe:
	kubectl describe ingress hello-kubernetes-ingress

get:
	kubectl get deployment
	kubectl get replicaset
	kubectl get pod

port-forward:
	kubectl port-forward service/hello-kubernetes-first 8080:80