# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
inherit distutils-r1 pypi

DESCRIPTION="Analyzes C/C++ binaries for code size, static variables and stack usage"
HOMEPAGE="https://github.com/HBehrens/puncover/ https://pypi.org/project/puncover/"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

# Github release tarball
#"https://github.com/HBehrens/puncover/releases/download/${PV}/${P}.tar.gz"
# Github SCM snapshot
#"https://github.com/HBehrens/puncover/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
# PyPI posted source tarball
#"$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]"

#S=${WORKDIR}/${P^}
