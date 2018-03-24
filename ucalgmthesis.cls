% ucalgmthesis class
% ==================
% 

\ProvidesClass{ucalgmthesis}[2017/03/23
  University of Calgary Memoir Thesis Class]

\NeedsTeXFormat{LaTeX2e}[1994/06/01]

%% Options for spacing (default is 1.5 spacing)

% All pages must be double or one-and-one-half spaced (Note: this
% includes your Abstract, Acknowledgments, Dedications, etc.).  You
% can use single-line spacing if you have a long Table of Contents,
% List of Tables, List of Figures, or for long quotes in the body of
% your thesis). Use \verb|memoir|'s \verb|SingleSpace| environment to
% typeset, e.g., a quotation single spaced.

\DeclareOption{singlespaced}{\AtEndOfClass{\SingleSpacing}}
\DeclareOption{onehalfspaced}{\AtEndOfClass{\OnehalfSpacing}}
\DeclareOption{doublespaced}{\AtEndOfClass{\DoubleSpacing}}

% Options for typefaces

\DeclareOption{palatino}{\AtEndOfClass{\usepackage{newpxtext,newpxmath}}}
\DeclareOption{times}{\AtEndOfClass{\usepackage{newtxtext,newtxmath}}}
\DeclareOption{garamond}{\AtEndOfClass{\usepackage[garamond]{mathdesign}}}
\DeclareOption{utopia}{\AtEndOfClass{\usepackage[utopia]{mathdesign}}}
\DeclareOption{libertine}{\AtEndOfClass{\usepackage{libertine}
  \usepackage[libertine]{newtxmath}}}

% options for headings

\DeclareOption{plain}{\AtBeginDocument{\pagestyle{plain}}}
\DeclareOption{headers}{\AtBeginDocument{\pagestyle{ucalgaryruled}}}

%% All other options are passed to the base class directly.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{onehalfspaced,plain}
\PassOptionsToClass{openany,oneside,11pt}{memoir}
\ProcessOptions

% now load memoir

\LoadClass{memoir}

\usepackage[T1]{fontenc}

\newcommand{\makethesistitle}{
  \begin{titlingpage*}
    \begin{center}\begin{DoubleSpace}
      UNIVERSITY OF CALGARY \\
      \vfill
      {\@title \par}
      \vfill        
      by \\
      \vfill
      {\@author \par}
      \vfill
      {A \@thesis} \par
      SUBMITTED TO THE FACULTY OF GRADUATE STUDIES \par
      IN PARTIAL FULFILLMENT OF THE REQUIREMENTS FOR THE \par
      {DEGREE OF \@degree}
      \vfill
      \@dept \par
      \vfill
      {CALGARY, ALBERTA \par}
      {{\@monthname}, {\@gradyear} \par}
      \vfill
      {\copyright\ {\@author}~~{\@gradyear} \par}
    \end{DoubleSpace}\end{center}
  \end{titlingpage*}
}

\newcommand{\dedication}[1]{%
  {\clearpage\thispagestyle{plain}\mbox{}\vfill
    \phantomsection
    \addcontentsline{toc}{chapter}{Dedication}%
    \centering #1 \par\vfill\clearpage}}

% Commands for the thesis title page

\def\dept#1{\gdef\@dept{\uppercase{#1}}}
\let\prog\dept % compatibility with ucalgthes class
\def\degree#1{\gdef\@degree{\uppercase{#1}}}
\def\monthname#1{\gdef\@monthname{#1}}
\def\gradyear#1{\gdef\@gradyear{#1}}
\let\thesisyear\gradyear
\def\thesis#1{\gdef\@thesis{\uppercase{#1}}}
\thesis{Thesis}

% Ruled pagestyle according to rules: folio centered in footer,
% headers with a rule

\copypagestyle{ucalgaryruled}{ruled}
\makeoddhead{ucalgaryruled}{}{}{\leftmark}
\makeoddfoot{ucalgaryruled}{}{\thepage}{}

% Since the TOC must include eveyrthing in the front matter, the
% default TOC style looks odd. We reduce the space between chapter
% entries and add dotted leaders also to chapters.

\setlength{\cftbeforechapterskip}{3pt plus 0pt}
\renewcommand{\cftchapterleader}{\normalfont\cftdotfill{\cftsectiondotsep}}
\renewcommand{\contentsname}{Table of Contents}

% we need toc, lof, lot to begin on a new page

\def\tocheadstart{\clearpage}
\def\lofheadstart{\clearpage}
\def\lotheadstart{\clearpage}
