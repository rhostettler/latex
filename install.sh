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


# Install bibliographies
function install_bibtex(){
    if [ -d "bibtex" ]; then
        CURDIR=`pwd`
        DESTDIR="${TEXMFHOME}/bibtex/bib/"
        echo "Installing bibliographies to ${DESTDIR}..."
        for FILE in "bibtex"/*.bib; do
            if [ -f "${FILE}" ]; then
                ln -s "${CURDIR}/${FILE}" "${DESTDIR}"
            fi
        done
    fi
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



# TEXMFHOME checks:
# * Define it if on MacOS
# * Check if it is set if on Linux; if not, assume that this is a new install 
#   and create the necessary directories.
if [ `uname -s` == "Darwin" ]; then
    TEXMFHOME=~/"Library/texmf/"
else
    if [ -z "${TEXMFHOME+x}" ]; then
        echo "TEXMFHOME not set, assuming a fresh install..."
        TEXMFHOME="${HOME}/.local/share/texmf"
        export TEXMFHOME
    fi
    if [ ! -d "${TEXMFHOME}/tex/latex" ]; then
        mkdir -p "${TEXMFHOME}/tex/latex"
    fi
    if [ ! -d "${TEXMFHOME}/bibtex/bib" ]; then
        mkdir -p "${TEXMFHOME}/bibtex/bib"
    fi
fi
if [ ! -w "${TEXMFHOME}" ]; then
    >&2 echo "ERROR: Cannot write to ${TEXMFHOME}."
fi

# Install everything
install_latex classes
install_latex packages
install_bibtex
install_templates

