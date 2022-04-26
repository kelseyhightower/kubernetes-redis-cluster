# Kubernetes Redis-4.0.0 Cluster


### [Build Docker image](README-build-docker.md)


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
kubectl create -f deployment-configmaps
```

### Create Redis Services

```
kubectl create -f deployment-services
```

### Create Redis Nodes

```
kubectl create -f deployment
```

### Connect Nodes

```
kubectl run -i --tty ubuntu --image=ubuntu \
  --restart=Never /bin/bash
```

```
apt-get update
apt-get install -y vim wget python2.7 python-pip redis-tools dnsutils
wget http://download.redis.io/redis-stable/src/redis-trib.rb
chmod 755 redis-trib.rb
```

```
./redis-trib.rb create --replicas 1 \
  10.111.103.1:6379 \
  10.111.103.2:6379 \
  10.111.103.3:6379 \
  10.111.103.4:6379 \
  10.111.103.5:6379 \
  10.111.103.6:6379
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
