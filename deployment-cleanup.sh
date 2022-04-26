kubectl delete deployments \
  "redis-1" "redis-2" "redis-3" \
  "redis-4" "redis-5" "redis-6"

kubectl delete deployment-services \
  "redis-1" "redis-2" "redis-3" \
  "redis-4" "redis-5" "redis-6" \
  "redis"

kubectl delete configmaps "redis-conf"

kubectl delete -f persistentvolumeclaims

kubectl delete -f persistentvolume
