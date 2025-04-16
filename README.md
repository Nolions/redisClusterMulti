# redis-cluster-multi

在一個dokcer container中啟動redis cluster

## 執行

```bash
docker run -d -p 6379:6379 -p 7002:7002 -p 7003:7003 -p 7004:7004 -p 7005:7005 -p 7006:7006 --name redis-cluster-sim nolions/redis-cluster-muilt
```

## 檢查 redis叢集狀態

```
redis-cli -p 6379 cluster info  
```

```bash
redis-cli -p 6379 cluster nodes 
```