DISTNAME=scientific
RELVER=7.0
RELEASE=http://repo.bts.relbit.com/sl7/7.0/x86_64/os/Packages/sl-release-7.0-1.2.sl7.x86_64.rpm
BASEURL=http://repo.bts.relbit.com/sl7/7.0/x86_64/os
UPDATES=http://repo.bts.relbit.com/sl7/7.0/x86_64/updates/security
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
