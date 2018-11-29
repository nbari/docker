To do a clean setup:

    make clean

Then

    ./start.sh

If want to doit by steps, first start the cluster `wsrep-new-cluster` in node1:

    docker-compose up node0

Then while running start the other nodes:

    docker-compose up node1 node2 node3 haproxy

Check the cluster status:

    mysql -h 127.0.0.1 --port 3123 -u root -p

Then:

    mysql> SHOW GLOBAL STATUS LIKE 'wsrep_ready';
    +---------------+-------+
    | Variable_name | Value |
    +---------------+-------+
    | wsrep_ready   | ON    |
    +---------------+-------+

And

    mysql> SHOW GLOBAL STATUS LIKE 'wsrep_cluster_size';
    +--------------------+-------+
    | Variable_name      | Value |
    +--------------------+-------+
    | wsrep_cluster_size | 4     |
    +--------------------+-------+
