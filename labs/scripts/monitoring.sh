

echo cAdvisor
docker run --detach=true --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 --privileged=true --name=cadvisor google/cadvisor:latest
docker port $(docker ps -lq)

echo Docker-UI
docker run -d -p 9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock uifd/ui-for-docker
docker port $(docker ps -lq)
