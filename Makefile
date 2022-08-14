.PHONY: all
all: shared apps mailserver nextcloud

.PHONY: shared
shared:
	@$(shell xargs < .env) helmfile -f shared/helmfile.yaml sync

.PHONY: apps
apps:
	@$(shell xargs < .env) helmfile -f apps/helmfile.yaml sync

.PHONY: mailserver
mailserver:
	@$(shell xargs < .env) helmfile -f mailserver/helmfile.yaml sync

.PHONY: nextcloud
nextcloud:
	@$(shell xargs < .env) helmfile -f nextcloud/helmfile.yaml sync

.PHONY: check-images
check-images:
	kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" |\
		tr -s '[[:space:]]' '\n' |\
		sort |\
		uniq -c

.PHONY: install-helm-diff
install-helm-diff:
	helm plugin install https://github.com/databus23/helm-diff
