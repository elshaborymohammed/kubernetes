#!/usr/bin/env make

.PHONY: 
	create template list install upgrade rollback rollback_1 history delete \
	configmap secret describe-configmap describe-secret

create:
	helm create hello

template:
	helm template first-chart .

list:
	helm list

install:
	helm install first-chart .

upgrade:
	helm upgrade first-chart

rollback:
	helm rollback first-chart

rollback_1:
	helm rollback first-chart 1

history:
	helm history first-chart

delete:
	helm delete first-chart


configmap:
	kubectl get cm

secret:
	kubectl get secret

describe-configmap:
	kubectl describe configmap first-chart-configmap

describe-secret:
	kubectl describe secret first-secret