Build the image:

    docker build -t centos .

Use the image to fetch latest packages, for example:

    $ make (to enter the container)

add mariadb repo

    # curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    # sh mariadb_repo_setup --mariadb-server-version=10.11

Then use:

    yumdownloader --destdir=/data --resolve MariaDB-server galera-4 MariaDB-client MariaDB-shared MariaDB-backup MariaDB-common

Example for postgres:

    dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
    dnf -qy module disable postgresql
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

    yumdownloader --destdir=/data --resolve postgresql15-server postgresql15-contrib postgresql15-devel pgbackrest python3-psycopg2 patroni patroni-consul consul

Maybe need to run:

    dnf install epel-release -y
    dnf --enablerepo=powertools install perl-IPC-Run -y

rpms will be in the local /data dir


Repos to add:

    sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
