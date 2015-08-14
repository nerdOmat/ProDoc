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
      {\rm\Large\textbf{Forschungsbericht I} \par}
      {\vspace{0.8 cm}\par}
      {\rm\Large \@title \par}%
%      {\em\LARGE\py@HeaderFamily \py@release\releaseinfo \par}
      \vspace{4.0 cm}\par
      {\rm\textit{\normalsize Ausgef\"uhrt am}\\} 
      {\rm\textit{\normalsize Sensorik-Applikationszentrum}\par}
      \includegraphics[width=50px]{sappz.pdf}\par
      {\rm\textit{\normalsize unter der Anleitung von}\\}
      {\rm\textit{\normalsize Prof. Dr. rer. nat. Rudolf Bierl, Dipl.-Phys.}\par}
      {\rm\textit{\normalsize durch}\\}
      {\rm\textit{\normalsize Dipl.-Ing. (FH) Andreas Gscho\ss mann}\\} 
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
    %{\rm\normalsize Regensburg, den \@date}
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


    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
    \else
    \fi


  \addcontentsline{toc}{section}{Abstract}
  \begin{center}
  \Large \textbf{Abstract}
  \end{center}
This thesis is part of the research on Unmanned Aerial Systems at the Sensorik-Applikationszentrum (\mbox{SappZ}) at the University of Applied Sciences Regensburg. One of the main purposes of this research is to meet the great potential for Unmanned Aerial Systems (UAS) to augmented desaster relieve. These drones will be used by local fire and rescue departments. Optimal design leads to Unmanned Aerial Vehicles (UAV) that hover for long periods of time and deliver HD video back to the ground where immediate decisions can be made by command personnel. Further more, since being used mainly in tense mission scenarios, the cognitive activity of controlling the drone has to be facile and effortless. A quadrotor can serve these requirements.
Since command controls are explored to facilitate the flight for the pilot it is important to have a flightcontrol which allows full access to its flight algorithms. To that purpose, a flightcontrol for quadrotors is developed.

Being a research center for sensor technology another application for UAVs at SappZ is using UAVs as platforms to carry a wide range of different sensors.

This thesis covers four basic tasks on the way towards a flexible hard- and software control for a quadrotor. The flightcontrol electronics hardware was developed. It is capable of both, running flight algorithms in real time and serving sensor interfaces and drivers on a high level Linux system. A GUI-based software simulation for UAVs was developed in order to test flight algorithms for in- and outdoor scenarios. Algorithms for attitude and position estimation, based on Kalman filtering, were developed. This has been solved with great emphasis on numerical stability and runtime. Finally, a suitable data structure, shared by ground tools and the UAV, based on available Open Source protocols for communication was found.

%containing a brief introduction to practical kalman filtering, taking numerical issues and run time considerations into account.

%  \vspace*{\fill}
%  \@abstract
  \clearpage
  \pagebreak
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
Zun\"achst m\"ochte ich allen Kollegen des Sensorik-Applikationszentrums danken, die mir stets mit Rat und Tat zur Seite standen. Eine orientalische Weisheit besagt, wer alleine arbeitet addiert, wer zusammenarbeitet multipliziert. Ich bin dankbar jene Erfahrung in einer so gedeihlichen Gesellschaft ehrbarer Menschen machen zu d\"urfen. Sie ist Keim so mancher Idee, die zu sch\"opferischem Tun, nicht nur fachlicher Natur anregt.

Ein herzliches Dankesch\"on gilt Thorsten Reitmeier, der mit leidenschaftlichem Einsatz und ohne Selbstzweck seine langj\"ahrige Erfahrung und sein feines Gesp\"ur im Bereich Regelungstechnik eingebracht hat und hierf\"ur bereit war seine Freizeit zu opfern. Auch Wolfgang H\"ogele m\"ochte ich f\"ur die fachlichen Ratschl\"age und fruchtbaren Diskussionen zum Thema Kalman-Filter danken. Er stand jeder Fachdiskussion zur praktischen Anwendung des Kalman-Filters mit Freude offen und es machte Spass, mit ihm verschiedene Aspekte der Thematik zu entschleiern.

Au\ss erdem bedanke ich mich bei Martin Hofmann und Thomas R\"uck f\"ur die moralische Unterst\"utzung und die aufmunternden Worte in unkreativen Momenten. Auch Ignaz Laepple m\"ochte ich f\"ur seine kritische und ehrliche Meinung, die mich h\"aufig zur Reflexion, sowie zur Neuordnung meiner Gedanken angeregt hat, danken.

Auch bedanke ich mich bei Rafaela Gonetz, Matthias Strobl, Elisabeth Keck, Ignaz Laepple, Tina Bradschi, Simon Jobst und Florian Olbrich f\"ur das Korrekturlesen. Ich werde mich mit einem Bier revanchieren.

Bei Waldemar Sessler und Johannes Fischer bedanke ich mich f\"ur die kameradschaftliche Zusammenarbeit. Im Zweifel konntet Ihr mir immer einen Ratschlag geben und es macht Spass, mit Euch zu arbeiten.

Mein besonderer Dank gilt Prof. Dr. Rudolf Bierl, der uns vertraut, uns erm\"oglicht an dem Projekt zu arbeiten und uns die Freiheit gibt, unsere Visionen umzusetzen.  

Zuletzt m\"ochte ich meiner Familie f\"ur die Unterst\"utzung in allen Lebenslagen danken.
%    \@acknowledgements
    \clearpage
    \pagebreak
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
    \pagebreak
%  \fi
}
\def\makedeclaration{
%  \ifx\@acknowledgements\undefined
%  \else
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
    \else
    \fi

    \addcontentsline{toc}{section}{Erkl\"arung}
    \begin{center}
      \Large \textbf{Erkl\"arung}
    \end{center}

%\textbf{Erkl\"arung}
    \vspace{2cm}
1. Mir ist bekannt, dass dieses Exemplar der Masterarbeit als Pr\"ufungsleistung in das Eigentum des Freistaates Bayern \"ubergeht.

2. Ich erkl\"are hiermit, dass ich diese Masterarbeit selbstst\"andig verfasst, noch nicht anderweitig f\"ur andere Pr\"ufungszwecke vorlege, keine anderen als die angegebenen Quellen und Hilfsmittel benutzt sowie w\"ortliche und sinngem\"a\ss e Zitate als solche gekennzeichnet habe.

    \vspace{3cm}
%Regensburg,\\ den \@date

%    \begin{tabular}{@{}l@{}}\hline
%    \textit{\textbf{Unterschrift}} \hspace{5cm}
%    \end{tabular}

		Regensburg, den\\
    \textit{\textbf{Ort, Datum}}\hspace{0.7cm}
    \begin{tabular}{@{}l@{}}\hline
    \hspace{2cm}
    \end{tabular}
    \hspace{0.3cm}
    \begin{tabular}{@{}l@{}}\hline
    \textit{\textbf{Unterschrift}} \hspace{4cm}
    \end{tabular}
    \pagebreak

%\clearpage
}

%\let\stdthebibliography\thebibliography
%\renewcommand{\thebibliography}{%
%\let\chapter\section
%\stdthebibliography}

\def\makeacronym{
    \ifdefined\phantomsection
     % makes hyperref recognize this section properly for pdf links
     \phantomsection
    \else
    \fi

    \addcontentsline{toc}{section}{Abk\"urzungsverzeichnis}
    \begin{center}
      \Large \textbf{Abk\"urzungsverzeichnis}
    \end{center}
   
   \vspace{1cm}

   %TODO: Sphinx Abkürzungsmethode finden 
   \begin{acronym}[SEPSEPSEP]
      \acro{sappz}[SappZ]{Sensorik-Applikationszentrum}
      \acro{uav}[UAV]{Unmanned Aerial Vehicle}
      \acroplural{uav}[UAVs]{Unmanned Aerial Vehicles}
      \acro{uas}[UAS]{Unmanned Aerial System}
      \acro{gui}[GUI]{Graphical User Interface}
      \acro{qr}[QR]{Quick Response}
      \acro{cbrne}[CBRNE]{Chemical, Biological, Radiological, Nuclear and High-Yield Explosive}
      \acro{luftvg}[LuftVG]{Luftfahrgesetz}
      \acro{dlr}[DLR]{Deutsches Luft- und Raumfahrtzentrum}
      \acro{pid}[PID]{Proportional Integral Derivative}
      \acro{gps}[GPS]{Global Positioning System}
      \acro{faa}[FAA]{Federal Aviation Administration}
      \acro{nas}[NAS]{National Airspace System}
      \acro{rpas}[RPAS]{Remotely Piloted Aircraft Systems}
      \acro{sesar}[SESAR]{Single European Sky ATM Research}
      \acro{atm}[ATM]{Airtraffic Control}
      \acro{i2c}[I2C]{Inter IC Bus}
      \acro{spi}[SPI]{Serial Peripheral Interface}
      \acro{uart}[UART]{Universal Asynchronous Receiver Transceiver}
      \acro{usb}[USB]{Universal Serial Bus}
      \acro{risc}[RISC]{Reduced Instruction Set Computer}
      \acro{arm}[ARM]{Acorn RISC}
      \acro{dsp}[DSP]{Digitaler Signal Prozessor}
      \acro{imu}[IMU]{Inertial Measurement Unit}
      \acro{ic}[IC]{Integrated Circuit}
      \acroplural{ic}[ICs]{Integrated Circuits}
      \acro{eoma}[EOMA]{Embedded Open Modular Architecture}
      \acro{ppm}[PPM]{Puls-Position Modulation}
      \acro{ssh}[SSH]{Secure Shell}
      \acro{otg}[OTG]{On-The-Go}
      \acro{gpio}[GPIO]{General Purpose I/O}
      \acroplural{gpio}[GPIOs]{General Purpose I/Os}
      \acro{gnd}[GND]{Ground}
      \acro{phy}[PHY]{Physical Layer}
      \acro{lsb}[LSB]{Least Significant Bit}
%\acro{mpu}[MPU]{}
      \acro{ddr}[DDR]{Double Data Rate}
      \acro{sdram}[SDRAM]{Synchronous Dynamic Random Access Memory}
      \acro{som}[SOM]{System on Module}
      \acroplural{som}[SOMs]{System on Modules}
%\acro{io}[IO]{}
      \acro{ttl}[TTL]{Transistor-Transistor-Logik}
      \acro{mdio}[MDIO]{MANAGEMENT DATA I/O}
      \acro{mii}[MII]{Media Independent Interface}
      \acro{sd}[SD]{Secure Digital}
      \acro{pmic}[PMIC]{Power Management IC}
      \acro{pll}[PLL]{Phase Locked Loop}
      \acroplural{pll}[PLLs]{Phase Locked Loops}
      \acro{rtc}[RTC]{Real Time Clock}
      \acro{esd}[ESD]{Electro Static Discharge}
      \acro{led}[LED]{Light Emitting Diode}
      \acroplural{led}[LEDs]{Light Emitting Diodes}
%\acro{tdi}[TDI]{}
%\acro{tms}[TMS]{}
%\acro{tdo}[TDO]{}
%\acro{ntrst}[nTRST]{}
%\acro{rtck}[RTCK]{}
      \acro{emu}[EMU]{Emulation}
      \acro{jtag}[JTAG]{Joint Test Action Group}
%\acro{d+}[D+]{}
%\acro{d-}[D-]{}
      \acro{ti}[TI]{Texas Instruments}
      \acro{mmc}[MMC]{Multimedia Card}
      \acro{wp}[WP]{Write Protect}
      \acro{cd}[CD]{Card Detect}
      \acro{pcb}[PCB]{Printed Circuit Board}
%\acro{top}[TOP]{}
      \acro{pwr}[pwt]{Power}
      \acro{cu}[CU]{Cuprum, Kupfer}
      \acro{lq}[LQ]{Linear Quadratic}
      \acro{kf}[KF]{Kalman-Filter}
      \acro{ekf}[EKF]{Extended Kalman-Filter}
      \acroplural{ekf}[EKFs]{Extended Klaman-Filters} % genitiv
      \acro{api}[API]{Application Programming Interface}
      \acroplural{api}[APIS]{Application Programming Interfaces}
      \acro{xml}[XML]{Extensible Markup Language}
      \acro{sdf}[SDF]{Simulator Description Format}
      \acro{tcp}[TCP]{Transmission Control Protocol}
      \acro{ip}[IP]{Internet Protocol}
      \acro{mt}[MT]{Momentum Theorie}
      \acro{3d}[3D]{Dreidimensional}
      \acro{sil}[SIL]{Software in the Loop}
      \acro{ieee}[IEEE]{Institute of Electrical and Electronics Engineers}
      \acro{gnss}[GNSS]{Globales Navigationssatellitensystem}
      \acroplural{gnss}[GNSS]{Globalen Navigationssatellitensystemen}
      \acro{ins}[INS]{Inertiale Sensorik}
      \acroplural{ins}[INS]{Inertialer Senorik} % nicht plural sondern genitiv
      \acro{ukf}[UKF]{Unscented Kalman-Filter}
      \acro{dkf}[DKF]{Distributed Kalman-Filter}
      \acro{marg}[MARG]{Magnetic, Angular Rate, Gravity}
      \acro{ahrs}[AHRS]{Attitude Heading Reference System}
      \acro{rtk}[RTK]{Realtime-Kinematics}
      \acro{dgps}[DGPS]{differential GPS}
      \acro{qzss}[QZSS]{Quasi Zenit Satelliten System}
      \acro{glonass}[GLONASS]{Globalnaja Nawigazionnaja Sputnikowaja Sistema}
      \acro{mems}[MEMS]{Microelectromechanical System}
%\acro{u-d}[U-D]{}
%\acro{b-frame}[b-frame]{körperfeste Koordinatensystemem}
%\acro{e-frame}[e-frame]{erdfesten Koordinatensystems}
%\acro{i-frame}[i-frame]{inertiale Koordinatensystem}
%\acro{n-frame}[n-frame]{Navigationskoordinatensystems}
      \acro{gpl}[GPL]{Gnu General Public Lizenz}
      \acro{sas}[SAS]{Stabilized Augmented Systems}
      \acro{json}[JSON]{JavaScript Object Notation}
      \acro{bsd}[BSD]{Berkeley Software Distribution}
      \acro{lgpl}[LGPL]{Lesser General Public License}
      \acro{i/o}[I/O]{Input/Output}
      \acro{mit}[MIT]{Massachusetts Institute of Technology}
      \acro{utf8}[UTF-8]{8-Bit Universal Character Set Transformation Format}
%\acro{ascii}[ASCII]{American Standard Code for Information Interchange}
      \acro{asf}[ASF]{Apache Software Foundation}
      \acro{can}[CAN]{Controller Area Network}
%\acro{sae}[SAE]{früher: Society of Automotive Engineers}
      \acro{gsm}[GSM]{Global System for Mobile Communications}
      \acro{usar}[USAR]{Urban Search and Rescue}
%\acro{ps3}[PS3]{PlayStation 3}

   \end{acronym}
}

\newcommand*{\makefrontmatter}{
%\bodyspacing
%\pagestyle{plain}%

\frontmatter
\pagestyle{plain}
%\@ifundefined{fancyhf}{}{\pagestyle{plain}}%
%\maketitlepage
%\setcounter{page}{0}
%\makecopyrightpage
%\makeabstract
%\makeacknowledgements
%\makededication
%\makedeclaration
%\makeacronym
%\listoffigures\addcontentsline{toc}{section}{Abbildungsverzeichnis}
%\listoftables\addcontentsline{toc}{section}{Tabellenverzeichnis}
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
