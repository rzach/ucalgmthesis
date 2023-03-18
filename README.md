ucalgmthesis
============

`ucalgmthesis.cls` is a LaTeX class file that produces documents
according to the thesis guidelines of the [University of Calgary
Faculty of Graduate
Studies](https://grad.ucalgary.ca/current-students/thesis-based-students/thesis/building-thesis). It
uses the [`memoir`](https://ctan.org/pkg/memoir?lang=en) class, which
provides very powerful and flexible mechanisms for book design and
layout. All `memoir` commands for changing chapter and section
headings, page layout, fancy foot- and endnotes, typesetting poems,
etc., can be used. (Memoir is meant as a replacement for the standard
LaTeX classes, so all standard LaTeX commands such as `\chapter`,
`\section`, etc., still work.) Likewise, any of `memoir`'s class
options can be passed as options to `ucalgmthesis`, in particular
`12pt` to select 12 point type (11 point is the default).

License
-------

The files in this directory are provided under the terms of the MIT
License. `natbib-oup.bst` is provided under the terms of the LaTeX
Project Public License.

Usage
-----

Consult the file `sample-thesis.tex` for an example thesis setup
with parts `\include`'d from separate files. Here's a minimal file:
```
\documentclass{ucalgmthesis}

\author{...}
\title{...}
\prog{...}
\degree{...}
\thesisyear{...}
\monthname{...}

\begin{document}

\frontmatter

\makethesistitle

\chapter{Abstract}

...

\tableofcontents

\mainmatter

...

\backmatter

....
\end{document}
```

The easiest way to get started is perhaps to rename
`sample-thesis.tex`, change the metadata and layout options to your
liking, and put the content of your thesis into the files it includes
(`frontmatter.tex`, `chapter1.tex`, etc.)

`ucalgmthesis` is part of TeXLive and MikTeX. If you have one of these
installed (or you are working on Overleaf), you do not need the class file
`ucalgmthesis.cls` itself in your thesis directory. You can just copy
the TeX and Bib file from the source directory in your TeXLive tree,
from [CTAN](https://ctan.org/tex-archive/macros/latex/contrib/ucalgmthesis),
or from the [GitHub
repository](https://github.com/rzach/ucalgmthesis) to get started.

Commands
--------

The class provides a number of commands to facilitate the production
of the thesis.

- `\makethesistitle` to produce the title page

- `\degree`, `\prog`, `\monthname`, `\thesisyear` are used to provide
  the names of the degree and graduate program, and the month and year
  of the thesis. (These are compatible with the legacy `ucalgthes1` class.)

- `\dedication` produces a dedication centered on its own page

- `\fullpagethesis` sets up the type block to have 1" margins on all
  sides. `\manuscriptthesis` sets up the typeblock to have a line
  length of about 72 characters and 25 lines per page. The package
  options `fullpage` and `manuscript` use these at the appropriate
  time, but you can use them after you set up your own fonts in the
  preamble.

Otherwise, all the class does is change `memoir`'s defaults to comply
with FGS thesis guidelines. Specifically:

- All page numbers appear in the same place (centered in footer).
- All pages except title page are numbered.
- Front matter is numbered in roman numerals, main matter in arabic.
- Abstract, preface, acknowledgments, dedication are included in table
  of contents.
- The table of contents is called "Table of Contents".

Class options
-------------

The class takes a number of options:

- `singlespaced`, `onehalfspaced`, `doublespaced` sets up the line
  spacing (`onehalfspaced` is the default).

- `palatino`, `times`, `garamond`, `utopia`, `libertine` offer some
  nice alternative typefaces (i.e., fonts) to the default Computer
  Modern. Note that `garamond` uses the
  [`garamondx`](https://ctan.org/tex-archive/fonts/garamondx?lang=en)
  package, which is not included in the TeXLive distibution (and is
  not available on Overleaf).

- `headers` produces running heads. Per the guidelines, the running
  heads must not be the thesis title or author's name, and must be
  separated from the main text by a line. The class uses the chapter
  number and title and places it flush right in the header.

- `fullpage` calls `\fullpagethesis`, so produces a thesis with 1"
  margins all around. This produces very long lines and is not
  recommended for review or submission, but if you have to pay by the
  page for printing you may want to use it.

- `manuscript` sets the type size to 12 points, double spaces the
  text, and calls `\manuscriptthesis` to set the textblock to be about
  72 characters wide and 25 lines high. That makes a page longer than
  a standard manuscript page (60 characters by 25 lines, or about 250
  words), but produces reasonably readable lines and plenty of space
  between lines and in the margins for remarks, corrections, and
  annotations. Recommended for the version you submit for
  examination. You might remove the option for the final version
  submitted to the Vault.

A sample thesis file is also provided. The various parts of the thesis
are included from subsidiary files to enable generating PDFs of the
title page and individual chapters separately.

Switching from `ucalgthes1`
---------------------------

If you are already using the `ucalgthes1` class, you don't have to do
much to switch to `ucalgmthesis`:

- Change `ucalgthes1` to `ucalgmthesis` in the `\documentclass` command.

- The thesis template provided with `ucalgthes1` then uses the
  `geometry` package to set the margins to 1" on all sides. This
  produces atrocious results and you should remove that line. If you
  really want the same narrow margins, use the `fullpage` class
  option, i.e.,
  `\documentclass[12pt,doublespaced,fullpage]{ucalgmthesis}`.  A
  better option for reading and reviewing the thesis is the
  `manuscript` class option (see above). 

- The template also loads the `mathptmx` package to set the typeface
  to Times New Roman. Times is a good typeface for newspapers, but not
  for dissertations or books. Pick a different one! But if you do want
  Times, use the `times` class option instead and delete this
  line. (The class option loads the newer
  [`newtx`](https://ctan.org/pkg/newtx?lang=en) packages.)

- Delete all the lines from the template that say `\pagenumbering`,
  `\newpage`, `\clearpage`, `\phantomsection`, `\setcounter`,
  `\begin{singlespace}`, `\end{singlespace}`.

- Abstract and Acknowledgments just start with `\chapter{Abstract}`
  and `\chapter{Acknowledgments}`.

- Insert `\frontmatter` at the very beginning, `\mainmatter` before
  your first real chapter, and `\endmatter` after the last real
  chapter and before the bibliography, etc.

Note that the `ucalgmthesis` class sets much wider margins even with
the `manuscript` option than the `ucalgthes1` template. Lines are
shorter than the excessively long lines resulting from just setting
left and right margins to 1 inch. This will change the number of pages
in the PDF and may result in some displayed formulas and tables not
fitting into the type block anymore. So be sure to check the result
for such problems.

Troubleshooting and Known Issues
--------------------------------

- The font options may interact badly with other packages you
  load. Try compiling without the font option to see if that's the
  problem.

- The font options all load the `newtxmath` or `newpxmath` packages.
  These have to be loaded after `amsthm`, so the class loads `amsthm`
  before it sets up these fonts. If you don't want that, leave out the
  font option, load the font in your main document preamble, then call
  `\manuscriptthesis` or `\fullpagethesis` to set the right page
  dimensions based on the new font.

- `garamond` uses the `garamondx` package. This package has a
  restrictive license and is thus not included in the TeXLive
  distribution. Use the
  [`getnonfreefonts`](https://www.tug.org/fonts/getnonfreefonts/)
  installer to download it.

- The guidelines require that the official filed thesis is laid out
  for one-sided printing (equal left and right margins). You may want
  to print the thesis two-sided, however, e.g., to give a nice bound
  copy to your supervisor or your mom. You can produce a version for
  two-sided printing using the `twoside` class option of `memoir`. The
  page layout will be altered to have spine and edge margins in the
  golden ratio, and alternating on rectos and versos. This will
  produce a nicer-looking page spread. However, both
  `\makethesistitle` and `\mainmatter` clear to a recto (odd) page
  even with the `openany` option, and so `twoside` will produce
  additional blank pages in the front matter. The main text, however,
  should have the same pagination as the "official" one-sided version,
  as the size of the typeblock is the same.
