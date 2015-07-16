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
    % own changes start 
%    \cleardoublepage
%    \vspace*{\fill} 
%    %\begin{center}
%    %\centering
%    \textit{The Kalman Filter in its various forms is clearly established as a fundamental tool for analyzing and solving a broad class of estimation problems.}\newline \newline
%    \textbf{\textit{Leonhard McGee and Stanley Schmidt, \newline Ames Research Center, NASA}}
%    \vspace*{\fill}
    % own changes end 
  \end{titlepage}%
  \cleardoublepage%
  \setcounter{footnote}{0}%
  \let\thanks\relax\let\maketitle\relax
  %\gdef\@thanks{}\gdef\@author{}\gdef\@title{}
  \makefrontmatter
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
  \@ifundefined{fancyhf}{}{\pagestyle{normal}}%
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

   \begin{acronym}[SEPSEP]
      \acro{sappz}[SappZ]{Sensorik-Applikationszentrum}
      \acro{uav}[UAV]{Unmanned Aerial Vehicle}
      \acroplural{uav}[UAVs]{Unmanned Aerial Vehicles}
      \acro{uas}[UAS]{Unmanned Aerial System}
      \acro{gui}[GUI]{Graphical User Interface}
      \acro{qr}[QR]{Quick Response}
      \acro{cbrne}[CBRNE]{Chemical, Biological, Radiological, Nuclear and High-Yield Explosive}
      \acro{luftvg}[LuftVG]{Luftfahrgesetz}
      \acro{dlr}[DLR]{Deutsches Luft und Raumfahrtzentrum}
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
%\makeacronym
}
