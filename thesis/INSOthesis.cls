%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Document Class for INSO master thesis
%
%	Author: Stefan Taber
%	Date: 2011/07/15
%	Last Modification: 2011/08/04
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Information about the class 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\fileversion{Version 1.0}
\def\filedate{2011/07/14}
\def\filedescription{INSO thesis Document Class}
\def\fileauthor{Stefan Taber}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Class.
% INSOexpose extends scrartcl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{INSOthesis}[\filedate\space \filedescription\space \fileversion\space by \fileauthor]
\typeout{\filedate\space \filedescription\space \fileversion\space by \fileauthor}
\LoadClassWithOptions{memoir}

\makeatletter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% OPTIONS params
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% titlepages
\newif\ifthesis@defaulttitlepages	\thesis@defaulttitlepagestrue
\newif\ifthesis@tutitlepageDE		\thesis@tutitlepageDEtrue
\newif\ifthesis@tutitlepageEN		\thesis@tutitlepageENfalse
\newif\ifthesis@insotitlepageDE		\thesis@insotitlepageDEfalse
\newif\ifthesis@insotitlepageEN		\thesis@insotitlepageENfalse
% language
\newif\ifthesis@english			\thesis@englishfalse
% bachelor
\newif\ifthesis@masterthesis		\thesis@masterthesistrue
% abstract
\newif\ifthesis@declaration		\thesis@declarationtrue
\newif\ifthesis@acknowledgements	\thesis@acknowledgementstrue
\newif\ifthesis@listoffigures		\thesis@listoffigurestrue
\newif\ifthesis@listoftables		\thesis@listoftablestrue
\newif\ifthesis@listofalgorithms	\thesis@listofalgorithmstrue
\newif\ifthesis@listofabbrev		\thesis@listofabbrevtrue
\newif\ifthesis@todonotes		\thesis@todonotesfalse
% commons
\newif\ifAssistance			\Assistancetrue
\newif\ifthesis@webreferences		\thesis@webreferencestrue

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% OPTIONS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bachelor
\DeclareOption{bachelor}{
  \thesis@masterthesisfalse
  \thesis@declarationfalse
  \thesis@acknowledgementsfalse
}
% commons
\DeclareOption{noassistance}	{\Assistancefalse}
\DeclareOption{webreferences}	{\thesis@webreferencestrue}
\DeclareOption{nowebreferences}	{\thesis@webreferencesfalse}
% todo
\DeclareOption{disabletodo}	{\thesis@todonotesfalse}
\DeclareOption{todo}		{\thesis@todonotestrue}
% abstracts
\DeclareOption{declaration}	{\thesis@declarationtrue}
\DeclareOption{acknowledgements}{\thesis@acknowledgementstrue}
\DeclareOption{listoffigures}	{\thesis@listoffigurestrue}
\DeclareOption{listoftables}	{\thesis@listoftablestrue}
\DeclareOption{listofalgorithms}{\thesis@listofalgorithmstrue}
\DeclareOption{listofabbrev}	{\thesis@listofabbrevtrue}

\DeclareOption{nodeclaration}		{\thesis@declarationfalse}
\DeclareOption{noacknowledgements}	{\thesis@acknowledgementsfalse}
\DeclareOption{nolistoffigures}		{\thesis@listoffiguresfalse}
\DeclareOption{nolistoftables}		{\thesis@listoftablesfalse}
\DeclareOption{nolistofalgorithms}	{\thesis@listofalgorithmsfalse}
\DeclareOption{nolistofabbrev}		{\thesis@listofabbrevfalse}
% language support
\DeclareOption{english} {\thesis@englishtrue}
\DeclareOption{german} 	{\thesis@englishfalse}
\DeclareOption{ngerman} {\thesis@englishfalse}
% titlepages
\DeclareOption{tutitlepageEN}		{\thesis@tutitlepageENtrue\thesis@defaulttitlepagesfalse}
\DeclareOption{insotitlepageEN}		{\thesis@insotitlepageENtrue\thesis@defaulttitlepagesfalse}
\DeclareOption{tutitlepageDE}		{\thesis@tutitlepageDEtrue\thesis@defaulttitlepagesfalse}
\DeclareOption{insotitlepageDE}		{\thesis@insotitlepageDEtrue\thesis@defaulttitlepagesfalse}
\DeclareOption{notutitlepageEN}		{\thesis@tutitlepageENfalse\thesis@defaulttitlepagesfalse}
\DeclareOption{noinsotitlepageEN}	{\thesis@insotitlepageENfalse\thesis@defaulttitlepagesfalse}
\DeclareOption{notutitlepageDE}		{\thesis@tutitlepageDEfalse\thesis@defaulttitlepagesfalse}
\DeclareOption{noinsotitlepageDE}	{\thesis@insotitlepageDEfalse\thesis@defaulttitlepagesfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
% default options
\ExecuteOptions{a4paper, 10pt, ngerman}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% USE Packages
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}
\RequirePackage[german,ngerman,english]{babel}
\RequirePackage{geometry}[2010/09/12]
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage{ifpdf}
\let\footruleskip\relax % for compatibility of memoir and fancyhdr
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{arrows,automata}
\RequirePackage{color}
\ifthesis@todonotes
  \RequirePackage{todonotes}
\else
  \RequirePackage[obeyDraft]{todonotes}
\fi
\RequirePackage{biblatex}
\RequirePackage{fix-cm}
\RequirePackage{styles/INSO}
\RequirePackage{styles/TUINFDA}
\RequirePackage{url}
\RequirePackage{hyperref}					% links in pdf
\RequirePackage{verbatim}            			% Code-Environment
\RequirePackage[lined,linesnumbered,algochapter]{algorithm2e} % Algorithm-Environment
\RequirePackage{needspace}
\RequirePackage{pgf}					
\RequirePackage[printonlyused]{acronym} 
\RequirePackage{listings}
\RequirePackage{comment}
\RequirePackage{ifdraft}
\RequirePackage[hang,bottom,norule]{footmisc}
\RequirePackage{setspace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Package Version checking
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifpackagelater{geometry}{2010/09/12}{}{
  \PackageError{INSOthesis}{Outdated 'geometry' package}{
    Upgrade to geometry v5.6 (2010/09/12) or later.\MessageBreak
    I found: '\csuse{ver@geometry.sty}'.\MessageBreak
    This is a fatal error. I'm aborting now.
  }
  %\endinput
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Expose informations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\gdef\@title		{Titel der Arbeit}
\gdef\@shorttitle	{\@title}
\gdef\@subtitle		{Untertitel der Arbeit}
\gdef\@author		{Vorname Nachname}
\gdef\@date		{Datum}

\gdef\title#1		{\xdef\@title		{#1}}
\gdef\shorttitle#1	{\xdef\@shorttitle	{#1}}
\gdef\subtitle#1	{\xdef\@subtitle	{#1}}
\gdef\author#1		{\xdef\@author		{#1}}
\gdef\date#1		{\xdef\@date		{#1}}

\gdef\@thesistitle		{\@title}
\gdef\@thesisshorttitle		{\@shorttitle}
\gdef\@thesissubtitle		{\@subtitle}
\gdef\@thesisdate		{\@date}
\ifthesis@masterthesis
  \gdef\@thesistype		{DIPLOMARBEIT}
  \gdef\@thesistypeen		{MASTER'S THESIS}
\else
  \gdef\@thesistype		{BACHELORARBEIT}
  \gdef\@thesistypeen		{BACHELOR THESIS}
\fi
\ifthesis@masterthesis
  \gdef\@thesisdegree		{Diplom-Ingenieur/in}
  \gdef\@thesisdegreeen		{Master of Science}
\else
  \gdef\@thesisdegree		{Bachelor of Science}
  \gdef\@thesisdegreeen		{Bachelor of Science}
\fi
\gdef\@thesiscurriculum		{Wirtschaftsinformatik}
\gdef\@thesiscurriculumen	{Business Informatics}
\gdef\@thesisauthor		{\@author}
\gdef\@thesisauthoraddress	{Adresse}
\gdef\@thesismatrikelno		{Matrikelnummer}
\gdef\@thesisadvisor@one	{Thomas Grechenig}
\gdef\@thesisadvisor@two	{}
\gdef\@thesisadvisor@three	{}
\gdef\@thesisauthorpreamble	{Verfasser/In}
\gdef\@thesisadvisorpreamble	{Betreuung}

\gdef\thesistitle#1		{\xdef\@title			{#1}}
\gdef\thesisshorttitle#1	{\xdef\@shorttitle		{#1}}
\gdef\thesissubtitle#1		{\xdef\@subtitle		{#1}}
\gdef\thesisdate#1		{\xdef\@date			{#1}}
\gdef\thesistype#1#2		{\xdef\@thesistype		{#1}	\xdef\@thesistypeen	{#2}}
\gdef\thesisdegree#1#2		{\xdef\@thesisdegree		{#1}	\xdef\@thesisdegreeen	{#2}}
\gdef\thesiscurriculum#1#2	{\xdef\@thesiscurriculum	{#1}	\xdef\@thesiscurriculumen{#2}}
\gdef\thesisauthor#1		{\xdef\@author			{#1}}
\gdef\thesisauthoraddress#1	{\xdef\@thesisauthoraddress	{#1}}
\gdef\thesismatrikelno#1	{\xdef\@thesismatrikelno	{#1}}
\gdef\thesisadvisorone#1	{\xdef\@thesisadvisor@one	{#1}}
\gdef\thesisadvisortwo#1	{\xdef\@thesisadvisor@two	{#1}}
\gdef\thesisadvisorthree#1	{\xdef\@thesisadvisor@three	{#1}}
\gdef\thesisauthorpreamble#1	{\xdef\@thesisauthorpreamble	{#1}}
\gdef\thesisadvisorpreamble#1	{\xdef\@thesisadvisorpreamble	{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% @BEGINDOCUMENT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
  \ifthesis@english
    \selectlanguage{english}
  \else
    \selectlanguage{ngerman}
  \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Maketitle
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\maketitle{
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%  TITLEPAGE                          %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \thispagestyle{empty}
  \@maketitle%
  \eject
  \@AfterTitlePages
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%  FRONT MATTERS                      %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \setcounter{tocdepth}{2}
  \FrontMatter
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%  MAIN MATTERS                       %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \mainmatter
  \setcounter{secnumdepth}{2}
  %\setsecnumdepth{subsection}% alternative B
  \aliaspagestyle{chapter}{\chapterheadings}
  \pagestyle{\documentheadings}
}

\def\@maketitle{
  \newlength{\thesisparskip}
  \setlength\thesisparskip{\parskip}
  \setlength\parskip{0pt}
  \wrapTUINFDA%
  \@maketitlepage
  \setlength\parskip{\thesisparskip}
}

\def\@maketitlepage{
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%  DEFAULT TITLEPAGE                  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \ifthesis@defaulttitlepages
    \ifthesis@masterthesis
      \include{chapters/titlepages/titlepage}
    \fi
    \whichlanguage%
      {\include{chapters/titlepages/titlepage_inso_en}}
      {\include{chapters/titlepages/titlepage_inso}}
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%  TITLEPAGE                          %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \else
    \ifthesis@tutitlepageDE
      \include{chapters/titlepages/titlepage}
    \fi
    \ifthesis@tutitlepageEN 
      \include{chapters/titlepages/titlepage_en}
    \fi
    \ifthesis@insotitlepageDE 
      \include{chapters/titlepages/titlepage_inso}
    \fi
    \ifthesis@insotitlepageEN 
      \include{chapters/titlepages/titlepage_inso_en}
    \fi
  \fi
  \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TUINFDA wrapping
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\gdef\wrapTUINFDA{
  \xdef\tuinfthesistitle{\@thesistitle}
  \xdef\tuinfthesissubtitle{\@thesissubtitle}
  \xdef\tuinfthesisdate{\@thesisdate}
  \xdef\tuinfthesistype{\@thesistype} 
  \xdef\tuinfthesistypeen{\@thesistypeen}
  \xdef\tuinfthesisdegree{\@thesisdegree} 
  \xdef\tuinfthesisdegreeen{\@thesisdegreeen}
  \xdef\tuinfthesiscurriculum{\@thesiscurriculum} 
  \xdef\tuinfthesiscurriculumen{\@thesiscurriculumen}
  \xdef\tuinfthesisverfassung{\@thesisauthorpreamble}
  \xdef\tuinfthesisauthor{\@thesisauthor}
  \xdef\tuinfthesisauthoraddress{\@thesisauthoraddress}
  \xdef\tuinfthesismatrikelno{\@thesismatrikelno}
  \xdef\tuinfthesisbetreuung{\@thesisadvisorpreamble}
  \xdef\tuinfthesisbetreins{\@thesisadvisor@one}
  \xdef\tuinfthesisbetrzwei{\@thesisadvisor@two}
  \xdef\tuinfthesisbetrdrei{\@thesisadvisor@three}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FRONT AND BACK MATTERS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\gdef\FrontMatter{
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   TO DO NOTES                       %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@maketodonotes
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   ERKLAERUNG DER SELBSTAENDIGKEIT   %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@makedeclaration
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   ACKNOWLEGEMENTS                   %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@makeacknowledgements
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   ABSTRACT                          %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@makeabstract
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   TABLE OF CONTENTS                 %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \tableofcontents
  \cleardoublepage
}

\gdef\BackMatter{
  \@setappendixmarker
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   LIST OF FIGURES                   %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@makelistoffigures
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   LIST OF TABLES                    %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@makelistoftables
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   LIST OF ALGORITHM                 %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@makelistofalgorithm
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   ABBREVIATIONS                     %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@makeabbreviations
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%   BIBLIOGRAPHY                      %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \@makebibliography
}

\gdef\AfterTitlePages#1{\gdef\@AfterTitlePages{#1}}
\gdef\@AfterTitlePages{\relax}
\gdef\AfterDeclaration#1{\gdef\@AfterDeclaration{#1}}
\gdef\@AfterDeclaration{\relax}
\gdef\AfterAcknowledgements#1{\gdef\@AfterAcknowledgements{#1}}
\gdef\@AfterAcknowledgements{\relax}
\gdef\AfterAbstract#1{\gdef\@AfterAbstract{#1}}
\gdef\@AfterAbstract{\relax}
\gdef\AfterListOfFigures#1{\gdef\@AfterListOfFigures{#1}}
\gdef\@AfterListOfFigures{\relax}
\gdef\AfterListOfTables#1{\gdef\@AfterListOfTables{#1}}
\gdef\@AfterListOfTables{\relax}
\gdef\AfterListOfAlgorithms#1{\gdef\@AfterListOfAlgorithms{#1}}
\gdef\@AfterListOfAlgorithms{\relax}
\gdef\AfterAbbreviations#1{\gdef\@AfterAbbreviations{#1}}
\gdef\@AfterAbbreviations{\relax}
\gdef\AfterOnlineBibliography#1{\gdef\@AfterOnlineBibliography{#1}}
\gdef\@AfterOnlineBibliography{\relax}
\gdef\AfterBibliography#1{\gdef\@AfterBibliography{#1}}
\gdef\@AfterBibliography{\relax}

\def\@maketodonotes{
  \ifthesis@todonotes
    \listoftodos
    \thispagestyle{plain}
    \cleardoublepage
  \fi
}
\def\@makedeclaration{
  \ifthesis@declaration
    \input{chapters/abstract/declaration}
    \cleardoublepage
    \@AfterDeclaration
    \cleardoublepage
  \fi
}
\def\@makeacknowledgements{
  \ifthesis@acknowledgements
    \input{chapters/abstract/acknowledgements}
    \cleardoublepage
    \@AfterAcknowledgements
    \cleardoublepage
  \fi
}
\def\@makeabstract{
  \input{chapters/abstract/abstract}
  \cleardoublepage
  \@AfterAbstract
  \cleardoublepage
}
\def\@makelistoffigures{
  \ifthesis@listoffigures
    \clearpage
    \listoffigures
    \@AfterListOfFigures
  \fi
}
\def\@makelistoftables{
  \ifthesis@listoftables
    \clearpage
    \listoftables
    \@AfterListOfTables
  \fi
}
\def\@makelistofalgorithm{
  \ifthesis@listofalgorithms
    \clearpage
    \listofalgorithms
    \addcontentsline{toc}{chapter}{\algorithmslabel}
    \@AfterListOfAlgorithms
  \fi
}
\def\@makeabbreviations{
  \ifthesis@listofabbrev
    \clearpage
    \include{abbrev/abbreviations}
    \@AfterAbbreviations
  \fi
}
\def\@makebibliography{
  \ifthesis@webreferences
    \clearpage
    \printbibliography[type=online,title={\onlinebibliographylabel}]
    \@AfterOnlineBibliography
    \clearpage
    \printbibliography[nottype=online]
    \@AfterBibliography
  \else
    \clearpage
    \printbibliography
    \@AfterOnlineBibliography
    \@AfterBibliography
  \fi
}

\def\@setappendixmarker{
  \xdef\leftmark{Appendix}
  \xdef\rightmark{}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% STYLE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\parindent{0px}
%\setfont{sectioning}{\sffamily\mdseries}
\chapterstyle{section}
\renewcommand{\chapterheadstart}{\vspace*{0pt}}
\urlstyle{same}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LOGO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DEFAULT SETTINGS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\skip\footins}{1.8\baselineskip}
\setlength\footnotemargin{1em}
\setlength\parskip{0.4\baselineskip}
\graphicspath{{figures/titlepage/},{figures}}
\geometry{a4paper, top=2.5cm, bottom=2.5cm}

% settings of hyperlinks
\hypersetup{
  linkcolor=black,
  pagecolor=black,
  urlcolor=black,
  citecolor=black,
  breaklinks=true,
  colorlinks=true,
  frenchlinks=true,
  bookmarks=true
}

% listing settings
\lstset{
  float,
  basicstyle=\small, 
  tabsize=2, 
  numbers=left, 
  numberstyle=\tiny, 
  numbersep=5pt, 
  frame=lines, 
  breaklines=false,
  prebreak={\mbox{\ensuremath{\hookleftarrow}}},
  postbreak={\space\space},
  breakindent=0pt,
  captionpos=b
}

% Verhinderung von "Schusterjungen"
% einzelne Absatzzeilen auf der Seite unten
\clubpenalty = 10000

% Verhinderung von "Hurenkindern"
% einzelne Zeilen eines Absatzes am Kopf der Seite
\widowpenalty = 10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Headers
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancyhf	{} 			% alle Felder löschen
\renewcommand	{\headrulewidth}{0.4pt} % unterdruecken der Linie
\renewcommand	{\footrulewidth}{0.4pt} % unterdruecken der Linie
% \setlength	\headsep{2cm}		% header skip
\fancyhead [L]	{\nouppercase\leftmark}
\fancyhead [R]	{\nouppercase{\rightmark}}
\fancyfoot [L]	{\parbox[b]{0.7\linewidth}{\@shorttitle}} 
\fancyfoot [R]	{\pagelabel}{}

\makepagestyle{insochapter}
\makeevenhead{insochapter}{}{}{}
\makeoddhead{insochapter}{}{}{}
\makeevenfoot{insochapter}{}{}{\rule{\textwidth}{\footrulewidth}\\\pagelabel} 
\makeoddfoot{insochapter}{}{}{\rule{\textwidth}{\footrulewidth}\\\pagelabel}

\newcommand{\chapterheadings}{fancy}
\newcommand{\documentheadings}{fancy}


\makeoddfoot{plain}{}{\thepage}{}
\makeevenfoot{plain}{}{\thepage}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Language specific 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\whichlanguage#1#2{% depending of the language the first english text or the second german text will be used
  \relax\iflanguage{english}{#1}{\iflanguage{ngerman}{#2}{\iflanguage{german}{#2}{#1}}}\relax
}

%\def\pagelabel{\whichlanguage{Page~\thepage~of~\pageref{LastPage}}{Seite~\thepage~von~\pageref{LastPage}}}
\def\pagelabel{\thepage\,/\,\pageref{LastPage}}

\def\onlinebibliographylabel{\whichlanguage{Online References}{Web Referenzen}}
\def\declarationlabel{\whichlanguage{Statement by Author}{Eidesstattliche Erkl\"arung}}
\def\acknowledgementslabel{\whichlanguage{Acknowledgements}{Danksagung}}
\def\abstractlabel{\whichlanguage{Abstract}{Kurzfassung}}
\def\abbreviationslabel{\whichlanguage{List of Abbreviations}{Abk\"urzungsverzeichnis}}
\def\algorithmslabel{\whichlanguage{List of Algorithms}{Liste der Algorithmen}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% RENEW COMMANDS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \let\babel@selectlanguage\selectlanguage
% \renewcommand{\selectlanguage}[1]{\todo[inline]{#1}\babel@selectlanguage{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Useful commands
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% EOF
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatother
\endinput
