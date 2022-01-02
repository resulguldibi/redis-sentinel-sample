

1. docker-compose up -d
2. docker-compose scale sentinel=3
3. docker-compose scale slave=4

4. connect one of sentinel containers:
docker exec  -it sentinel_sentinel_1 bash

5. connect redis using redis-cli
redis-cli -p 26379

6. check master ip 
SENTINEL get-master-addr-by-name mymaster

7. connect master container and add sample data to redis
docker exec -it sentinel_master_1 bash
redis-cli
set xx yy
get xx


8. connect slave container to read data that is added to master
docker exec -it sentinel_slave_1 bash
redis-cli
get xx
