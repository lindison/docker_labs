docker service create --publish 90:8080 --name uber lindison/swagger-ui:uber
docker service create --publish 91:8080 --name twitter lindison/swagger-ui:twitter
docker service create --publish 92:8080 --name weather lindison/swagger-ui:weather
docker service create --publish 93:8080 --name instagram lindison/swagger-ui:instagram
