docker run -d -P --net-alias hello --network rr_net lindison/hello-world:k8s
docker run -it --network rr_net -P alpine nslookup hello
