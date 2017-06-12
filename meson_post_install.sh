#!/bin/sh
if [ -z $MESON_INSTALL_PREFIX ]; then
    echo 'This is meant to be ran from Meson only!'
    exit 1
fi

if [ -z $DESTDIR ]; then
    echo 'Compiling GSchema'
    glib-compile-schemas "/usr/share/glib-2.0/schemas"
fi
