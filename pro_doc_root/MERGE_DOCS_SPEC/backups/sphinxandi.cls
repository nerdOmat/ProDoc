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
\renewcommand{\maketitle}{%
  \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \rule{\textwidth}{1pt}%
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
    \begin{flushright}%
      \sphinxlogo%
      {\rm\Huge\py@HeaderFamily \@title \par}%
      {\em\LARGE\py@HeaderFamily \py@release\releaseinfo \par}
      \vfill
      {\LARGE\py@HeaderFamily
        \begin{tabular}[t]{c}
          \@author
        \end{tabular}
        \par}
      \vfill\vfill
      {\large
       \@date \par
       \vfill
       \py@authoraddress \par
      }%
    \end{flushright}%\par
    \@thanks
    % own changings start 
    \cleardoublepage
    \vspace*{\fill} 
    %\begin{center}
    %\centering
	\textit{Ich widme diese Arbeit meiner Mutter und meinen Gro\ss eltern, die stets Verst\"andnis f\"ur meine h\"aufige Abwenenheit hatten und die stolz darauf sind, dass ich den Weg meines Vaters einschlug.}\newline \newline
    %\textbf{\textit{evtl. mit Widmung \newline Ingrid Gschossmann}}
    %\begin{center}
    %\includegraphics[width=238px]{../../images/deadalus.pdf}
    %\end{center}
    %\begin{tabular}{m{8.5cm}m{7.5cm}}
    %\includegraphics[width=238px]{../../images/deadalus.pdf} & Diese Worte richtet Daedalus an seinen Sohn Ikarus bevor sie die Flucht von der Insel Kreta antreten. Daedalos hatte dazu f\"ur sich und den Sohn von F\"aden und Wachs zusammengehaltene Fl\"ugel angefertigt. Da der Sohn im \"Ubermut zu hoch fliegt, schmilzt das Wachs und Ikarus st\"urzt in die Tiefe. \newline Bis heute pr\"agt die Figure des Deadalus, aus der griechischen Sagenwelt "das ambivalente Bild der technischen Gesellschaft von Machbarkeit als technisch-rationaler Ausf\"uhrung nach Plan einerseits und als kreativer Sch\"opfung andererseits." Gerade im Bereich der Luftfahrt befl\"ugelte die Sage von Deadalus und Ikarus die Fantasie der Pioniere. \newline Sowie die Meisterschaft des Deadalus unter Umst\"anden, als M\"oglichkeit zum Ausbruch vor der Willk\"ur der G\"otter verstanden werden kann, so kann der Sturz des Ikarus durch Ungehorsam und Ignoranz als Mahnung gesehen werden, dass sich die Geschicke der Natur und das darin g\"ottliche unter Umst\"anden technischer Rafinesse nicht beugen und deren Verhalten an den Grenzen ausgelotet und gemessen sein will.
    %\end{tabular}
    \vspace*{\fill}
    % own changings end 
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

\usepackage{etoc}
\let\py@OldLocalTableofcontents=\localtableofcontents
\renewcommand{\localtableofcontents}{%
  %\renewcommand{\contentsname}[1]{\markboth{\chaptername\ \thechapter.\ #1}{}}
  %\renewcommand{\contentsname}{\leftmark}
  \pagebreak%
  \pagestyle{plain}%
  {%
    \parskip = 0mm%
    \py@OldLocalTableofcontents%
    \if@openright%
      \ifodd\value{page}%
        \typeout{Adding blank page after the table of contents.}%
        \pagebreak\hspace{0pt}%
      \fi%
    \fi%
    \cleardoublepage%
  }%
  \renewcommand{\thepage}{\arabic{page}}%
  \@ifundefined{fancyhf}{}{\pagestyle{normal}}%
}

% This wraps the \tableofcontents macro with all the magic to get the spacing
% right and have the right number of pages if the 'openright' option has been
% used.  This eliminates a fair amount of crud in the individual document files.
%
\let\py@OldTableofcontents=\tableofcontents
\renewcommand{\tableofcontents}{%
  \setcounter{page}{1}%
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

%\let\stdthebibliography\thebibliography
%\renewcommand{\thebibliography}{%
%\let\chapter\section
%\stdthebibliography}
