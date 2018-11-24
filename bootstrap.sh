#!/bin/bash
# 
# bootstrap.sh -- 2018-11-24 -- Roland Hostettler

# Set up paths
echo "Setting up local texmf directories..."
TEXMFHOME="${HOME}/.local/share/texmf"
mkdir -p "${TEXMFHOME}/tex/latex"
mkdir -p "${TEXMFHOME}/bibtex/bib"

# Set the ${TEXMFHOME} variable
echo "Setting up \$TEXMFHOME environment variable..."
PROFILE="${HOME}/.profile"
echo "TEXMFHOME=${TEXMFHOME}" >> "${PROFILE}"
echo "if [ -d \${TEXMFHOME} ] ; then" >> "${PROFILE}"
echo "    export TEXMFHOME" >> "${PROFILE}"
echo "fi" >> "${PROFILE}"

# Install the classes and templates
echo "Installing classes and templates..."
./install.sh

