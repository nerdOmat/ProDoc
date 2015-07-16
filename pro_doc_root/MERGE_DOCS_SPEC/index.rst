.. Masterarbeit documentation master file, created by sphinx-quickstart on Sun Apr  5 21:10:44 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. role:: raw-latex(raw)
   :format: latex

.. role:: inline-math
   :format: math

.. role:: custom(only)

   :format: html 


.. Mit extension bibsphinx wird durch die role :bibcite: bibtex unterstützt.
   Hierfür wurde das Makefile angepasst, damit bibtex übersetzt wird. Es ist
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


Welcome to MergeDocs's documentation!
=====================================

.. raw:: latex

   \setcounter{tocdepth}{2}


Einleitung
==========

.. toctree::
   included_projects/test/TEST_SPEC/content
