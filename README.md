# Kubernetes Redis Cluster


### Create Disks

```
gcloud compute disks create --size=10GB 'redis-1'
gcloud compute disks create --size=10GB 'redis-2'
gcloud compute disks create --size=10GB 'redis-3'
gcloud compute disks create --size=10GB 'redis-4'
gcloud compute disks create --size=10GB 'redis-5'
gcloud compute disks create --size=10GB 'redis-6'
```

### Create Redis Cluster Configuration

```
kubectl create configmap redis-conf --from-file=redis.conf
```

### Create Redis Nodes

```
kubectl create -f deployments
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
./redis-trib.rb create --replicas 1 \
  10.131.242.1:6379 \
  10.131.242.2:6379 \
  10.131.242.3:6379 \
  10.131.242.4:6379 \
  10.131.242.5:6379 \
  10.131.242.6:6379
```
