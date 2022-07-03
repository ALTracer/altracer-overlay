# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="BYOND server (DreamDaemon) and compiler (DreamMaker)"
HOMEPAGE="http://www.byond.com/download"
SRC_URI="http://www.byond.com/download/build/514/${PV}_${PN}_linux.zip"

S="${WORKDIR}/${PN}"
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~x86"
