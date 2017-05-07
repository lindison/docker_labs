docker container run -d \
    --name mysql \
    -e MYSQL_ROOT_PASSWORD=wordpress \
    -e MYSQL_DATABASE=wordpress \
    mysql
