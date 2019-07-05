# LaTeX Bits'n'Pieces
This is a collection of LaTeX classes, packages, and templates for all kinds of purposes. Brief descriptions of the different packages and classes are given below; for a detailed description, have a look at the documentation, source, or template files.

**mathsym:** Commonly used mathematical symbols, operators, etc. that are not defined in any of the major mathematics package (e.g., amssym).

**parapub:** A class for creating front pages for parallel publishing of scientific articles (e.g., authors' copies on personal homepages, on [arXiv.org](https://arxiv.org/), etc.) that includes the necessary copyright information. Check the [SHERPA/RoMEO catalog](http://www.sherpa.ac.uk/romeo/index.php) for information on copyright policies of different publishers.

**pgfdefaults:** Deprecated defaults for PGF. *Will be updated/replaced at some point*.


## Installation
Install using the `install.sh` script (requires `$TEXMFHOME` to be set). This will:

1. Create symlinks to the templates in the `template` directory in `$HOME/Templates/LaTeX`,
2. Create symlinks to the classes in the `classes` directory in `$TEXMFHOME/tex/latex`,
3. Create symlinks to the packages in the `packages` directory in `$TEXMFHOME/tex/latex`.

On a fresh installation, you should:

1. Create the folders `$HOME/.local/share/texmf/tex/latex` and `$HOME/.local/share/texmf/bibtex/bib`,
2. Setup the `$TEXMFHOME` variable in `$HOME/.profile`,
3. Run `install.sh` as above.

