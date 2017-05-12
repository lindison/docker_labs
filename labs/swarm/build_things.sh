docker stack deploy -c example-counter-app-stack.yml counter
docker stack deploy -c example-django-app-stack.yml django
docker stack deploy -c example-voting-app-stack.yml voteapp
docker stack deploy -c example-wordpress-app-stack.yml wordpress
docker service create --name hello-world --publish 81:80 lindison/hello-world:k8s --replicas 10
