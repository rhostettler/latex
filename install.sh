#!/bin/bash
#
# install.sh -- 2017-09-30 -- Roland Hostettler

# Installs class and style files
function install_latex() {
    echo -n "Installing ${1} class and style files to ${DESTDIR}..."
    DESTDIR="${TEXMFHOME}/tex/latex/"
    for FILE in "${1}"/*.{sty,cls}; do
        if [ -f "${FILE}" ]; then
            cp "${FILE}" "${DESTDIR}"
        fi
    done
    echo "done."
}

# Installs template files
function install_templates(){
    if [ -d "${1}/Template" ]; then
        DESTDIR=~/"Templates/LaTeX"
        echo -n "Installing ${1} templates to ${DESTDIR}..."
        if [ ! -d "${DESTDIR}" ]; then
            mkdir -p "${DESTDIR}"
        fi
        for FILE in "${1}/Template/"*.tex; do
            if [ -f "${FILE}" ]; then
                cp "${FILE}" "${DESTDIR}"
            fi
        done
        echo "done."
    fi
}

# Packages to install
PACKAGES=(
    "parapub"
    "mathsym"
)

# Determine install path and check if we can write to it
if [ `uname -s` == "Darwin" ]; then
    TEXMFHOME=~/"Library/texmf/"
else
    : "${TEXMFHOME:?TEXMFHOME not set. Please see README for instructions.}"
fi
if [ ! -w "${TEXMFHOME}" ]; then
    >&2 echo "ERROR: Cannot write to ${TEXMFHOME}."
fi

# Install packages & templates (if they exist)
for PKG in ${PACKAGES[@]}; do
    install_latex ${PKG}
    install_templates ${PKG}
done

