docker stack deploy -c example-counter-app-stack.yml counter
docker stack deploy -c example-django-app-stack.yml django
docker stack deploy -c example-voting-app-stack.yml voteapp
docker stack deploy -c example-wordpress-app-stack.yml wordpress
docker service create --name hello-world --publish 81:80 --replicas 2 lindison/hello-world:k8s

docker network create -d overlay frontend
docker network create -d overlay backend

docker service create --name redis --network frontend --replicas 2 redis:3.2
docker service create --name vote -p 80:80 --network frontend --replicas 2 dockersamples/examplevotingapp_vote:before
docker service create --name worker --network frontend --network backend dockersamples/examplevotingapp_worker
docker service create --name db --network backend --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4
docker service create --name result -p 5001:80 --network backend dockersamples/examplevotingapp_result:before
