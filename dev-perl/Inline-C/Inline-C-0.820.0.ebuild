# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=ETJ
DIST_VERSION=0.82
DIST_EXAMPLES=("example/modules/*")
DIST_TEST="do" # parallelism thwarted by race conditions
inherit perl-module

DESCRIPTION="C Language Support for Inline"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~ppc ~ppc64 ~riscv ~sparc ~x86"

RDEPEND="
	>=virtual/perl-ExtUtils-MakeMaker-7
	>=virtual/perl-File-Spec-0.800.0
	>=dev-perl/Inline-0.860.0
	>=dev-perl/Parse-RecDescent-1.967.9
	>=dev-perl/Pegex-0.660.0
	!<dev-perl/Inline-0.510.0
"
BDEPEND="
	${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	>=dev-perl/File-ShareDir-Install-0.60.0
	test? (
		dev-perl/File-Copy-Recursive
		virtual/perl-File-Path
		>=virtual/perl-Test-Simple-0.880.0
		>=dev-perl/Test-Warn-0.230.0
		dev-perl/YAML-LibYAML
		virtual/perl-autodie
		>=virtual/perl-version-0.770.0
	)
"

src_test() {
	perl_rm_files t/author-*.t
	perl-module_src_test
}
