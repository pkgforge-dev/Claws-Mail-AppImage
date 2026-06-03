#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q claws-mail | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/128x128/apps/claws-mail.png
export DESKTOP=/usr/share/applications/claws-mail.desktop

# Deploy the application, its plugins, web extensions and all their dependencies
quick-sharun \
	/usr/bin/claws-mail \
	/usr/lib/claws-mail \
	/usr/bin/perl       \
	/usr/lib/perl5      \
	/usr/lib/libwebkit2gtk-*.so*

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the AppImage (GUI apps may need --simple-test to avoid xvfb timeout)
quick-sharun --simple-test ./dist/*.AppImage
