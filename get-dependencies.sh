#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	bogofilter      \
	claws-mail      \
	ghostscript     \
	gumbo-parser    \
	hunspell-de     \
	hunspell-en_us  \
	hunspell-es_any \
	hunspell-fr     \
	hunspell-ru     \
	libarchive      \
	libcanberra     \
	libical         \
	libnotify       \
	libytnef        \
	perl            \
	poppler-glib    \
	spamassassin    \
	webkit2gtk-4.1

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano webkit2gtk-4.1-mini

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
