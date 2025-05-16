#!/bin/sh
set -e

echo "Redis Start..."

for port in 6379 7002 7003 7004 7005 7006; do
  redis-server /usr/local/etc/redis/redis${port}.conf \
    > /var/log/redis${port}.log 2>&1 &
done

echo "Redis wait start..."
sleep 10

CLUSTER_INFO=$(redis-cli -p 6379 cluster info 2>/dev/null || true)
if echo "$CLUSTER_INFO" | grep -q '^cluster_state:ok'; then
  echo "Cluster already initialized, skipping creation."
else
  echo "Creating Redis cluster..."
  yes yes | redis-cli --cluster create \
    127.0.0.1:6379 127.0.0.1:7002 127.0.0.1:7003 \
    127.0.0.1:7004 127.0.0.1:7005 127.0.0.1:7006 \
    --cluster-replicas 1
  echo "Cluster created."
fi

echo "Redis cluster end"

# 防止容器退出
tail -f /dev/null
