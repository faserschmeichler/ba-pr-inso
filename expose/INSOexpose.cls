%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Document Class for INSO Exposes
%
%	Author: Stefan Taber
%	Date: 2011/07/15
%	Last Modification: 2011/08/04
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	USAGE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	\documentclass{INSOexpose}
%
%	\title{}	% same as scrartcl
%	\subtitle{}	% same as scrartcl
%	\author{}	% same as scrartcl
%	\date{}		% same as scrartcl
%	\version{}	% new, version of the dokument
%	\draft{}	% new
%
%	\begin{document}
% 	  
%	  \maketitle	% same as scrartcl, creates the inso specific titlepage
%
% 	\end{document}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Information about the class 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\fileversion{Version 1.0}
\def\filedate{2011/07/14}
\def\filedescription{INSO Expose Document Class}
\def\fileauthor{Stefan Taber}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Class.
% INSOexpose extends scrartcl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{INSOexpose}[\filedate\space \filedescription\space \fileversion\space by \fileauthor]
\typeout{\filedate\space \filedescription\space \fileversion\space by \fileauthor}
\LoadClassWithOptions{scrartcl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% OPTIONS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{english} 	{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{german} 		{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{ngerman} 	{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% USE Packages
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{babel}
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{calc}
\RequirePackage{geometry}[2010/09/12]
\RequirePackage{tikz}
\RequirePackage{color}
\RequirePackage{lastpage}
\RequirePackage[utf8]{inputenc}
\RequirePackage{biblatex}
\RequirePackage{fix-cm}

\makeatletter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Option params
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Expose informations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\gdef\@dokumenttyp	{Diplomarbeit}
\gdef\@title		{Vorl\"aufiger Arbeitstitel der Arbeit}
\gdef\@shorttitle	{\@title}
\gdef\@subtitle		{}
\gdef\@author		{Vorname Nachname}
\gdef\@date		{Datum}
\gdef\@matrikelnr	{Matrikelnummer}
\gdef\@kennzahl		{Kennzahl}
\gdef\@studium		{Studienrichtung}
\gdef\@assistent	{Florian Fankhauser}
\gdef\@betreuer		{Thomas Grechenig}

\gdef\dokumenttyp#1	{\gdef\@dokumenttyp	{#1}}
\gdef\title#1		{\gdef\@title		{#1}}
\gdef\shorttitle#1	{\gdef\@shorttitle	{#1}}
\gdef\subtitle#1	{\gdef\@subtitle	{#1}}
\gdef\author#1		{\gdef\@author		{#1}}
\gdef\date#1		{\gdef\@date		{#1}}
\gdef\matrikelnr#1	{\gdef\@matrikelnr	{#1}}
\gdef\kennzahl#1	{\gdef\@kennzahl	{#1}}
\gdef\studium#1		{\gdef\@studium		{#1}}
\gdef\assistent#1	{\gdef\@assistent	{#1}}
\gdef\betreuer#1	{\gdef\@betreuer	{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Maketitle
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\

\renewcommand\maketitle{
  \thispagestyle{empty}
  \@maketitle%
  \eject
  \section*{\huge\title@label}
}

\def\@maketitle{
  \newgeometry{a4paper, top=2cm, left=2cm, bottom=2cm, right=2cm}

  \titlepage@header

  \vskip 4cm

  {
    \noindent
    \sffamily \fontsize{28}{4}\selectfont
    \whichlanguage{Expos\'e of}{Expos\'e zur} \@dokumenttyp
  }

  \vskip 3cm

  {
    \sffamily \fontsize{22}{4} \selectfont
    \@title
  }

  \vskip 1cm

  {
    \fontsize{18}{4}\selectfont
    \bf
    \@subtitle
  }

  \vfill

  {
    \textbf{\noindent
      \whichlanguage{Advisor}{Betreuer}: \@betreuer	\\
      \whichlanguage{Assistance}{Betreuender Assistent}: \@assistent
    }
  }

  \vfill
  
  {
    \@author\\
    \@matrikelnr\\
    \@kennzahl\\
    \@studium\\
  }

  \vskip 1cm

  {
    \begin{tabbing}
      \hspace{0.6\linewidth} \= \hspace{0.4\linewidth} \kill
      \@date \> \parbox{0.4\linewidth}{\dotfill} \\
      \> \parbox{0.4\linewidth}{\centering \@betreuer} \\
    \end{tabbing}
  }
  
  \titlepage@footer

  \restoregeometry
}

\def\titlepage@footer{
  \parbox[t]{\linewidth}{
    \vskip 1.2cm
  }
}
\def\titlepage@header{
  \noindent
  \tikz{
    \node at (0,0.4) {
      \begin{minipage}[b][1.2cm][t]{0.25\linewidth}
        \inso@header@logocolor{1.2cm}
      \end{minipage}
    };
    \node at (8.5,0) {
      \begin{minipage}[t][1.2cm][t]{0.75\linewidth}
        \inso@header@text
      \end{minipage}
    };
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% STYLE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\parindent{0px}
\setkomafont{sectioning}{\sffamily\mdseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LOGO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\inso@header@text{
  {
    \noindent
    \sffamily \fontsize{12}{0}\selectfont
    \textmd{\inso@logo@company}\\[1pt]

    \noindent
    \sffamily \fontsize{7}{0}\selectfont
    \inso@logo@text
  }
}
\def\inso@header@logocolor#1{%
  \ifpdf
    \includegraphics[height=#1]{./imgs/logos/inso-color.pdf} 
    \includegraphics[height=#1]{./imgs/logos/inf-tu-logo-kombi.pdf}
  \else
    \includegraphics[height=#1]{./imgs/logos/inso-color.eps} 
    \includegraphics[height=#1]{./imgs/logos/inf-tu-logo-kombi.eps}
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DEFAULT SETTINGS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Headers
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancyhf	{} 			% alle Felder löschen
\renewcommand	{\headrulewidth}{0cm} 	% unterdruecken der Linie
\renewcommand	{\footrulewidth}{0cm} 	% unterdruecken der Linie
\setlength	\headsep{2cm}		% header skip
\fancyhead	{}
\fancyfoot [L]	{\parbox[b]{0.7\linewidth}{\@shorttitle}} 
\fancyfoot [R]	{\label@page}
\pagestyle	{fancy}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Language specific 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\whichlanguage#1#2{% depending of the language the first english text or the second german text will be used
\relax\iflanguage{english}{#1}{\iflanguage{ngerman}{#2}{\iflanguage{german}{#2}{#1}}}\relax
}

\def\label@page{\whichlanguage{Page~\thepage~of~\pageref{LastPage}}{Seite~\thepage~von~\pageref{LastPage}}}
\def\title@label{\whichlanguage{Expos\'e of \@dokumenttyp}{Expos\'e zur \@dokumenttyp}}
\def\inso@logo@company{INSO - Industrial Software}
\def\inso@logo@text{\whichlanguage{Institute of Computer Aided Automation $|$ Faculty of Informatics $|$ Vienna University of Technology}{Institut f{\"u}r Rechnergest\"utzte Automation $|$ Fakult\"at f\"ur Informatik $|$ Technische Universit\"at Wien}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% EOF
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatother
\endinput