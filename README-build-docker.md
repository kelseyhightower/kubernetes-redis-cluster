# Kubernetes Redis Cluster

### Build docker image

```
cd Docker-image
docker build -t redis-4.0.0 .
```

### Push docker image to your repo

```
docker tag redis-4.0.0 localrepo:5000/redis/redis-4.0.0:v1
docker push localrepo:5000/redis/redis-4.0.0:v1
```
