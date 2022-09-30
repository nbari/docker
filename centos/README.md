Build the image:

    docker build -t centos .

Use the image to fetch latest packages, for example:

    $ make (to enter the container)

add mariadb repo

    # curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    # sh mariadb_repo_setup --mariadb-server-version=10.8

Then use:

    yumdownloader --destdir=/data --resolve MariaDB-server galera-4 MariaDB-client MariaDB-shared MariaDB-backup MariaDB-common

Example for postgres:

    dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
    dnf -qy module disable postgresql
    yumdownloader --destdir=/data --resolve postgresql14-server postgresql14-contrib postgresql14-devel pgbackrest  python3-psycopg2

rpms will be in the local /data dir
