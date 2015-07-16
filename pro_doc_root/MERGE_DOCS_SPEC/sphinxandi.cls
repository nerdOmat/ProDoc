%
% sphinxmanual.cls for Sphinx (http://sphinx.pocoo.org/)
%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sphinxmanual}[2009/06/02 Document class (Sphinx manual)]

% chapters starting at odd pages (overridden by 'openany' document option)
\PassOptionsToClass{openright}{\sphinxdocclass}

% 'oneside' option overriding the 'twoside' default
\newif\if@oneside
\DeclareOption{oneside}{\@onesidetrue}
% Pass remaining document options to the parent class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\sphinxdocclass}}
\ProcessOptions\relax

% Defaults two-side document
\if@oneside
% nothing to do (oneside is the default)
\else
\PassOptionsToClass{twoside}{\sphinxdocclass}
\fi

\LoadClass{\sphinxdocclass}

% Set some sane defaults for section numbering depth and TOC depth.  You can
% reset these counters in your preamble.
%
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}

% Change the title page to look a bit better, and fit in with the fncychap
% ``Bjarne'' style a bit better.
%

% Change the title page to look a bit better, and fit in with the fncychap
% ``Bjarne'' style a bit better.
%
\renewcommand{\maketitle}{%
  \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
%    \rule{\textwidth}{1pt}%
    \ifsphinxpdfoutput
      \begingroup
      % These \defs are required to deal with multi-line authors; it
      % changes \\ to ', ' (comma-space), making it pass muster for
      % generating document info in the PDF file.
      \def\\{, }
      \def\and{and }
      \pdfinfo{
        /Author (\@author)
        /Title (\@title)
      }
      \endgroup
    \fi
    \begin{center}%
      {\ \par\vspace{0.22 cm}\par}
      %\vspace{5 cm}%\vfill\vfill
      \includegraphics[width=100px]{logo_oth.pdf}\par
      %{\rm\huge Ostbayrische Technische Hochschule Regensburg}
      %\sphinxlogo%
      {\vspace{2.4 cm}\par}
      {\rm\Large\textbf{Masterarbeit} \par}
      {\vspace{0.8 cm}\par}
      {\rm\Large \@title \par}%
%      {\em\LARGE\py@HeaderFamily \py@release\releaseinfo \par}
      \vspace{4.0 cm}\par
      {\rm\textit{\normalsize Ausgef\"uhrt am}\\} 
      {\rm\textit{\normalsize Sensorik-Applikationszentrum}\par}
      \includegraphics[width=50px]{sappz.pdf}\par
      {\rm\textit{\normalsize unter der Anleitung von}\\}
      {\rm\textit{\normalsize Prof. Dr. rer. nat. Rudolf Bierl, Dipl. Phys.}\par}
      {\rm\textit{\normalsize durch}\\}
      {\rm\textit{\normalsize Dipl.-Ing. (FH) Andreas Gschossmann}\\} 
      {\rm\textit{\normalsize Am Protzenweiher 7}\\}
      {\rm\textit{\normalsize 93059 Regensburg}\\}
%      {\LARGE\py@HeaderFamily
%        \begin{tabular}[t]{c}
%          \@author
%        \end{tabular}
%        \par}
      \vfill\vfill
      {\large
       %\@date \par
       \vfill
       \py@authoraddress \par
      }%
    \end{center}%\par
    \begin{center}
    {\rm\normalsize Regensburg den \@date}
    \end{center}
%    \@thanks
  \makefrontmatter

  \end{titlepage}%
  \cleardoublepage%
  \setcounter{footnote}{0}%
  \let\thanks\relax\let\maketitle\relax
  %\gdef\@thanks{}\gdef\@author{}\gdef\@title{}
}

% Catch the end of the {abstract} environment, but here make sure the abstract
% is followed by a blank page if the 'openright' option is used.
%
\let\py@OldEndAbstract=\endabstract
\renewcommand{\endabstract}{
  \if@openright
    \ifodd\value{page}
      \typeout{Adding blank page after the abstract.}
      \vfil\pagebreak
    \fi
  \fi
  \py@OldEndAbstract
}

%\let\py@OldEndDedications=\enddedications
%\renewcommand{\endabstract}{
%  \if@openright
%    \ifodd\value{page}
%      \typeout{Adding blank page after the abstract.}
%      \vfil\pagebreak
%    \fi
%  \fi
%  \py@OldEndDedications
%}

%\usepackage{etoc}
%\let\py@OldLocalTableofcontents=\localtableofcontents
%\renewcommand{\localtableofcontents}{%
%  %\renewcommand{\contentsname}[1]{\markboth{\chaptername\ \thechapter.\ #1}{}}
%  %\renewcommand{\contentsname}{\leftmark}
%  \pagebreak%
%  \pagestyle{plain}%
%  {%
%    \parskip = 0mm%
%    \py@OldLocalTableofcontents%
%    \if@openright%
%      \ifodd\value{page}%
%        \typeout{Adding blank page after the table of contents.}%
%        \pagebreak\hspace{0pt}%
%      \fi%
%    \fi%
%    \cleardoublepage%
%  }%
%  \renewcommand{\thepage}{\arabic{page}}%
%  \@ifundefined{fancyhf}{}{\pagestyle{normal}}%
%}

% This wraps the \tableofcontents macro with all the magic to get the spacing
% right and have the right number of pages if the 'openright' option has been
% used.  This eliminates a fair amount of crud in the individual document files.
%
\let\py@OldTableofcontents=\tableofcontents
\renewcommand{\tableofcontents}{%
%  \setcounter{page}{1}%
  \pagebreak%
  \pagestyle{plain}%
  {%
    \parskip = 0mm%
    \py@OldTableofcontents%
    \if@openright%
      \ifodd\value{page}%
        \typeout{Adding blank page after the table of contents.}%
        \pagebreak\hspace{0pt}%
      \fi%
    \fi%
    \cleardoublepage%
  }%
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
  \@ifundefined{fancyhf}{}{\pagestyle{normal}}%
%  \pagestyle{normal}
  \setcounter{page}{1}%
}

% This is needed to get the width of the section # area wide enough in the
% library reference.  Doing it here keeps it the same for all the manuals.
%
\renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.6em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{4.1em}{3.5em}}

% Fix the bibliography environment to add an entry to the Table of
% Contents.
% For a report document class this environment is a chapter.
\let\py@OldThebibliography=\thebibliography
\renewcommand{\thebibliography}[1]{
  \cleardoublepage
  \phantomsection
  \py@OldThebibliography{1}
  \addcontentsline{toc}{chapter}{\bibname}
}

\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\def\dedication#1{\gdef\@dedication{#1}}

\newcommand*{\makecopyrightpage}{
  \thispagestyle{empty}
  \vspace*{0in}
  \begin{center}
%    \copyright\ Copyright by bla bla, bla bla. All rights reserved. \\
    \vspace{1in}
    \begin{minipage}[c]{0.2\linewidth}
%      \hfill {\Huge \ccLogo~\ccAttribution}
    \end{minipage}
    \hspace{0.1cm}
    \begin{minipage}[c]{0.7\linewidth}
      Diese Arbeit wird online zur Verf\"ugung gestellt. Der Zugriff ist passwortgesch\"utzt. \\
      \\
      \href{http://hps.othr.de/gsa39665/thesis_andreas_gschossmann.pdf}{\includegraphics[width=11px]{download.pdf}} \url{http://hps.othr.de/gsa39665} \\
      \href{http://hps.othr.de/gsa39665/contact.html}{\includegraphics[width=11px]{mail.pdf}} andreas.gschossmann@oth-regensburg.de
    \end{minipage}
  \end{center}
  \clearpage}
\newcommand*{\makeabstract}{
  \newpage
  \topskip-200pt
%  \vspace*{\fill}

  \addcontentsline{toc}{section}{Abstract}
  \begin{center}
  \Large \textbf{Abstract}
  \end{center}
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
%  \vspace*{\fill}
%  \@abstract
  \clearpage
}
\newcommand*{\frontmatter}{
  \pagenumbering{roman}
}
\def\makeacknowledgements{
%  \ifx\@acknowledgements\undefined
%  \else
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
    \else
    \fi

    \addcontentsline{toc}{section}{Danksagung}
    \begin{center}
      \Large \textbf{Danksagung}
    \end{center}
Allen Kollegen des Sensorik-Applikationszentrums, die stets mit Rat und Tat zur Seite standen. 

Ein herzliches Dankeschön an Thorsten Reitmeier der mit leidenschaftlichen Einsatz und ohne selbstzweck seine langjährige Erfahrungen und sein feines Gespür im Bereich Regelungstechnik eingebracht hat und unterstützt hat. 

Außerdem bedanke ich mich bei Martin Hofmann und Thomas Rück für moralische Unterstützung und aufmunternden Worten in unkreativen Momenten. Außerdem danke ich Ignaz Läpple für seine kritische und ehrliche Meinung, die mich häufig zur Reflexion meiner Überlegungen angeregt haben.

Desweiteren bedanke ich mich bei Wolfgang Högele für die fachlichen Ratschläge und fruchtbaren Diskussionen zum Thema Kalman-Filter. Er stand jeder Fachdiskussion zur praktischen Anwendung des Kalman Filters mit freude offen und es machte immer Spass mit ihm die Thematik zu diskutieren.

Bei Waldemar Sessler bedanke ich mich für die angenehme Zusammenarbeit und die 


Ein besonderer Dank gilt Prof. Dr. Rudolf Bierl, der es uns erst ermöglicht an dem Projekt zu arbeiten und uns die Freiheit gibt, unsere Visionen umzusetzen.

Elisabeth Keck, Tina Bogner, Simon Jobst, ... für das Korrekturlesen.

Meiner Familie für die Unterstützung in allen Lebenslagen.

Wer alleine arbeitet, addiert; wer zusammen arbeitet, multipliziert. (arabische Weisheit)
%    \@acknowledgements
    \clearpage
%  \fi
  }
\def\makededication{
%  \ifx\@dedication\undefined
%  \else
    \vspace*{1.5in}
    \begin{flushright}
      \textit{Meinem Vater Nikolaus Gschossmann und seinem Freund und Kollegen Hans Horneck, die mir stets ein Vorbild waren und mich nicht nur fachlich inspiriert haben.}% Sie lehrten mich Geduld, Respekt und Durchhaltevermögen.}%Ich widme diese Arbeit meiner Mutter und meinen Gro\ss eltern, die stets Verst\"andnis f\"ur meine h\"aufige Abwenenheit hatten und die stolz darauf sind, dass ich den Weg meines Vaters einschlug.} 
%      \@dedication
    \end{flushright}
    \clearpage
%  \fi
}
%\let\stdthebibliography\thebibliography
%\renewcommand{\thebibliography}{%
%\let\chapter\section
%\stdthebibliography}

\newcommand*{\makefrontmatter}{
%\bodyspacing
%\pagestyle{plain}%

\frontmatter
\pagestyle{plain}
%\@ifundefined{fancyhf}{}{\pagestyle{plain}}%
%\maketitlepage
%\setcounter{page}{0}
\makecopyrightpage
\makeabstract
\makeacknowledgements
\makededication
\listoffigures\addcontentsline{toc}{section}{Abbildungsverzeichnis}
\listoftables\addcontentsline{toc}{section}{Tabellenverzeichnis}
%\maketoc
%\makelot\clearpage\makelof\clearpage\makelos
%\clearpage%\mainmatter
}

\renewcommand{\sectionmark}[1]{\markright{ \thesection{} #1}{}}
%\renewcommand{\chaptermark}[1]{\markboth{ \chaptername\ \thechapter ~ \ #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{ \chaptertitlename\ \thechapter ~ \ #1}{}}

%\usepackage{background}
%\usepackage{graphicx}
%\usepackage{fancyhdr}
%\usepackage{chapterthumb}

%\usepackage{tikz}
%\usetikzlibrary{backgrounds}

%\usepackage[pscoord]{eso-pic}
%\usepackage{atbegshi}

\usepackage{everypage}
