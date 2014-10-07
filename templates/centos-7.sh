DISTNAME=centos
RELVER=7
RELEASE=http://ftp.fi.muni.cz/pub/linux/centos/7/os/x86_64/Packages/centos-release-7-0.1406.el7.centos.2.3.x86_64.rpm
BASEURL=http://ftp.fi.muni.cz/pub/linux/centos/7/os/x86_64/
UPDATES=http://ftp.fi.muni.cz/pub/linux/centos/7/updates/x86_64/
GROUPNAME='Core'
EXTRAPKGS='vim'
. $INCLUDE/fedora.sh

bootstrap
configure-common

configure-fedora

configure-append <<EOF
systemctl disable NetworkManager.service
systemctl disable NetworkManager-wait-online.service
systemctl disable NetworkManager-dispatcher.service
systemctl enable  network.service
systemctl disable firewalld.service
EOF

run-configure
