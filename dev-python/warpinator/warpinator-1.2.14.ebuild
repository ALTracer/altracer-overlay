# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit meson python-r1

DESCRIPTION="Send and receive files across the LAN"
HOMEPAGE="https://github.com/linuxmint/warpinator"
SRC_URI="https://github.com/linuxmint/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND=">=dev-util/meson-0.45.0
	dev-libs/gobject-introspection"
RDEPEND="${PYTHON_DEPS}
	>=dev-python/python3-xapp-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.16.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/pynacl[${PYTHON_USEDEP}]
	dev-python/setproctitle[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]"

src_configure() {
	local emesonargs=(
		-Dbundle-zeroconf=false
	)
	meson_src_configure
}
