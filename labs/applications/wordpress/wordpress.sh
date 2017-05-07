docker container run -d \
    --name wordpress \
--link mysql:mysql\
    -p 8080:80 \
    -e WORDPRESS_DB_PASSWORD=wordpress \
    wordpress
