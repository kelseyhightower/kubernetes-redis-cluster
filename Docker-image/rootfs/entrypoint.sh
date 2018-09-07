#!/bin/ash
if [[ "$1" == "redis-server" ]]; then
  chown -R redis:redis /data
  exec gosu redis "$@"
fi
exec "$@"
