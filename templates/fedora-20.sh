DISTNAME=fedora
RELVER=20
RELEASE=http://ftp.fi.muni.cz/pub/linux/fedora/linux/releases/20/Fedora/x86_64/os/Packages/f/fedora-release-20-3.noarch.rpm
BASEURL=http://ftp.fi.muni.cz/pub/linux/fedora/linux/releases/20/Fedora/x86_64/os
UPDATES=http://ftp.fi.muni.cz/pub/linux/fedora/linux/updates/20/x86_64
GROUPNAME='minimal install'
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
