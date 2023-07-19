#!/bin/sh
kubectl exec -it -n nextcloud `kubectl get pods -l app.kubernetes.io/name=nextcloud -n nextcloud -o jsonpath='{.items[0].metadata.name}'` -c nextcloud -- runuser --user www-data -- /usr/local/bin/php /var/www/html/occ $@
