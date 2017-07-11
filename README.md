# Kubernetes Redis Cluster

### Create NFS storages


### Create Persistent Volumes

```
kubectl create -f persistentvolume
```

### Create Persistent Volumes Claims

```
kubectl create -f persistentvolumeclaims
```

### Create Redis Cluster Configuration

```
kubectl create configmap redis-conf --from-file=redis.conf
```

### Create Redis Nodes

```
kubectl create -f deployment
```

### Create Redis Services

```
kubectl create -f services
```

### Connect Nodes

```
kubectl run -i --tty ubuntu --image=ubuntu \
  --restart=Never /bin/bash
```

```
apt-get update
apt-get install -y vim wget python2.7 python-pip redis-tools dnsutils
```

*Note:* `redis-trib` doesn't support hostnames (see [this issue](https://github.com/antirez/redis/issues/2565)), so we use `dig` to resolve our cluster IPs.

```
pip install redis-trib
```

```
redis-trib.py create \
  `dig +short redis-1.default.svc.cluster.local`:6379 \
  `dig +short redis-2.default.svc.cluster.local`:6379 \
  `dig +short redis-3.default.svc.cluster.local`:6379

redis-trib.py replicate --master-addr `dig +short redis-1.default.svc.cluster.local`:6379 --slave-addr `dig +short redis-4.default.svc.cluster.local`:6379
redis-trib.py replicate --master-addr `dig +short redis-2.default.svc.cluster.local`:6379 --slave-addr `dig +short redis-5.default.svc.cluster.local`:6379
redis-trib.py replicate --master-addr `dig +short redis-3.default.svc.cluster.local`:6379 --slave-addr `dig +short redis-6.default.svc.cluster.local`:6379
```

### Accessing redis cli

Connect to any redis pod
```
kubectl exec -it <podName> -- /bin/bash
```
Access cli
```
/usr/local/bin/redis-cli -c -p 6379
```
To check cluster nodes
```
/usr/local/bin/redis-cli -p 6379 cluster nodes
```


### Contribs

```
Originally contributed by Kelsey Hightower (https://github.com/kelseyhightower/kubernetes-redis-cluster)
Special thanks to following forks
https://github.com/matiasinsaurralde/kubernetes-redis-cluster
https://github.com/cwza/kubernetes-redis-cluster
```
