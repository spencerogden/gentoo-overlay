# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Virtual for the Humble Indie Bundle"
HOMEPAGE="http://humblebundle.com"
SRC_URI=""

LICENSE=""
SLOT="3"
KEYWORDS="amd64 x86"
IUSE="+vvvvvv"

RDEPEND="
	vvvvvv? ( =games-arcade/vvvvvv-2.01* )"
DEPEND=""