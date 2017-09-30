#!/bin/bash
#
# install.sh -- 2017-09-30 -- Roland Hostettler

# Installs class and style files
function install_latex() {
    DESTDIR="${TEXMFHOME}/tex/latex/"
    echo -n "Installing ${1} to ${DESTDIR}..."
    for FILE in "${1}"/*.{sty,cls}; do
        if [ -f "${FILE}" ]; then
            cp "${FILE}" "${DESTDIR}"
        fi
    done
    echo "done."
}

# Installs template files
function install_template(){
    echo "INSTALL TEMPLATE: " ${1}
}

# Packages to install
PACKAGES=(
    "parapub"
    "test"
#    "rhsleek"
#    "ltusimple"
)

# Directory to install templates to
TEMPLATEDIR="~/Templates/LaTeX"

# Determine install path and check if we can write to it
if [ `uname -s` == "Darwin" ]; then
    TEXMFHOME="~/Library/texmf/"
else
    : "${TEXMFHOME:?TEXMFHOME not set. Please see README for instructions.}"
fi
if [ ! -w "${TEXMFHOME}" ]; then
    >&2 echo "ERROR: Cannot write to ${TEXMFHOME}."
fi

# Install packages & templates (if they exist)
for PKG in ${PACKAGES[@]}; do
#    install_latex ${PKG}
    install_template ${PKG}
done

