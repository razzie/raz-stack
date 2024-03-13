## Notes to self

### Create single node cluster
```
microk8s enable dns ingress metallb hostpath-storage metrics-server dashboard
```

### Check and refresh k8s certs
```
microk8s refresh-certs -c
microk8s refresh-certs -e server.crt
microk8s refresh-certs -e front-proxy-client.crt
```
