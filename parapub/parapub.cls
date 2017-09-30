% Parallel Publishing Toolbox
% ===========================
% The parapub class provides an easy way of creating cover pages for parallel
% publishing of scientific articles. The cover page includes the necessary 
% copyright and citation information such that the paper can be posted on a 
% personal or institutional homepage.
%
% Package options:
%   hyperref   Enables hyperref
% 
% parapub.sty -- Version 3.0 -- 2017-09-30 -- Roland Hostettler

% TODO:
%   * Right now, the output is not sensible when none of the keys are set.

% Class definition
% ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{parapub}[2017/09/30 v3.0 Parallel Publishing Toolbox]

% Early Dependencies
% ------------------
\RequirePackage{etoolbox}  % Used for if/else constructs

% Class options
% -------------
\newtoggle{hyperref}       % false by default
\DeclareOption{hyperref}{\toggletrue{hyperref}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

% Late Dependencies
% -----------------
\RequirePackage{geometry}
\RequirePackage{keyval}    % Used for key-value pairs in \parapubsetup
\RequirePackage{parskip}   % Neat paragraph skipping
\RequirePackage{microtype} % Improved line breaks
\RequirePackage{pdfpages}  % Used to include the article PDF
\RequirePackage{bibentry}  % For the citation

% Optional dependencies
% ---------------------
% hyperref (disabled by default; needs to be after the above for some reason
\AtBeginDocument{
    \iftoggle{hyperref}{%
        \makeatletter\let\saved@bibitem\@bibitem\makeatother%
    	\RequirePackage[hidelinks]{hyperref}%
        \makeatletter\let\@bibitem\saved@bibitem\makeatother%
    }{
	    \newcommand{\href}[2]{#2}
    }
}

% Cover Page
% ----------
% The cover page is created by simply invoking the \article command. It
% includes the paper title, authors, a full citation, copyright notice, DOI, 
% and citation instructions. The following options can be set:
%
%  journal     The journal (or conference) where the paper is (to be) 
%              published,
%  citationkey The key of the citation for the paper in the bibliography for
%              including a full citation on the cover page,
%  doi         The digital object identifier of the paper (accepted/published)
%  copyright   A copyright notice, either your own or a predefined one (see 
%              below),
%
% and one of
%   
%  preprint    for preprints,
%  accepted    for accepted papers,
%  published   for published papers.

% Journal/conference
\newcommand{\setjournal}[1]{\def\thejournal{#1}}
\setjournal{}
\define@key{paper}{journal}{\setjournal{#1}}

% Citation key
\newcommand{\setcitationkey}[1]{\def\thecitationkey{#1}}
\setcitationkey{}
\define@key{paper}{citationkey}{\setcitationkey{#1}}

% DOI
\newtoggle{hasdoi}
\togglefalse{hasdoi}
\newcommand{\setdoi}[1]{\def\thedoi{#1}}
\setdoi{}
\define@key{paper}{doi}{%
    \setdoi{#1}%
    \toggletrue{hasdoi}%
}

% Copyright
\newcommand{\setcopyright}[1]{\def\thecopyright{#1}}
\setcopyright{}
\define@key{paper}{copyright}{\setcopyright{#1}}

% Pre-print (default), accepted, or published
\newtoggle{preprint}
\toggletrue{preprint}
\newtoggle{accepted}    % false by default
\newtoggle{published}   % false by default
\define@key{paper}{preprint}[true]{%
    \toggletrue{preprint}%
    \togglefalse{accepted}%
    \togglefalse{published}%
}
\define@key{paper}{accepted}[false]{%
    \togglefalse{preprint}%
    \toggletrue{accepted}%
    \togglefalse{published}%
}
\define@key{paper}{published}[false]{%
    \togglefalse{preprint}%
    \togglefalse{accepted}%
    \toggletrue{published}%
}

% Generates the complete cover page
\newcommand{\article}[2][]{
    % Options
    \setkeys{paper}{#1}

    % Title
    \date{}
    \maketitle
	\thispagestyle{empty}

	% Disclaimer
    \iftoggle{preprint}{%
        % Preprint
        This is a pre-print of a paper submitted for consideration in %
        \textit{\thejournal}.%
    }{}%
    \iftoggle{accepted}{%
        % Accepted paper
        This is a pre-print of a paper accepted for publication in %
        \textit{\thejournal}. When citing this work, you must always cite the %
        original article:%
    }{}%
    \iftoggle{published}{%
        This is a post-print of a paper published in \textit{\thejournal}. %
        When citing this work, you must always cite the original article:
    }{}%

    % Citation
    \begin{center}
        \begin{minipage}{0.9\columnwidth}
            \vspace*{2em}
            \bibentry{\thecitationkey}
        \end{minipage}
    \end{center}

    % DOI (incl. link if applicable)
    \iftoggle{hasdoi}{%
        \vspace*{2em}
        \textbf{DOI:}

        \href{http://dx.doi.org/\thedoi}{\thedoi}
    }{}
	
    % Copyright notice
    \vspace*{2em}
    \textbf{Copyright:}

    \thecopyright

    % Article
    \includepdf[pages=-]{#2}
}

% Copyright Disclaimers
% ---------------------
% IEEE
\newcommand{\IEEECopyrightNotice}[0]{%
	Copyright \the\year\ IEEE. Personal use of this material is permitted. 
    Permission from IEEE must be obtained for all other uses, in any current 
    or future media, including reprinting/republishing this material for 
    advertising or promotional purposes, creating new collective works, for 
    resale or redistribution to servers or lists, or reuse of any copyrighted 
    component of this work in other works.
}

% IFAC
\newcommand{\IFACCopyrightNotice}[0]{%
    Copyright \the\year\ IFAC. This is the author's version of a work that was 
    accepted for publication in \href{http://ifac-papersonline.net}{ifac-papersonline.net}. 
    Changes resulting from the publishing process, such as peer review, 
    editing, corrections, structural formatting, and other quality control 
    mechanisms may not be reflected in this document. Changes may have been 
    made to this work since it was submitted for publication. A definitive 
    version was subsequently published in \href{http://ifac-papersonline.net}{ifac-papersonline.net}.
}

% EUSIPCO
\newcommand{\EUSIPCOCopyrightNotice}[0]{%
    Copyright \the\year\ EURASIP. First published in the Proceedings of the 
    European Signal Processing Conference (EUSIPCO-\the\year) in \the\year, 
    published by EURASIP.
}

