Create first node1:

    docker-compose up node1

Then node2 and node3

    docker-compose node2 node3

It could fail (need to find a way to improve create full db from 0), check cluster status from node1:

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
    | wsrep_cluster_size | 3     |
    +--------------------+-------+
