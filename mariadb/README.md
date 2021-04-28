Load database:

    gunzip < world.sql.gz | mysql -h 127.0.0.1 -uroot world -p


Find the IP address that has been assigned to the container:

    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'

connect using:

    mysql -h 127.0.0.1 -P 3306 --protocol=TCP -u root -p
