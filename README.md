ucalg-memoir-thesis
===================

`ucalgmthesis.cls` is a LaTeX class file that produces documents
according to the thesis guidelines of the [University of Calgary
Faculty of Graduate
Studies](http://www.grad.ucalgary.ca/current/thesis/guidelines). It
uses the [`memoir`](https://ctan.org/pkg/memoir?lang=en) class, which
provides very powerful and flexible mechanisms for book design and
layout. All `memoir` commands for changing chapter headings, page
layout, fancy foot- and endnotes, typesetting poems, etc., can be
used. (Memoir is meant as a replacement for the standard LaTeX
classes, so all standard LaTeX commands such as `\chapter`,
`\section`, etc., still work.) Likewise, any of `memoir`'s class options can
be passed as options to `ucalgmthesis`, in particular `12pt` to select
12 point type (11 point is the default).

The class provides a number of commands to facilitate the production
of the thesis.

- `\makethesistitle` to produce the title page
- `\degree`, `\prog`, `\monthname`, `\thesisyear` are used to provide
  the names of the degree and graduate program, and the month and year
  of the thesis. (These are compatible with the legacy `ucalgthes1` class.)
- `\dedication` produces a dedication centered on its own page

Otherwise, all the class does is change `memoir`'s defaults to comply
with FGS thesis guidelines. Specifically:

- All page numbers appear in the same place (centered in footer).
- All pages except title page are numbered.
- Front matter is numbered in roman numerals, main matter in arabic.
- Abstract, preface, acknowledgments, dedication are included in table
  of contents.
- The table of contents called "Table of Contents".

Class options
-------------

The class has a number of options:

- `singlespaced`, `onehalfspaced`, doublespaced` to set up line
  spacing (`onehalfspaced` is the default)
- `palatino`, `times`, `garamond`, `utopia`, `libertine` offer some
  alternative typefaces to the default Computer Modern.
- `headers` to produce running heads (which, per guidelines, must not
  be the thesis title or author's name, and must be separated from the
  main text by a line).

A sample thesis file is also provided. The various parts of the thesis
are included from subsidiary files to enable generating PDFs of the
title page and individual chapters separately.

Switching from `ucalgthes1`
---------------------------

If you are already using the `ucalgthes1` class, you don't have to do
much to switch to `ucalgmthesis`:

- Change `ucalgthes1` to `ucalgmthesis` in the `\documentclass` command.
- Use the `times` class option if you really want the thesis in Times
  New Roman.
- Delete all the lines from the template that say `\pagenumbering`,
  `\newpage`, `\phantomsection`, `\setcounter`, `\begin{singlespace}`,
  `\end{singlespace}`.
- Abstract and Acknowledgments just start with `\chapter{Abstract}`
  and `\chapter{Acknowledgments}.
- Insert `\frontmatter` at the very beginning, `\mainmatter` before
  your first real chapter, and `\endmatter` after the last real
  chapter and before the bibliography, etc.

Note that the `ucalgmthesis` class sets much wider margins (i.e., lines
are shorter than the excessively long lines resulting from just
setting left and right margins to 1 inch). This may result in some
displayed formulas and tables not fitting into the type block anymore.