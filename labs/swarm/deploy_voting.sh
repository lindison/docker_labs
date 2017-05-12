docker network create -d overlay frontend
docker network create -d overlay backend

docker service create --name redis --network frontend --replicas 2 redis:3.2
docker service create --name vote -p 80:80 --network frontend --replicas 2 dockersamples/examplevotingapp_vote:before
docker service create --name worker --network frontend --network backend dockersamples/examplevotingapp_worker
docker service create --name db --network backend --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4
docker service create --name result -p 5001:80 --network backend dockersamples/examplevotingapp_result:before


