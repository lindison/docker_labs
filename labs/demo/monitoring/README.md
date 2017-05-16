# Local Prometheus / Grafana demo

Requires: docker-compose be installed.  


## Step 1
Update the ./prom/prometheus.yml file with the target IP address in both fields.   

```bash
# my global config
global:
  scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).

  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  external_labels:
      monitor: 'codelab-monitor'

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first.rules"
  # - "second.rules"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.

scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: 'prometheus'
    static_configs:
      - targets:
           ['add_ipaddress_here:4914','add_ipaddress_here:9100']
```

## Step 2
first build the docker images in ,/prom and ./grafana  

`docker build -t prom:demo .`  

`docker build -t grafana:demo .`  

***These are intended to show the value of using Grafana and Prometheus and are in no way to be used a means to monitor production.***

## Step 3

With docker-compose, run the demo:  
`docker-compose up`  

If unable to use docker-compose, run them manually.  

`docker run -d -p 3000:3000 grafana:demo`  
`docker run -d -p 9090:9090 prom:demo`  

## Step 4

Once up, log into grafana (http://0.0.0.0:3000) using `admin` and `admin`, Configure the data source to using the following:  
`Prometheus`   
`http://localhost:9090`  
`direct link`  

Once completed, click `save and test`.  

Open Dashboards and select the dashboard called `Node exporter stats`.

This concludes this quick demo; further learning objectives can be use this demo enviroment to learn how to create dashboards.  



