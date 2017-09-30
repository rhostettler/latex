%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX document class: rhsleek.cls
%%
%% Created by: Roland Hostettler, April 19, 2012
%%
%% Based on the ltusimple class by Roland Hostettler
%%
%% Revision History
%% ----------------
%% Ver. Date/Author   Comments
%% 1.0  2012-04-19/HR Initial version
%% 1.1  2014-06-10/HR Revision to use extarticle instead of article as the base
%%                    class in order to avoid font size problems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% NOTE TO SELF: The original template used \Large as normalsize which yields a
%               default font size of about 14pt and is '2 steps larger' than the
%               regular normalsize. Hence, when using extarticle, i scaled down 
%               all fonts by two steps in order to obtain the same proportions.

% TODO:
%   * I seem to use hardcoded parskip, should be replaced by the parskip package
%   * I seem to be reinventing beamer, i might want to check again 
%   * What I'm doing with 'newchapter' should be solved by using the chapter- or
%     section-titles with appropriate formatting. Topics should be on section-
%     level, slides on subsection, titles within slides on subsub- or paragraph


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Identification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rhsleek}[2011/04/04 Roland's sleek slides template.]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options Handling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parent Class
% ============
% Forward all the unknown options to our base class and process them
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Classes and Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\LoadClass{article}
\LoadClass[17pt]{extarticle}
%\LoadClass[14pt]{extarticle}

% 4:3
% 102.4 dpi for 1024x768
\RequirePackage[paperwidth=25.4cm,paperheight=19.05cm,left=1.6cm,right=1.6cm,top=1.2cm,bottom=1.8cm,headheight=0cm,headsep=0cm,footskip=0.6cm]{geometry}

% 16:9
%\RequirePackage[paperwidth=33.87cm,paperheight=19.05cm,left=1.6cm,right=1.6cm,top=1.2cm,bottom=1.8cm,headheight=0cm,headsep=0cm,footskip=0.6cm]{geometry}

\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{watermark}
%\RequirePackage[utf8]{inputenc}
\RequirePackage{titlesec}
\RequirePackage{xcolor}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Customize the Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Colors
% ======
%\definecolor{ltured}{rgb}{0.78,0,0.15}
%\definecolor{ltublue}{rgb}{0.1,0.13,0.25}
%\definecolor{myblue}{rgb}{0.375,0.375,0.75}
%\definecolor{myblue}{rgb}{0.6,0.6,0.75}
%\definecolor{mygrey}{rgb}{0.5,0.5,0.5}
\definecolor{mygrey}{gray}{0.5}
%\definecolor{titlegrey}{gray}{0.5}


% Indentation & paragraph separation
% ==================================
% No indentation, 8pt separation
\setlength{\parindent}{0pt}
\setlength{\parskip}{8pt plus 1pt minus 1pt}


% Fonts
% =====
% Helvetica for everything
%\renewcommand{\sfdefault}{phv}
%\renewcommand{\rmdefault}{phv}
%\renewcommand{\ttdefault}{phv}
\renewcommand{\familydefault}{\sfdefault}

% Default font size is "Large" (ca. 14pt)
%\renewcommand{\normalsize}{\Large}


% Header & Footers
% ================
% Default to our layout
\pagestyle{fancy}	% set page layout
\fancyhf{}			% clear header/footer

% Header: LTU (full name) on the left, snow-landscape in the background and
% girly on the right
\renewcommand{\headrulewidth}{0pt}
%\watermark{\hspace{-1.6cm}\raisebox{-2cm}{\color{myblue}\rule{25.4cm}{3.2cm}}}
\watermark{\hspace{1cm}\raisebox{-1.6cm}{\color{mygrey}\rule{25.4cm}{0.05cm}}}

% Footer: Page number on the right, date centered, author left
%\fancyfoot[L]{\textbf{\color{mygrey}\large \@theauthor}}
%\fancyfoot[R]{\textbf{\color{mygrey}\large \@thedate}}
%\fancyfoot[C]{\textbf{\color{mygrey}\large \thepage}}
\fancyfoot[L]{\textbf{\color{mygrey}\small \@theauthor}}
\fancyfoot[R]{\textbf{\color{mygrey}\small \@thedate}}
\fancyfoot[C]{\textbf{\color{mygrey}\small \thepage}}
%\fancyfoot[L]{\color{mygrey}\small \@theauthor}
%\fancyfoot[R]{\color{mygrey}\small \@thedate}
%\fancyfoot[C]{\color{mygrey}\small \thepage}
\renewcommand{\footrulewidth}{0pt}


% Reformat the chapter headings
% =============================
% We don't want to use section numbers
\setcounter{secnumdepth}{-1}

% Note: The formatting command has the following syntax:
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]

% Sections are used for slide titles. Format: Boldface, "huge", LTU blue
%\titleformat{\section}{\color{mygrey}\bfseries\huge}{}{0pt}{}
%\titleformat{\subsection}{\bfseries\Large}{}{0pt}{}
\titleformat{\section}{\color{mygrey}\bfseries\Large}{}{0pt}{}
\titleformat{\subsection}{\bfseries\normalsize}{}{0pt}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Custom Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Title Slide
% ===========
% Title
\renewcommand{\title}[1]{
	\def\@thetitle{#1}
}
\title{}

% Author
\renewcommand{\author}[1]{
	\def\@theauthor{#1}
}
\author{}

% Institute
\newcommand{\affilation}[1]{
	\def\@theaffilation{#1}
}
\affilation{}

% Date
\renewcommand{\date}[1]{
	\def\@thedate{#1}
}
\date{}

% Maketitle: Inserts a nice standard title slide
\renewcommand{\maketitle}{
	\setlength{\parskip}{0pt}
	\thiswatermark{}
    \thispagestyle{empty}
    \pagenumbering{Roman}
	\begin{center}
		\vspace*{3.5cm}
%		{\huge \textbf{\@thetitle}}\vspace{0.75cm}
        {\Large \textbf{\@thetitle}}\vspace{0.75cm}
%		{\huge \colorbox{myblue}{\hspace*{1.5cm}\raisebox{0cm}[1.25cm][0.75cm]{\textbf{\@thetitle}}\hspace*{1.5cm}}}\vspace*{0.75cm}

%		{\LARGE \@theauthor}\vspace{0.5cm}
        {\large \@theauthor}\vspace{0.5cm}

%		{\Large \@theaffilation}\vspace{0.5cm}
    	{\normalsize \@theaffilation}\vspace{0.5cm}

%		{\Large \@thedate}
    	{\normalsize \@thedate}
		\clearpage
	\end{center}
	\setlength{\parskip}{8pt plus 1pt minus 1pt}
    \pagenumbering{arabic}
}


% Useful Commands/Custom Environments (NOT slides, see below)
% ===========================================================

% Center the content both vertically and horizontally
\newcommand{\sideimage}[2]{
	\begin{minipage}[t]{\textwidth}
		\begin{center}
			{\attributionsize \textcolor{mygrey}{#2 \\}}
			\includegraphics[width=0.9\textwidth]{#1}
		\end{center}
	\end{minipage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Slide Templates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Slide
% =====
% A standard/plain slide template
\newenvironment{slide}[1]{
	\clearpage
	\section{#1}
	\vspace*{1.2cm}
}{
}

% Chapter divisor slide
% 
\newcommand{\chapter}[1]{%
    \clearpage%
	\thiswatermark{}%
    \thispagestyle{empty}%
    \vspace*{\fill}
    \begin{center}
        {\color{mygrey}\bfseries\Large #1}
    \end{center}
    \vspace*{\fill}
%    \clearpage
}



% Two Column Slide
% ================
% To be used in conjunction with 'slide'
\newenvironment{column}[0]{
	\begin{minipage}[t]{0.49\textwidth}
		\vspace{0pt}
}{
	\end{minipage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EOF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

