.. FC_REV_A_SPEC documentation master file, created by sphinx-quickstart on Sat Dec  7 14:45:15 2013.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. Conditional, falls master übersetzt:


Welcome to DEADALUS_SIM_REV_A_SPEC's documentation!
===================================================

.. ifconfig:: 'master' in release

   Der Text sollte nur im Maserdokument auftauchen ...


.. role:: raw-latex(raw)
   :format: latex

.. role:: inline-math
   :format: math

.. raw:: latex

   \setcounter{tocdepth}{0}

.. toctree::
   :maxdepth: 1 

   content

.. raw:: latex

   \begin{appendix}
   \addcontentsline{toc}{chapter}{Anhang}
   \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}} 

.. toctree::

   appendix

.. raw:: latex
   
   \end{appendix}
   \addtocontents{toc}{\protect\setcounter{tocdepth}{2}} 

.. bibliography:: PRODOC.bib
   :style: plain
