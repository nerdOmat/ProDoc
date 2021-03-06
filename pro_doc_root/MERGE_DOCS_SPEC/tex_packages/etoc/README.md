<!-- -->

    Source:  etoc.dtx (v1.08b 2015/03/18; doc of 2015/03/28)
    Author:  Jean-Francois Burnol
    Author:  Christine Roemer et al. (German tranlation)
    Info:    Completely customisable TOCs
    License: LPPL 1.3c or later
    Copyright (C) 2012-2015 Jean-Francois Burnol.
    Copyright (C) 2014-2015 Christine Roemer and collaborators for
    the translation into German of the documentation.
    <jfbu at free dot fr>    <Christine_Roemer at t-online dot de>

ABSTRACT
========

The etoc package gives to the user complete control on how the entries
of the table of contents should be constituted from the *name*,
*number*, and *page number* of each sectioning unit. This goes via the
definition of *line styles* for each sectioning level used in the
document. The package provides its own custom line styles. Simpler
ones are given as examples in the documentation. The simplest usage
will be to take advantage of the layout facilities of packages dealing
with list environments.

Regarding the *global toc display*, etoc provides pre-defined styles
based on a multi-column format, with, optionally, a ruled title or
framed contents.

The `\tableofcontents` command may be used arbitrarily many times and
it has a variant `\localtableofcontents` which prints tables of
contents 'local' to the current surrounding document unit. An
extension of the `\label/\ref` syntax allows to reproduce (with
another layout) a local table of contents defined somewhere else in
the document.

Via *depth tags*, one gets an even finer control for each table of
contents of which sectioning units it should, or not, display.

The formatting inherited (and possibly customized by other packages)
from the document class will be used when in compatibility mode.

The assignment of levels to the sectioning units can be changed at any
time, and etoc can thus be used in a quite general manner to create
custom ''lists of'', additionally to the tables of contents related to
the document sectioning units. No auxiliary file is used additionally
to the standard `.toc` file.

INSTALLATION
============

The simplest is to download

>  <http://mirrors.ctan.org/install/macros/latex/contrib/etoc.tds.zip>

and then run `unzip etoc.tds.zip -d <DEST>` where `<DEST>` is a
TDS-compliant repertory.

Else, to extract the package (.sty) and driver (.tex) files from etoc.dtx:

- if etoc.ins is present:   etex etoc.ins
- without etoc.ins:         etex etoc.dtx

It is also possible to run latex or pdflatex directly on etoc.dtx.

At least three ways to produce etoc.pdf (method (3) is preferred):

1. latex etoc.dtx (four times), then dvips, then ps2pdf
2. pdflatex etoc.dtx (four times)
3. latex etoc.tex (four times), then dvipdfmx

Method (3) produces the smallest pdf files.
Options can be set in etoc.tex:

- scrdoc class options (paper size, font size, ...)
- with or without source code,
- with dvipdfmx or with latex+dvips or pdflatex.

To produce etoc-DE.pdf (German documentation) run etex on etoc.ins
or etoc.dtx to produce etoc-DE.tex, then compile etoc-DE.tex with
latex (thrice) then dvipdmx, or set first to 0 `\Withdvipdfmx` in
etoc-DE.tex to allow compilation with pdflatex.

Um etoc-DE.pdf zu erzeugen ist latex dreimal mit etoc-DE.tex laufen
zu lassen, dann dvipdfmx mit etoc-DE.dvi. Im Falle von Problemen
mit dvipdfmx ist `\Withdvidpdfmx` auf 0 in etoc-DE.tex zu setzen,
dann ist pdflatex dreimal mit etoc-DE.tex laufen zu lassen.

Installation:

    etoc.sty    -> TDS:tex/latex/etoc/etoc.sty
    etoc.dtx    -> TDS:source/latex/etoc/etoc.dtx
    etoc.pdf    -> TDS:doc/latex/etoc/etoc.pdf
    etoc-DE.pdf -> TDS:doc/latex/etoc/etoc-DE.pdf
    README.md   -> TDS:doc/latex/etoc/README.md

The other files may be discarded.

LICENSE
=======

This Work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either
version 1.3c of this license or (at your option) any later
version. This version of this license is in

> <http://www.latex-project.org/lppl/lppl-1-3c.txt>

and the latest version of this license is in

> <http://www.latex-project.org/lppl.txt>

and version 1.3 or later is part of all distributions of
LaTeX version 2005/12/01 or later.

The Authors of this Work are:

- Jean-Francois Burnol `<jfbu at free dot fr>` for the source code
  and English documentation, and
- Christine Roemer `<Christine_Roemer at t-online dot de>` and
  collaborators for the translation into German of the documentation.

This Work consists of the main source file etoc.dtx and the
derived files etoc.sty, etoc.ins, etoc.tex, etoc-DE.tex,
etoc.pdf, etoc-DE.pdf, etoc.dvi, etoc-DE.dvi.

RECENT CHANGES
==============

v1.08b \[2015/03/18\]
---------------------

Bug fixes:

- extra space token removed from `\localtableofcontents` (showed
  only for inline TOCs.)
- `\etocpartname` (a macro used by the package own default line
  styles) was defined to be `\partname`, but this is not compatible
  at least with `babel+french` context. Now simply expands to Part.
- some problems fixed in the German documentation.
- \[2015/03/28\] some more problems fixed in the documentation. Added
  mention of `\etocarticlestyle` and `\etocbookstyle`.

v1.08a \[2015/03/13\]
---------------------

`\etocname`, `\etocnumber` and `\etocpage` are now the robust
variants of `\etocthelinkedname`, `\etocthelinkednumber` and
`\etocthelinkedpage`. This should arguably have been done since
the addition of the latter to etoc with v1.07f \[2013/03/07\]. The
earlier `\etocname` etc... contained the hyperlink destination
only in an unexpanded form.

The documentation has a brand new title page and a new section
*The TOC as a TikZ mind map* both illustrating further uses of
etoc to display tables of contents as trees in an automatic
manner.

v1.08 \[2015/03/10\]
--------------------

`\etocskipfirstprefix` may now appear anywhere in the `<start>`
part of a level style.

New commands `\etociffirst`, `\etocxiffirst`, `\etocxifnumbered`.

It is now possible to issue line style specifications directly
with `&` and `\\` tokens, in order to typeset a TOC as a tabular
or longtable with the opening for example in the first argument of
`\etocsettocstyle` and the closing in its second argument.

It is mandatory for such uses to issue `\etocglobaldefs` which
tells etoc to proceed globally for certain definitions. This is
also useful in the context of the inline environments of package
enumitem.

On this occasion, various old parts of the code have been improved.

v1.07n \[2015/03/05\]
---------------------

No more use of `\toks@` when etoc constructs `\etocthelinkedname`
etc... Thus `\toks@` can be put in the line styles in order to
accumulate information. Only useful if it is certain nothing else
will change `\toks@` either.

In the documentation: list of main commands now in alphabetic order.

v1.07m \[2015/01/23\]
---------------------

Reading of .toc file is delayed to `\begin{document}` to account for
possible Babel active characters used therein. Thanks to Denis
Bitouzé who reported a Babel related problem.

Improved global toc display emulation under KOMA-script classes.

New command `\etocbeforetitlehook`. New command `\etocdisplay`.

v1.07l \[doc of 2014/04/29\]
----------------------------

Added to the documentation an example of use of `\etocthelinkedname`
together with an enumitem inline itemize\* environment; moved main
TOC to immediately after the title, and license to the first pages.

Incorporation of the translation into German done on the initiative
of Christine Römer by Felix Baral-Weber, Jenny Rothkrämer-Vogt,
Daniel Büttner, Claudia Dahl, Christian Otto and Christine Römer (FSU
Jena). My grateful thanks to all!
