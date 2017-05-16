 echo "somewordpress" | docker secret create mysql_root_password -
 echo "wordpress" | docker secret create mysql_user -
 echo "wordpress" | docker secret create wordpress_db_wordpress -
 echo "wordpress" | docker secret create wordpress_user -
