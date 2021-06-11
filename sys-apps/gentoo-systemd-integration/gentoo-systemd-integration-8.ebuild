# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

SRC_URI="https://dev.gentoo.org/~mgorny/dist/${P}.tar.bz2"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ia64 ~mips ppc ppc64 sparc x86"

DESCRIPTION="systemd integration files for Gentoo"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Systemd"

LICENSE="BSD"

RDEPEND=">=sys-apps/systemd-207
	!sys-fs/eudev
	!sys-fs/udev"
DEPEND=">=sys-apps/systemd-207"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local myconf=(
		--with-systemdsystempresetdir='${libdir}/systemd/preset'
		--with-systemdsystemgeneratordir='${libdir}/systemd/system-generators'
	)

	udevdir='${libdir}/udev' econf ${myconf[@]}
}
