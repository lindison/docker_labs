# https://github.com/google/cadvisor
# https://prometheus.io/docs/introduction/install/

docker container run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest

docker container run \
  -d -p 9100:9100 \
  --net="host" \
  prom/node-exporter

docker container run \
  -d \
  -p 9090:9090 \
  -v /root/docker_labs/labs/prom_demo/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus

docker container run \
  -d -p 3000:3000 \
  grafana/grafana
