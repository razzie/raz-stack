.PHONY: deploy
deploy:
	helm repo update razzie
	$(shell xargs < .env) helmfile sync

.PHONY: install-helm-diff
install-helm-diff:
	helm plugin install https://github.com/databus23/helm-diff
