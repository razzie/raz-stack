.PHONY: deploy
deploy:
	helmfile sync

.PHONY: install-helm-diff
install-helm-diff:
	helm plugin install https://github.com/databus23/helm-diff