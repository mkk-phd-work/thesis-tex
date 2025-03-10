%% 
%% This is file `puthesis.cls',
%% 
%% The original source files were:
%% 
%% puthesis.dtx  (with options: `class')
%% puthesis.cls
%% 
%% IMPORTANT NOTICE:
%% 
%% I created this file by changing the original 'puthesis.cls' 
%% to satisfy the format requirements for the ORFE department 
%% (and I think SEAS-wide) undergraduate senior thesis.
%% 
%% If you don't belong in ORFE (www.orfe.princeton.edu) DO NOT USE 
%% this file---most probably your department's requirements are 
%% different, and for sure this format does not fit all.
%%
%% If you belong in ORFE and you still want to make your own 
%% template file instead of using this one, go ahead---there is no 
%% ORFE-approved class file for LaTeX anyway, so as long as it 
%% satisfies the format requirements you're going to be fine.
%%
%% Last, but not least, I DO NOT TAKE RESPONSIBILITY if this format 
%% is not good enough for your school, your parents, your dog.... 
%% Needless to say, it is not my fault if this file does not 
%% compile, does not look nice, destroys your thesis/computer/life, 
%% yada, yada, yada. USE IT AT YOUR OWN RISK.
%%
%% With that pleasant ending, I welcome comments at
%% evanp at princeton dot edu, and
%% evanpapageorgiou at yahoo dot com.
%%
%% Enjoy! --Evan Papageorgiou
%% http://www.princeton.edu/~evanp
%%
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{./template/puthesis}
    [2006/11/10 v1.0 Princeton University Undergraduate Thesis class]
\RequirePackage{setspace}

\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}

\RequirePackage{setspace}
\newcounter{subyear}
\setcounter{subyear}{\number\year}
\def\submitted#1{\gdef\@submitted{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\@submittedyear{\ifnum\month>10 \stepcounter{subyear}\thesubyear
  \else\thesubyear\fi}
\def\@submittedmonth{\ifnum\month>10 January\else\ifnum\month>5 November
  \else June\fi\fi}
\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\newcommand*{\frontmatter}{
  \pagenumbering{roman}
  }
\newcommand*{\mainmatter}{\pagenumbering{arabic}}
\newcommand*{\makelot}{}
\newcommand*{\makelof}{}
\newcommand*{\makelos}{}
\newcommand*{\begincmd}{
\doublespacing
\frontmatter\maketitlepage\makestatements
\makeacknowledgements\makededication\tableofcontents\clearpage
\makelot\clearpage\makelof\clearpage\makelos
%%\frontmatter\maketitlepage\makestatements\makeabstract
%%\makeacknowledgements\makededication\tableofcontents\clearpage
%%\listoffigures\clearpage\listoftables\clearpage\makelos
\clearpage\mainmatter}
\def\@submitted{\@submittedmonth~\@submittedyear}
\def\@dept{Operations Research and Financial Engineering}
\def\@deptpref{Department of}
\def\departmentprefix#1{\gdef\@deptpref{#1}}
\def\department#1{\gdef\@dept{#1}}
\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\newcommand{\maketitlepage}{{

\begin{center}%
  \fontsize{18}{20}
  \bfseries {
BABEŞ-BOLYAI UNIVERSITY CLUJ-NAPOCA \\
FACULTY OF MATHEMATICS AND COMPUTER SCIENCE } \\
  \par
  \vspace*{5mm}
  % \fontsize{26}{28}\selectfont\@titleRO \par%
  \vspace*{10mm}
  \pgfimage[width=7.5cm]{img/bbte_logo.png} \par
  \vspace*{10mm}
  \bfseries {PHD THESIS}
\end{center}


  \thispagestyle{empty}
  \sc
  \vspace*{0in}
  \begin{center}
    \LARGE \@title
  \end{center}
  \vspace{.2in}
  \begin{center}
   \@author \\
    Scientific supervisor: \@advisor
  \end{center}
%   \vspace{.6in}
%   \begin{center}
%    Submitted in partial fulfillment\\
% of the requirements for the degree of\\
% Bachelor of Science in Engineering\\
% \@deptpref{} \@dept\\
% Princeton University
%   \end{center}
%   \vspace{0.9in}
  \begin{center}
    \@submitted
  \end{center}

  }
  
  {
    \fontsize{10pt}{12pt}\selectfont
    \noindent
    Keywords: \@keywords
  }

  \clearpage
  }
\newcommand*{\makestatements}{
  \thispagestyle{empty}
  \vspace*{.2in}
\noindent I hereby declare that I am the sole author of this thesis.\\ \\
\noindent I authorize Babe\c{s}-Bolyai University to lend this thesis to other 
    institutions or individuals for the purpose of scholarly research.\vspace*{.5in}\\ \\
  \hspace*{3.5in}
  \makebox[2.0in]{\hrulefill} \\ 
  \hspace*{3.5in}
  \@author
   
   \vspace*{0.8in}
\noindent I further authorize Babe\c{s}-Bolyai University to reproduce this thesis by photocopying or by
other means, in total or in part, at the request of other institutions or individuals for the
purpose of scholarly research.\vspace*{.5in}\\ \\
  \hspace*{3.5in}
  \makebox[2.0in]{\hrulefill} \\ 
  \hspace*{3.5in}
  \@author
  \clearpage}
\newcommand*{\makeabstract}{
  \newpage
  \addcontentsline{toc}{section}{Abstract}
  \begin{center}
  \Large \textbf{Abstract}
  \end{center}
  \@abstract
  \clearpage
  }
\def\makeacknowledgements{
  \ifx\@acknowledgements\undefined
  \else
    \addcontentsline{toc}{section}{Acknowledgements}
    \begin{center}
      \Large \textbf{Acknowledgements}
    \end{center}
    \@acknowledgements
    \clearpage
  \fi
  }
\def\makededication{
  \ifx\@dedication\undefined
  \else
    \vspace*{1.5in}
    \begin{flushright}
      \@dedication
    \end{flushright}
    \clearpage
  \fi
  }
\DeclareOption{myorder}{
  \renewcommand*{\begincmd}{\doublespacing}}
\DeclareOption{lot}{\renewcommand*{\makelot}{
  \addcontentsline{toc}{section}{List of Tables}\listoftables}}
\DeclareOption{lof}{\renewcommand*{\makelof}{
  \addcontentsline{toc}{section}{List of Figures}\listoffigures}}
\DeclareOption{los}{
  \renewcommand*{\makelos}{
    \RequirePackage{losymbol}
    \section*{List of Symbols\@mkboth {LIST OF SYMBOLS}{LIST OF SYMBOLS}}
    \@starttoc{los}
    \addcontentsline{toc}{section}{List of Symbols}
  }
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[12pt]{report}
\setlength{\oddsidemargin}{0.5in}   %{.4375in}
\setlength{\evensidemargin}{.1in} %{.4375in}
\setlength{\topmargin}{-.5in}  %{-.5625in}
\setlength{\textheight}{9in}
\setlength{\textwidth}{6.0in}
\long\def\abstract#1{\gdef\@abstract{#1}}
\AtBeginDocument{\begincmd}
\endinput
%% 
%% End of file `puthesis.cls'.
