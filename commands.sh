gcloud compute disks create --size=10GB 'redis-1'
gcloud compute disks create --size=10GB 'redis-2'
gcloud compute disks create --size=10GB 'redis-3'
gcloud compute disks create --size=10GB 'redis-4'
gcloud compute disks create --size=10GB 'redis-5'
gcloud compute disks create --size=10GB 'redis-6'

kubectl create configmap redis-conf --from-file=redis.conf

kubectl create -f replicasets
kubectl create -f services
