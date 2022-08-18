Build the image:

    docker build -t centos .

Use the image to fetch latest packages, for example:

    $ make (to enter the container)

add mariadb repo

    # curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    # sh mariadb_repo_setup --mariadb-server-version=10.6

Then use:

    yumdownloader --destdir=/data --resolve MariaDB-server galera-4 MariaDB-client MariaDB-shared MariaDB-backup MariaDB-common

rpms will be in the local /data dir
