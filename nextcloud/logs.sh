#!/bin/sh
kubectl exec -it -n nextcloud `kubectl get pods -l app.kubernetes.io/name=nextcloud -n nextcloud -o jsonpath='{.items[0].metadata.name}'` -c nextcloud -- runuser --user www-data -- sh -c "tail -n 5 -f /var/www/html/data/nextcloud.log | jq 'del(.exception)'"
