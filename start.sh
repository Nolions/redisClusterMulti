#!/bin/sh

echo "Redis Start..."

redis-server /usr/local/etc/redis/redis6379.conf > /var/log/redis6379.log 2>&1 &
redis-server /usr/local/etc/redis/redis7002.conf > /var/log/redis7002.log 2>&1 &
redis-server /usr/local/etc/redis/redis7003.conf > /var/log/redis7003.log 2>&1 &
redis-server /usr/local/etc/redis/redis7004.conf > /var/log/redis7004.log 2>&1 &
redis-server /usr/local/etc/redis/redis7005.conf > /var/log/redis7005.log 2>&1 &
redis-server /usr/local/etc/redis/redis7006.conf > /var/log/redis7006.log 2>&1 &

echo "Redis wait start..."
sleep 10

echo "create Redis cluster..."
yes yes | redis-cli --cluster create \
  127.0.0.1:6379 127.0.0.1:7002 127.0.0.1:7003 \
  127.0.0.1:7004 127.0.0.1:7005 127.0.0.1:7006 \
  --cluster-replicas 1

echo "Redis cluster end"

# 防止容器退出
tail -f /dev/null
