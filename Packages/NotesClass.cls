\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NotesClass}[2021/09/19 Custom class for note taking]

\DeclareOption{openright}{\OptionNotUsed}
\DeclareOption{openleft}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass[a4paper, openany]{memoir}

\RequirePackage{ifthen}
\RequirePackage{ifluatex}

\ifluatex
    \let\normalunderbrace=\underbrace
    \RequirePackage{mathtools}
    \let\underbrace=\normalunderbrace
\fi

\ifluatex  % Don't load fontenc with lualatex
    \RequirePackage{fontspec}
    \RequirePackage[math-style=ISO]{unicode-math}
\else
    \RequirePackage[T1]{fontenc}
\fi
\RequirePackage{xcolor}
\definecolor{highlight}{RGB}{243,102,25} % Define the highlight color used for highlighting throughout
\RequirePackage{graphicx}

% define command
\newcommand{\define}[1]{\textbf{#1}}
\newcommand{\defineindex}[1]{\define{#1}\index{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Setup pagelayout -----------------------------------------------------
% change behaviour after title page to \clearforchapter for both even and odd pages, with openany option this means no blank page
\titlingpageend{\clearforchapter}{\clearforchapter}
% headings style (applied to chapter, section, ..., subparagraph)
\headstyles{memman}
% Chapter number as word; roman & bold
\chapterstyle{demo2}
% Section Headings Large and bold
\setsecheadstyle{\bfseries\sffamily\Large}
% Subsection headings large and small caps
\setsubsecheadstyle{\sffamily\Large}
% Subsubsection headings in small caps
\setsubsubsecheadstyle{\large\sffamily}
% Number subsection and higher
\setsecnumdepth{subsubsection}
% Number subsection and higher
\maxsecnumdepth{subsubsection}
% Section numbers in margins
\hangsecnum
% Make the section numbers the highlight colour
\addtoiargdef{\@seccntformat}{\color{highlight}}{}
% Change how the number prints
\renewcommand{\printchapternum}{%
    {%
        \color{highlight}
        \sffamily
        \HUGE
        \ifthenelse{\equal{\@chapapp}{\appendixname}}% test if in appendix
        {\thechapter}% if in appendix just print \thechapter (a letter)
        {\NumToName{\thechapter}} % if not in appendix print word version of \thechapter (a number)
    }
}
\renewcommand{\chaptitlefont}{\Huge\bfseries\sffamily}
% Numbering of equations etc.
\counterwithin{equation}{section}
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}

\footnotesinmargin

%%%%%% Layout for table of contents -----------------------------------------
% Put the word 'Page' above the page numbers in toc
\renewcommand{\aftertoctitle}{\afterchaptertitle\par\nobreak\mbox{}\hfill{\normalfont Page}\par\nobreak}
% Put the word 'Page' above the page numbers in lof
\renewcommand{\afterloftitle}{\afterchaptertitle\par\nobreak\mbox{}\hfill{\normalfont Page}\par\nobreak}
% Put the word 'Page' above the page numbers in lot
\renewcommand{\afterlottitle}{\afterchaptertitle\par\nobreak\mbox{}\hfill{\normalfont Page}\par\nobreak}
% Increase width of numbers for parts
\setlength{\cftpartnumwidth}{2.5em}
%%%%%% End layout for table of contents -------------------------------------
%%%%%% Figure/Table setup ---------------------------------------------------
% automatically center figures
\setfloatadjustment{figure}{\centering}
% automatically center tables
\setfloatadjustment{table}{\centering}
% Centre float captions
\captionstyle{\centering}
%%%%%% End figure/table setup -----------------------------------------------
%%%%%% Epigraphs ------------------------------------------------------------
% Make epigraph main text italic
\let\oldEpigraph\epigraph 
\renewcommand{\epigraph}[2]{\oldEpigraph{{\itshape #1}}{#2}}

%%%%%% End epigraphs --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Provide commands that automatically sets the front matter (title, toc, etc.)
% Set commands allowing for sub and subsub titles to be edited in the same way that \title sets \thetitle
\newcommand{\@subtitle}{Theoretical Physics}
\newcommand{\subtitle}[1]{%
    \renewcommand{\@subtitle}{#1}
}
\newcommand{\@subsubtitle}{Course Notes}
\newcommand{\subsubtitle}[1]{%
    \renewcommand{\@subsubtitle}{#1}
}
% The title page is the first page with the title, author, date all nicely laid out
% This style is adapted from Peter Wilsons titles which can be found here:
% https://anorien.csc.warwick.ac.uk/mirrors/CTAN/info/latex-samples/TitlePages/titlepages.pdf
\newcommand{\titlepage}{%
    \begin{titlingpage}
        \begingroup%
        \raggedleft
        \vspace*{\baselineskip}
        {\LARGE \theauthor}\\[0.167\textheight]
        {\large\bfseries \@subtitle}\\[\baselineskip]
        {\HUGE\bfseries\textcolor{gray}{\thetitle}}\\[\baselineskip]
        {\large\thedate}\par
        \vspace*{2\baselineskip}
        \vfill
        {\LARGE\scshape \@subsubtitle}\par
        \vspace*{3\baselineskip}
        \endgroup
    \end{titlingpage}
}

% Set the abstract name to be blank for use in the next command
\renewcommand{\abstractname}{}

% Inner title page is a reduced title page that should be the second page, like the first inner page of many books it repeats the title and maybe adds some more information in a more understated way.

\newcommand{\innertitlepage}[1]{%
    \maketitle  % Print the normal title
    \begin{abstract}  % Information about the course and this document
        These are my notes from the course {\MakeLowercase\thetitle{}}.
        I took this course as a part of the theoretical physics degree at the University of Edinburgh.
        
        These notes were last updated at \printtime{} on \today{}.
        For notes on other topics see \url{https://github.com/WilloughbySeago/Uni-Notes}.
    \end{abstract}
    % Add interesting image from the course
    \begingroup\centering
    \vfill
    % Test to see if an argument has been provided
    \ifx&#1&%
    % No argument, put a demo image
    \includegraphics[width=0.75\textwidth]{example-image-a}
    \else
    % Argument, put the argument as the image
    \includegraphics[width=0.75\textwidth]{#1}
    \fi
    \vfill
    \endgroup
}
%%%%%% Redefine tableofcontents/listof<figures/tables> -----------------------
% Redefine table of contents to have list of chapters and then full contents
\let\OLDtableofcontents=\tableofcontents
\renewcommand{\tableofcontents}{%
    % List of Chapters
    \clearpage
    \renewcommand*{\contentsname}{Chapters}
    \setcounter{tocdepth}{0}
    \OLDtableofcontents
    % Full contents
    \clearpage
    \renewcommand*{\contentsname}{Contents}
    \setcounter{tocdepth}{2}
    \OLDtableofcontents
}
% Redefine listof<figures/tables> to start with a page break
\let\OLDlistoffigures=\listoffigures
\renewcommand{\listoffigures}{\clearpage\OLDlistoffigures}
\let\OLDlistoftables=\listoftables
\renewcommand{\listoftables}{\clearpage\OLDlistoftables}
%%%%%% End redefine tableofcontents/listof<figures/tables> -------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Index/glossaries -----------------------------------------------------
% NB: run commands tell you which commands to run, assumes two style files for index and glossary called indexstyle.ist and glossarystyle.ist respectively
\makeindex
% run command: makeindex -s <Path to index style>/indexstyle.ist \jobtitle
\makeglossary
% run command: makeindex -s <Path to glossary style>/glossarystyle.gst -o memoir-test.gls \jobtitle.glo
\makeglossary[acronym]
% run command: makeindex -s <Path to glossary style>/glossarystyle.gst -o acronym.gls acronym.glo

% Change how glossary entries are printed:
\renewcommand{\glossitem}[4]{\textsc{#1:} #2 #3 #4\\}  % #1 = term, #2 = definition, #3 = reference (optional, default blank), #4 = page number
% Prints gloss entries as \textsc{term:} definition ref \hyperpage{page num}
% Make page numbers in glossaries into links
\changeglossnumformat{|hyperpage}
\changeglossnumformat[acronym]{|hyperpage}
%%%%%% End index/glossaries -------------------------------------------------
%%%%%% Ams things need loading before fonts
\RequirePackage{amsmath}
\ifluatex
    % \let\OLDarrowvert\arrowvert
    %\undef\arrowvert
    %\let\OLDeth\eth
    %\undef\eth
    %\let\OLDdigamma\digamma
    %\undef\digamma
    %\let\OLDbackepsilon\backepsilon
    %\undef\backepsilon
\else
    \RequirePackage{amssymb}
\fi
\RequirePackage{amsthm}
%%%%%% End ams things need loading before fonts

%%%%%% Fonts ----------------------------------------------------------------
\ifluatex
    \setmainfont{Stix Two Text}
    \setsansfont{TeX Gyre Adventor}
    \setmonofont{TeX Gyre Cursor}
    \setmathfont{Stix Two Math}
    \setmathfont{Latin Modern Math}[range=frak]
    \setmathfont{TeX Gyre Cursor}[range=tt]
    %\RequirePackage[%
    %vvarbb,       % Make \mathbb an alias for \vvmathbb 
    %libertine,    % Use libertine fonts for letters
    %liby,         % Nicer y, slightly more angular
    %libaltvw,     % Nicer v and w
    %slantedGreek  % Make upercase Greek slanted (complies w/ ISO standards)
    %]{newtxmath}
\else
    \RequirePackage{libertine}  % Main font
    \RequirePackage{avant}  % Sans serif font
    \RequirePackage[%
    varl  % Change lowercase L to look less like a one
    ]{inconsolata}  % Typewriter font
    \RequirePackage[%
    vvarbb,       % Make \mathbb an alias for \vvmathbb 
    libertine,    % Use libertine fonts for letters
    liby,         % Nicer y, slightly more angular
    libaltvw,     % Nicer v and w
    slantedGreek  % Make upercase Greek slanted (complies w/ ISO standards)
    ]{newtxmath}
\fi
%%%%%% End fonts ------------------------------------------------------------
%%%%%% Misc. ----------------------------------------------------------------
\renewcommand*{\fnumbersep}{\,}  % redefine separator for \fcardinal, e.g. \facardinal{1234} = 1\fnumbersep{}234 = 1\,234
%%%%%% End misc. ------------------------------------------------------------


