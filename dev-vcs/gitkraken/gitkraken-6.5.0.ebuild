# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

BIN=${PN}

inherit desktop unpacker xdg-utils

DESCRIPTION="cross-platform Git client"
HOMEPAGE="https://www.gitkraken.com"
SRC_URI="https://release.axocdn.com/linux/GitKraken-v${PV}.deb"

LICENSE="gitkraken-eula"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="strip mirror bindist"
IUSE="gnome-keyring udisks"

RDEPEND="
	gnome-base/gconf:2
	x11-libs/gtk+:2
	virtual/libudev
	dev-libs/libgcrypt:0/20
	x11-libs/libnotify
	x11-libs/libXtst
	dev-libs/nss
	x11-libs/libxkbfile
	dev-lang/python
	udisks? ( gnome-base/gvfs )
	x11-misc/xdg-utils
	gnome-keyring? ( gnome-base/libgnome-keyring )
"

QA_PREBUILT="
	opt/gitkraken/${BIN}
	opt/gitkraken/libEGL.so
	opt/gitkraken/libGLESv2.so
	opt/gitkraken/swiftshader/libEGL.so
	opt/gitkraken/swiftshader/libGLESv2.so
	opt/gitkraken/libffmpeg.so
"

S=${WORKDIR}

src_prepare() {
	default

	rm usr/share/${PN}/resources/app.asar.unpacked/node_modules/@axosoft/nodegit/build/Release/nodegit-centos-7.node #QA CentOS missing openssl-1.0
	rm usr/share/${PN}/resources/app.asar.unpacked/node_modules/@axosoft/nodegit/build/Release/nodegit-debian-8.node #QA Debian 8 using openssl-1.0
	sed -i \
	-e "s:/usr/share/gitkraken/gitkraken:/opt/${PN}/${BIN}:g" \
	usr/share/applications/${PN}.desktop || die
}

src_install() {
	doicon usr/share/pixmaps/${PN}.png
	domenu usr/share/applications/${PN}.desktop
	dodoc usr/share/doc/${PN}/copyright
	dodoc usr/share/${PN}/LICENSE*

	insinto /opt/${PN}
	doins -r usr/share/${PN}/.
	rm "${D}"/opt/${PN}/LICENSE*
	fperms +x /opt/${PN}/${BIN}
	fperms +sx /opt/${PN}/chrome-sandbox
	dosym ../../opt/${PN}/${BIN} usr/bin/${BIN}
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
