1. run `docker-infra/build.sh` file to create docker images for sentinel, master and slave

2. run `source-code/go-client/build.sh` file to create docker image for sample go client

3. run `docker-compose up -d` to run all containers

4. run `docker-compose scale sentinel=3` to increase sentinel containers count to 3

5. run `docker-compose scale slave=4` to increase slave containers count to 3

6. run `docker exec  -it sentinel_sentinel_1 bash` to connect one of sentinel containers

7. run `redis-cli -p 26379` to connect redis sentinel

8. run `SENTINEL get-master-addr-by-name mymaster` to get master ip address

9. run `docker exec -it sentinel_master_1 redis-cli set xx yy` to add sample data to redis and run `docker exec -it sentinel_master_1 redis-cli get xx` to read value from redis

10. run `docker exec -it sentinel_slave_1 redis-cli get xx` to read data from slave container(slave containers are read only. slave replicates itself from master)

11. run `docker exec -it sentinel_slave_1 redis-cli role` to view role of slave container

12. run `docker exec -it sentinel_master_1 redis-cli role` to view role of master container

13. run `docker rm -f sentinel_master_1` and check all slave container role(in step 11). sentinel assings new master from amongs the slaves. run `SENTINEL get-master-addr-by-name mymaster` to get new master ip address.