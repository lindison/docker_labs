
docker run -d -p 9100:9100 --net="host" prom/node-exporter
docker run -p 9090:9090 -v ./prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
