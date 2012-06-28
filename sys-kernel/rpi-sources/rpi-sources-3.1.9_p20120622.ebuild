# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/gentoo-sources/gentoo-sources-3.1.10-r1.ebuild,v 1.2 2012/01/25 01:19:08 mpagano Exp $

EAPI="2"
ETYPE="sources"
inherit git-2 kernel-2
detect_version
detect_arch

KEYWORDS="arm"
HOMEPAGE="https://github.com/raspberrypi/linux"
IUSE="fbcondecor"

DESCRIPTION="Raspberry Pi ${KV_MAJOR}.${KV_MINOR} kernel tree"
EGIT_REPO_URI="http://github.com/raspberrypi/linux.git"
EGIT_COMMIT="e3a21fc997669aae744537bf69e123f88a5e69e2"
EGIT_PROJECT="${PN}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	# remove git libraries
	rm -r .git
	rm $(find . -name .gitignore)

	if use fbcondecor ; then
		epatch "${FILESDIR}"/${P}-fbcondecor.patch
	fi
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
