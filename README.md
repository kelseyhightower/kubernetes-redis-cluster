# Kubernetes Redis Cluster

### Create Disks

```
gcloud compute disks create --size=10GB \
  'redis-1' 'redis-2' 'redis-3' \
  'redis-4' 'redis-5' 'redis-6'
```

### Create Redis Cluster Configuration

```
kubectl create configmap redis-conf --from-file=redis.conf
```

### Create Redis Nodes

```
kubectl create -f replicasets
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
apt-get install ruby vim wget redis-tools
wget http://download.redis.io/redis-stable/src/redis-trib.rb
```

```
./redis-trib.rb create --replicas 1 \
  10.131.242.1:6379 \
  10.131.242.2:6379 \
  10.131.242.3:6379 \
  10.131.242.4:6379 \
  10.131.242.5:6379 \
  10.131.242.6:6379
```

### Add a new node

```
gcloud compute disks create --size=10GB 'redis-7'
```

```
kubectl create -f replicaset/redis-7.yaml
```

```
kubectl create -f services/redis-7.yaml
```

```
CLUSTER MEET 10.131.242.7 6379
```
