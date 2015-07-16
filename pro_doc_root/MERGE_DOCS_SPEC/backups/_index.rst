.. Masterarbeit documentation master file, created by sphinx-quickstart on Sun Apr  5 21:10:44 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. role:: raw-latex(raw)
   :format: latex

.. role:: inline-math
   :format: math

.. role:: custom(only)

   :format: html 


.. Mit extension bibsphinx wird durch die role :bibcite: bibtex unterstützt
   hierfür wurde das Makefile angepasst, damit bibtex übersetzt wird. Es ist
   insgesamt ein "diriy hack". 
   Wird das Dokument übersetzt werden die Zitate mit der extension bibliography
   verwaltet. Für alles andere werden raw latex-befehle verwendet. Only:: latex
   -> .. role:: cite(bibite) führt dazu, dass wenn latex übersetzt wird bibcite
   anstatt cite verwendet wird. Dabei wird im latexdokument mit \cite{bla} zitiert.
   Damit dies auch in den Unterverzeichnissen funktioniert, muss hier ein conditional
   verwendet werden (wenn release in conf.py einen bestimmten Wert hat ... dann
   füge den Befehl .. only:: latex->..role:: cite(bibite) ein.
   Die jeweiligen bibliographies müssen über raw-latex-Befehle eingefügt werden.

.. only:: latex

   .. role:: cite(bibcite) 


.. .. raw:: latex

..   \dosecttoc[1]


Welcome to MergeDocs's documentation!
=====================================

.. raw:: latex

   %setcounter for all subsequent \localtableofcontents
   \setcounter{tocdepth}{2}


Einleitung
==========

.. raw:: latex

   \epigraph{Eine Flugmaschine zu erfinden bedeutet wenig; sie zu bauen schon mehr; aber sie zu fliegen, das ist das Entscheidende.}
   {
   
   \renewcommand*{\thempfootnote}{\arabic{mpfootnote}}
   \textit{\textbf{Ferdinand Ferber}}
   \footnote[1]{Jene Worte werden häufig fälschlicherweise dem Luftfahrtpionier Otto von Lilienthal zugschrieben. Diese Fehlannahme stellt Ferdinand Ferber in seinem Werk \flqq l’Aviation, ses débuts, son développement\frqq 1908 richtig.}}
   
   \vspace{2cm}
   \begin{bibunit} 

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. :cite:`german_law`

.. .. raw:: latex

..   \rightmark
   \chapter{dreck}
   \newpage
   bla bla \leftmark das alte
   \newpage
   \renewcommand{\contentsname}{Whatever}
   \localtableofcontents
   \rfoot{\lastrightmark}

.. raw:: latex
   
   %\renewcommand{\contentsname}{\leftmark} 
   \localtableofcontents
   

.. TODO: einleitung hier ins Verzeichnis verschieben, oder eigenes Projekt anlegen
.. TODO: bei rechtliches qr-code zu online referenz


.. toctree::
   introduction


.. raw:: latex

   % table of contents item for literature 
   \addcontentsline{toc}{section}{\bibname}   
   \putbib[refs]

   \end{bibunit}


Hardwareentwicklung der Flightcontrol
=====================================

.. raw:: latex

   \epigraph{Die Natur entfaltet gerade in diesen Be- wegungsformen des Vogelflügels eine Harmonie der Kräftewirkungen, welche uns so mit Bewunderung erfüllen muss, dass es uns nur nutzlos erscheinen kann, wenn auf anderen Wegen versucht wird zu erreichen, was die Natur auf ihrem Wege so schön und einfach erzielt.}
   {\textit{\textbf{Otto von Lilienthal,\\ Der Vogelflug als Grundlage der Fliegekunst,\\ Berlin 1889}}}
   
   \vspace{2cm}
   \begin{bibunit}


Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.


.. raw:: latex

   \localtableofcontents


.. toctree::
   included_projects/FC_REV_A_SPEC/content

.. raw:: latex

   \section*{Anhang}


.. toctree::
   included_projects/FC_REV_A_SPEC/appendix

.. only:: not latex

   .. bibliography:: included_projects/FC_REV_A_SPEC/FC_REV_A_SPEC.bib
 

.. raw:: latex

   % table of contents item for literature 
   \addcontentsline{toc}{section}{\bibname}   
   \putbib[FC_REV_A_SPEC]

   \end{bibunit}


Simulation
==========

.. raw:: latex

   \epigraph{Ich ermahne Dich, dass Du auf der mittleren Bahn fliegst, damit nicht die Welle Deine Federn Beschwert, wenn Du zu tief fliegst und nicht das Feuer sie versenkt, wenn zu hoch fliegst. Fliege zwischen beiden!}{
   
   \renewcommand*{\thempfootnote}{\arabic{mpfootnote}} 
   \textit{\textbf{Deadalus warnt seinen Sohn Ikarus\\ (griechische Mythologie)}}\footnote{Einer Übersetzung aus dem Lateinischem, unbekannten Ursprungs, der Version der griechischen Sage \flqq Deadalus und Ikarus\frqq  aus der Schriftenreihe \flqq Metamorphoses\frqq des römsichen Dichters Ovid entnommen.}}
   
   \vspace{2cm}
   \begin{bibunit}

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.


.. raw:: latex

   \localtableofcontents


.. toctree::
   included_projects/DEADALUS_SIM_SPEC/content


.. raw:: latex

   \newpage
   \begin{appendix}

   %\addtocontents{toc}{\protect\setcounter{tocdepth}{1}}

   \renewcommand{\thesection}{\Alph{section}}
   %\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
   \addcontentsline{toc}{section}{Anhang}
   \section*{Anhang}
   %\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}


.. toctree::
   included_projects/DEADALUS_SIM_SPEC/appendix


.. raw:: latex
    
   \end{appendix}
   %\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
   \setcounter{chapter}{4} % TODO store chaptercoutner
                           % evtl renew command appendix


.. only:: not latex

   .. bibliography:: included_projects/DEADALUS_SIM_SPEC/DEADALUS_SIM_SPEC.bib


.. raw:: latex

   % table of contents item for literature 
   \addcontentsline{toc}{section}{\bibname}   
   \putbib[DEADALUS_SIM_SPEC]

   \end{bibunit}


Sensordatenfusion
=================

.. raw:: latex

   \epigraph{The Kalman Filter in its various forms is clearly established as a fundamental tool for analyzing and solving a broad class of estimation problems.}
   {\textit{\textbf{Leonhard McGee and Stanley Schmidt, \\ Ames Research Center, NASA}}}
   
   \vspace{2cm}
   \begin{bibunit}

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

.. raw:: latex
 
   \localtableofcontents


.. toctree::
   included_projects/SENSOR_FUSION_SPEC/content


.. raw:: latex

   \newpage
   \begin{appendix}

   %\addtocontents{toc}{\protect\setcounter{tocdepth}{1}}

   \renewcommand{\thesection}{\Alph{section}}
   %\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
   \addcontentsline{toc}{section}{Anhang}
   \section*{Anhang}
   %\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}


.. toctree::
   included_projects/SENSOR_FUSION_SPEC/appendix


.. raw:: latex
    
   \end{appendix}
   %\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
   \setcounter{chapter}{4} % TODO store chaptercoutner
                           % evtl renew command appendix

 
.. only:: not latex
 
   .. bibliography:: ../../SensorFusion/SENSOR_FUSION_SPEC/SENSOR_FUSION_SPEC.bib


.. raw:: latex

   % table of contents item for literature 
   \addcontentsline{toc}{section}{\bibname}   
   \putbib[SENSOR_FUSION_SPEC]
   
   \end{bibunit}


Protokolle
==========

.. raw:: latex

   \epigraph{The human voice cannot mount up into these boundless solitudes.}
   {\textit{\textbf{Alberto Santos-Dumont,\\ My Airships - The Story of my Life\\ London, 1904}}}
   
   \vspace{2cm}
   \begin{bibunit}


Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.


.. raw:: latex

   \localtableofcontents


.. toctree::
   included_projects/GANYMED_TOOLS_SPEC/content


.. only:: not latex
 
   .. bibliography:: included_projects/GANYMED_TOOLS_SPEC/GANYMED_TOOLS_SPEC.bib


.. raw:: latex

   % table of contents item for literature 
   \addcontentsline{toc}{section}{\bibname}   
   \putbib[GANYMED_TOOLS_SPEC]
   \end{bibunit}


Schluss
=======

.. toctree::
   
   conclusion   


.. raw:: latex

   \begin{appendix}
   \addcontentsline{toc}{section}{Anhang}
   \renewcommand\thesection{\Alph{section}}
   \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}


.. toctree::
   included_projects/GANYMED_TOOLS_SPEC/appendix


.. raw:: latex

   \end{appendix}
   %\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}



.. .. only:: not latex

..   .. bibliography:: FC_REV_A_SPEC,SENSOR_FUSION_SPEC,GANYMED_TOOLS_SPEC,DEADALUS_SIM_SPEC,MERGE_DOCS_SPEC


.. raw:: latex

   %\bibliographystyle{plain}
   %\bibliography{FC_REV_A_SPEC,SENSOR_FUSION_SPEC,GANYMED_TOOLS_SPEC,DEADALUS_SIM_SPEC,MERGE_DOCS_SPEC}
   %\bibliography{FC_REV_A_SPEC, SENSOR_FUSION_SPEC, GANYMED_TOOLS_SPEC, DEADALUS_SIM_SPEC}
   \setcounter{tocdepth}{0}

