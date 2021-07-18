#!/bin/sh

# setup
mkdir -p resources modules

# Prereqs
sudo yum update -y

sudo yum groupinstall -y "Development Tools"

sudo yum install -y \
	asciidoctor \
	cmake3 \
	collectd \
	cyrus-sasl cyrus-sasl-devel \
	firebird firebird-devel \
	freeradius freeradius-devel freeradius-doc freeradius-krb5 freeradius-ldap freeradius-mysql freeradius-perl freeradius-postgresql freeradius-python freeradius-sqlite freeradius-unixODBC freeradius-utils \
	freetds freetds-devel \
	gcc \
	gcc-c++ \
	gdbm gdbm-devel \
	graphviz graphviz-devel \
	hiredis hiredis-devel \
	json-c json-c-devel \
	libbson libbson-devel \
	libcap libcap-devel \
	libcurl libcurl-devel \
	libidn libidn-devel \
	libiodbc libiodbc-devel \
	libmemcached libmemcached-devel \
	libpcap libpcap-devel \
	libtalloc libtalloc-devel \
	libwbclient libwbclient-devel \
	libyubikey libyubikey-devel \
	make \
	mongo-c-driver mongo-c-driver-devel \
	net-snmp-utils \
	openssl openssl-devel \
	pam pam-devel \
	pandoc \
	perl perl-devel perl-JSON perl-libs \
	postgresql postgresql-devel \
	ruby  ruby-devel \
	samba  samba-devel \
	sqlite  sqlite-devel \
	tncfhh tncfhh-devel \
	unbound unbound-devel \
	unixODBC unixODBC-devel \
	ykclient ykclient-devel

# Prereqs: Node.js
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum -y install nodejs

# Prereqs: Antora
sudo npm i -g @antora/cli@2.3 @antora/site-generator-default@2.3

# freeradius
git clone https://github.com/Neuroboy23/freeradius-server modules/freeradius-server
pushd modules/freeradius-server
git checkout origin/eagent-v3.0.x
./configure
make
sudo make install