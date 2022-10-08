# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils
DESCRIPTION="A console module player"
HOMEPAGE="http://stian.cubic.org/"
SRC_URI="http://stian.cubic.org/ocp/${P}.tar.bz2 \
	ftp://ftp.cubic.org/pub/player/gfx/opencp25image1.zip \
	ftp://ftp.cubic.org/pub/player/gfx/opencp25ani1.zip"
LICENSE="GPL-2"
SLOT="0/0.2"
KEYWORDS="~amd64 ~x86"

IUSE="debug X alsa flac mad sdl sdl2 system-libsidplayfp"
REQUIRED_USE="?? ( sdl sdl2 )"
RDEPEND="
	dev-libs/cJSON
	media-libs/libogg
	media-libs/libvorbis
	X? (
		x11-libs/libXext
		x11-libs/libXxf86vm
		x11-libs/libX11
		x11-libs/libXpm
		media-fonts/unifont
	)
	alsa? ( media-libs/alsa-lib )
	flac? ( media-libs/flac:= )
	system-libsidplayfp? ( media-libs/libsidplayfp )
	mad? ( media-libs/libmad )
	sdl? (
		media-libs/libsdl
		media-fonts/unifont
	)
	sdl2? (
		media-libs/libsdl2
		media-fonts/unifont
	)
	media-sound/timidity-eawpatches
	"
DEPEND="$RDEPEND
	sdl? ( dev-util/desktop-file-utils )
	sdl2? ( dev-util/desktop-file-utils )
	X? ( dev-util/desktop-file-utils )
	sys-apps/texinfo
	app-arch/unzip
"
BDEPEND="
	!system-libsidplayfp? ( dev-embedded/xa )
"
src_configure() {
	econf --exec-prefix=/usr --with-unifontdir=/usr/share/fonts/unifont \
	$(use_with debug) $(use_with X x11) $(use_with alsa) $(use_with flac) $(use_with mad) $(use_with sdl) $(use_with sdl2) || die
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
	cp ../CP* /"${D}"/usr/share/"${P}"/data
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
