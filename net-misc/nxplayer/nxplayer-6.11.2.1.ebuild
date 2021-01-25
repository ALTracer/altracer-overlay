# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils

MY_P="nomachine-enterprise-desktop_$(ver_cut 1-3)_$(ver_cut 4)"

DESCRIPTION="Client for NoMachine remote servers"
HOMEPAGE="https://www.nomachine.com"
SRC_URI="amd64? ( https://download.nomachine.com/packages/$(ver_cut 1-2)-PRODUCTION/Linux/${MY_P}_x86_64.tar.gz )
	x86? ( https://download.nomachine.com/packages/$(ver_cut 1-2)-PRODUCTION/Linux/${MY_P}_i686.tar.gz )"
LICENSE="nomachine"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""
RESTRICT="strip"

DEPEND=""
RDEPEND="dev-libs/glib:2
	dev-libs/openssl:0
	dev-libs/jsoncpp:0"

S=${WORKDIR}/NX/etc/NX/server/packages

QA_PREBUILT="*"

src_install()
{
	local NXROOT=/opt/NX

#	dodir /etc/NX/localhost
#	echo 'PlayerRoot = "'"${NXROOT}"'"' > ${D}/etc/NX/localhost/player.cfg

	dodir /opt
	tar xozf nxclient.tar.gz -C "${D}"/opt
	tar xozf nxplayer.tar.gz -C "${D}"/opt

	make_wrapper nxplayer ${NXROOT}/bin/nxplayer ${NXROOT} ${NXROOT}/lib /opt/bin
}
