#!/bin/sh

docker-compose down
find . -type d -name "db" -execdir sh -c 'rm -rf {}/*' \;
docker-compose up node0 &

while ! test "$(mysql -h 127.0.0.1 --port 43306 -u root --password=test -ANe"show global status like 'wsrep_cluster_size'" 2>/dev/null| awk '{print $2}')" == 1; do sleep 3; done

docker-compose up haproxy node1 node2 node3
