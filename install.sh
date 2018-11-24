#!/bin/bash

# install.sh -- 2018-11-24 -- Roland Hostettler

# Installs class and style files
function install_latex() {
    CURDIR=`pwd`
    DESTDIR="${TEXMFHOME}/tex/latex/"
    echo "Installing ${1} to ${DESTDIR}..."
    for FILE in "${1}"/*.{sty,cls}; do
        if [ -f "${FILE}" ]; then
            ln -s "${CURDIR}/${FILE}" "${DESTDIR}"
        fi
    done
}

# Installs template files
function install_templates(){
    if [ -d "templates" ]; then
        CURDIR=`pwd`
        DESTDIR="${HOME}/Templates/LaTeX/"
        echo "Installing templates to ${DESTDIR}..."
        if [ ! -d "${DESTDIR}" ]; then
            mkdir -p "${DESTDIR}"
        fi
        for FILE in "templates/"*.tex; do
            if [ -f "${FILE}" ]; then
                ln -s "${CURDIR}/${FILE}" "${DESTDIR}"
            fi
        done
    fi
}

# Determine install path and check if we can write to it
if [ `uname -s` == "Darwin" ]; then
    TEXMFHOME=~/"Library/texmf/"
else
    : "${TEXMFHOME:?TEXMFHOME not set. Please see README.md for instructions.}"
fi
if [ ! -w "${TEXMFHOME}" ]; then
    >&2 echo "ERROR: Cannot write to ${TEXMFHOME}."
fi

# Install everything
install_latex classes
install_latex packages
install_templates

