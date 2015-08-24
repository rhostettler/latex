%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX document class: ltusimple.cls
%%
%% Created by: Roland Hostettler, April 4, 2011
%%
%% Made from scratch.
%%
%% Revision History
%% ----------------
%% Ver. Date/Author   Comments
%% 1.0  2011-04-04/HR Initial version
%% 1.1  2011-06-28/HR Fixed a bug that caused errors when parts of the title
%%                    slide weren't set.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Identification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ltusimple}[2011/04/04 Roland's simple LTU slides template.]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options Handling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Table of Contents, List of Figures and List of Tables
% =====================================================
% No options at for the time being

% Parent Class
% ============
% Forward all the unknown options to our base class and process them
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Classes and Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass{article}
\RequirePackage[paperwidth=25.4cm,paperheight=19.05cm,left=1.6cm,right=1.6cm,top=4.75cm,bottom=2.5cm,headheight=2.1cm,headsep=2.6cm,footskip=0.6cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{watermark}
\RequirePackage[utf8]{inputenc}
\RequirePackage{titlesec}
\RequirePackage{color}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Customize the Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Colors
% ======
\definecolor{ltured}{rgb}{0.78,0,0.15}
\definecolor{ltublue}{rgb}{0.1,0.13,0.25}


% Indentation & paragraph separation
% ==================================
% No indentation, 8pt separation
\setlength{\parindent}{0pt}
\setlength{\parskip}{8pt plus 1pt minus 1pt}


% Fonts
% =====
% Helvetica for everything
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{phv}
%\renewcommand{\ttdefault}{phv}

% Default font size is "Large" (ca. 14pt)
\renewcommand{\normalsize}{\Large}


% Header & Footers
% ================
% Default to our layout
\pagestyle{fancy}	% set page layout
\fancyhf{}			% clear header/footer

% Header: LTU (full name) on the left, snow-landscape in the background and
% girly on the right
\fancyhead[L]{\textbf{\large \uppercase{Luleå University of Technology}}}
\renewcommand{\headrulewidth}{0pt}
\watermark{\hspace{-1.6cm}\raisebox{-1.7cm}{\includegraphics[width=\paperwidth]{template/header}}}

% Footer: Page number on the left, LTU-L with slogan on the right
\fancyfoot[L]{\raisebox{-0.5cm}{\parbox[c][1.1cm]{1cm}{\textbf{\large \thepage}}}}
\fancyfoot[R]{\raisebox{-0.5cm}{\parbox[c][1.1cm]{11cm}{\includegraphics[height=1.08cm]{template/slogan}}}}
\renewcommand{\footrulewidth}{0pt}


% Reformat the chapter headings
% =============================
% We don't want to use section numbers
\setcounter{secnumdepth}{-1}

% Note: The formatting command has the following syntax:
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]

% Sections are used for slide titles. Format: Boldface, "huge", LTU blue
\titleformat{\section}{\bfseries\huge\color{ltublue}}{}{0pt}{}
\titleformat{\subsection}{\bfseries\Large\color{ltublue}}{}{0pt}{}


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
	\begin{center}
		\vspace*{1cm}
		{\huge \color{ltublue} \textbf{\@thetitle}}\vspace{0.75cm}

		{\LARGE \@theauthor}\vspace{0.5cm}

		{\Large \@theaffilation}\vspace{0.5cm}

		{\Large \@thedate}
		\clearpage
	\end{center}
	\setlength{\parskip}{8pt plus 1pt minus 1pt}
}


% Useful Commands/Custom Environments (NOT slides, see below)
% ===========================================================

% Center the content both vertically and horizontally
\newcommand{\sideimage}[2]{
	\begin{minipage}[t]{\textwidth}
		\begin{center}
			{\attributionsize \textcolor{mygray}{#2 \\}}
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
}{
}


% Two Column Slide
% ================
% To be used in conjunction with 'slide'
\newenvironment{column}[0]{
	\begin{minipage}[t]{0.47\textwidth}
		\vspace{0pt}
}{
	\end{minipage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EOF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

