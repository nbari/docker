# Use a specific version of the base image
FROM rockylinux:8

# Install necessary packages in a single layer
RUN yum install -y \
    yum-utils \
    https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
    epel-release \
    && yum -y groupinstall "Development Tools" \
    && yum -y module disable postgresql \
    && yum clean all

RUN dnf install epel-release -y
RUN dnf --enablerepo=powertools install perl-IPC-Run -y

# Set yumdownloader as the entrypoint
ENTRYPOINT yumdownloader --destdir=/data --resolve postgresql16-server postgresql16-contrib postgresql16-devel pgbackrest pgbackrest-debuginfo python3-psycopg2 patroni patroni-etcd pg_activity pg_top pg_squeeze_16 pg_partman_16 pg_stat_monitor_16 pgaudit_16 pgcopydb && /bin/bash
