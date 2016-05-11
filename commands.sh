gcloud compute disks create --size=10GB \
  'redis-1' 'redis-2' 'redis-3' \
  'redis-4' 'redis-5' 'redis-6'

kubectl create configmap redis-conf --from-file=redis.conf

kubectl create -f replicasets
kubectl create -f services
