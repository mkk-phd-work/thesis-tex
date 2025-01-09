\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2024/09/25 My custom class extending book]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                   NEEDED PACKAGES                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc} % Needed for utf-8 characters like é ș
\RequirePackage[
    backend=biber,
    bibencoding=utf8,
    defernumbers=true,
    style=numeric,
    maxbibnames=99,
    sortcites,
]{biblatex}
\RequirePackage{loabbreviation} % generating \listofabbreviations
\RequirePackage{losymbol}       % generating \listofsymbols
\RequirePackage{pgf}            % \pgfimage to inster pdf
\RequirePackage{setspace}
\RequirePackage{xstring}

\RequirePackage[en-US,magyar,romanian,useregional=text]{datetime2}  % \DTM....
\DTMlangsetup[en-US,magyar,romanian]{showdayofmonth=false}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                    BIBLATEX SETUP                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\defbibfilter{journal-article}{%
    \type{book} \or \type{article}
}
\defbibfilter{conference-article}{%
    \type{inproceedings} \or \type{inbook}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                  DEFINING VARIABLES                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\submitted#1{\gdef\@submitted{#1-01}\DTMsavedate{submitted}{\@submitted}}
\gdef\@submitted{}
%------------------- HUNGARIAN VARIABLES ----------------%
\def\universityHU#1{\gdef\@universityHU{#1}}
\gdef\@universityHU{}
\def\titleHU#1{\gdef\@titleHU{#1}}
\gdef\@titleHU{}
\def\tutorHU#1{\gdef\@tutorHU{#1}}
\gdef\@tutorHU{}
%------------------- ROMANIAN VARIABLES -----------------%
\def\universityRO#1{\gdef\@universityRO{#1}}
\gdef\@universityRO{}
\def\titleRO#1{\gdef\@titleRO{#1}}
\gdef\@titleRO{}
\def\tutorRO#1{\gdef\@tutorRO{#1}}
\gdef\@tutorRO{}
%-------------------- ENGLISH VARIABLES -----------------%
\def\universityEN#1{\gdef\@universityEN{#1}}
\gdef\@universityEN{}
\def\titleEN#1{\gdef\@titleEN{#1}}
\gdef\@titleEN{}
\def\tutorEN#1{\gdef\@tutorEN{#1}}
\gdef\@tutorEN{}
%---------------------- DEFAULT VALUES -----------------%
% --- submission date
\submitted{2024-09-01}
% --- university name
\universityHU{\centering Babeș-Bolyai Tudományegyetem Kolozsvár\\
Matematika és Informatika Kar\\
Informatika Szak}
\universityRO{\centering Universitatea Babeș-Bolyai, Cluj--Napoca\\
Facultatea de Matematică și Informatică\\
Specializarea Informatică}
\universityEN{\centering Babeș-Bolyai University Cluj--Napoca\\
Faculty of Mathematics and Computer Science\\
Specialization: Computer Science}
% --- title
\titleHU{[Dolgozat cim]}
\titleRO{[Titlu]}
\titleEN{[Title]}
% --- advisor
\tutorHU{[Tit. Egy Tanar]}
\tutorRO{[Tit. Un profesor]}
\tutorEN{[Teacher, Tit]}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                   DEFINING COMMANDS                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}

\newcommand{\unnumbered}[2]{
% creats an unnumbered unit (part/chapter/section/subsection) 
% and adds it to the table of contents.
% #1 - name of the unit (part/chapter/section/subsection)
% #2 - title of the unit
    \csname#1\endcsname*{#2}
    \addcontentsline{toc}{#1}{#2}
    \IfStrEq{#1}{chapter}{
    % the condition is true
        \markboth{\textsc{#1. #2}}{}
    }{
    % the condition is false
        \markright{\textsc{#2}}
    }
}

\newcommand*{\makelot}{}
\newcommand*{\makelof}{}
\newcommand*{\makelos}{}
\newcommand*{\makeloabbr}{}
\newcommand*{\makeloalg}{}
\newcommand*{\makeloe}{}
\newcommand*{\begincmd}{
    \doublespacing
    \frontmatter
    \maketitlepage
    \makestatements
    \phantomsection
    \makeabstract
    \phantomsection
    \makeacknowledgements
    \phantomsection
    \pdfbookmark[1]{Dedication}{Dedication}
    \makededication
    \pdfbookmark[1]{\contentsname}{\contentsname}
    \tableofcontents\cleardoublepage
    \makelot\cleardoublepage
    \makelof\cleardoublepage
    \makeloe\cleardoublepage
    \makeloalg\cleardoublepage
    \makelos\cleardoublepage
    \makeloabbr\cleardoublepage
    \mainmatter
}

\newcommand\showUniversity[1]{\fontsize{16}{18}\selectfont\scshape\noindent#1\par}

\def\beforeUniversity{-20mm}
\def\afterUniversity{5mm}
\def\beforeTitle{5mm}
\def\afterTitle{10mm}
\def\beforeDate{0.2cm}
\def\afterDate{-1.4cm}

\newcommand\maketitlepage{{
%% ENG
    \thispagestyle{empty}
    \vspace*{\beforeUniversity}%
    {\showUniversity{\@universityEN}}%
    \vspace{\afterUniversity}
    \begin{center}%
    \fontsize{18}{20}\usefont{OT1}{phv}{bc}{n}\selectfont
    \bfseries
    PhD Thesis\par
    \vspace*{\beforeTitle}
    \fontsize{24}{26}\selectfont\@titleEN \par%
    \vspace*{\afterTitle}
    \pgfimage[width=6cm]{img/logo-UBB}
    \end{center}
    \vfill
    {\fontsize{16}{18}\selectfont\scshape\noindent%
    \begin{minipage}[t]{0.6\linewidth}%
    \baselineskip 2ex \parskip 0.25ex
    \noindent Scientific supervisor:\vspace*{0.3cm}

    \@tutorEN
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.4\linewidth}%
    \raggedleft\noindent%
    \baselineskip 2ex \parskip 0.5ex
    Student:\vspace*{0.3cm}

    \@author
    \end{minipage}
    }
    \vspace*{\beforeDate}

    \begin{center}%
    \fontsize{18}{20}\selectfont\scshape \DTMUsedate{submitted} %
    \end{center}
    \vspace{\afterDate}%
% page
    \clearpage
%% RO
    \vspace*{\beforeUniversity}%
    \thispagestyle{empty}%
    {\showUniversity{\@universityRO}}%
    \vspace{\afterUniversity}
    \begin{center}%
    \fontsize{18}{20}\usefont{OT1}{phv}{bc}{n}\selectfont
    \bfseries
    Tez\u{a} de doctorat\par
    \vspace*{\beforeTitle}
    \fontsize{26}{28}\selectfont\@titleRO \par%
    \vspace*{\afterTitle}
    \pgfimage[width=7.5cm]{illustrations/imgs/logo-UBB}
    \end{center}
    \vfill
    {\fontsize{16}{18}\selectfont\scshape\noindent%
    \begin{minipage}[t]{0.6\linewidth}%
    \baselineskip 2ex \parskip 0.5ex
    \noindent Conducător științific:\vspace*{0.3cm}

    \@tutorRO
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.4\linewidth}%
    \raggedleft\noindent%
    \baselineskip 2ex \parskip 0.5ex
    Autor:\vspace*{0.3cm}

    \@author
    \end{minipage}
    }
    \vspace*{\beforeDate}
    \begin{center}%
    \fontsize{18}{20}\selectfont\scshape \DTMfetchyear{submitted}~\DTMromanianMonthname{\DTMfetchmonth{submitted}} %
    \end{center}
    \vspace{\afterDate}%
% page
    \clearpage
% HU
    \vspace*{-20mm}%
    \thispagestyle{empty}%
    {\showUniversity{\@universityHU}}%
    \vspace{\afterUniversity}
    \begin{center}%
    \fontsize{18}{20}\usefont{OT1}{phv}{bc}{n}\selectfont
    \bfseries
    Doktori-dolgozat\par
    \vspace*{\beforeTitle}
    \fontsize{26}{28}\selectfont\@titleHU \par%
    \vspace*{\afterTitle}
    \pgfimage[width=7.5cm]{illustrations/imgs/logo-UBB}
    \end{center}
    \vfill
    {\fontsize{16}{18}\selectfont\scshape\noindent%
    \begin{minipage}[t]{0.6\linewidth}%
    \baselineskip 2ex \parskip 0.5ex
    \noindent Témavezető:\vspace*{0.3cm}

    \@tutorHU
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.4\linewidth}%
    \raggedleft\noindent%
    \baselineskip 2ex \parskip 0.5ex
    Szerző:\vspace*{0.3cm}

    \@author
    \end{minipage}
    }
    \vspace*{\beforeDate}
    \begin{center}%
    \fontsize{18}{20}\selectfont\scshape \DTMfetchyear{submitted}~\DTMmagyarMonthname{\DTMfetchmonth{submitted}} %
    \end{center}
    \vspace{\afterDate}%
    \clearpage
}}

\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\def\dedication#1{\gdef\@dedication{#1}}

\newcommand*{\makestatements}{
    \thispagestyle{empty}
    \vspace*{.2in}
    \noindent I hereby declare that I am the sole author of this thesis.\\ \\
    \noindent I authorize XY University to lend this thesis to other
    institutions or individuals for the purpose of scholarly research.\vspace*{.5in}\\ \\
    \hspace*{3.5in}
    \makebox[2.0in]{\hrulefill} \\
    \hspace*{3.5in}
    \@author

    \vspace*{0.8in}
    \noindent I further authorize XY University to reproduce this thesis by photocopying or by
    other means, in total or in part, at the request of other institutions or individuals for the
    purpose of scholarly research.\vspace*{.5in}\\ \\
    \hspace*{3.5in}
    \makebox[2.0in]{\hrulefill} \\
    \hspace*{3.5in}
    \@author
    \clearpage}

\newcommand*{\makeabstract}{
    \setcounter{page}{1}
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
        \cleardoublepage
    \fi
}

\DeclareOption{myorder}{
    \renewcommand*{\begincmd}{\doublespacing}}
\DeclareOption{lot}{\renewcommand*{\makelot}{
    \phantomsection
    \addcontentsline{toc}{section}{List of Tables}
    \listoftables
}}
\DeclareOption{lof}{\renewcommand*{\makelof}{
    \phantomsection
    \addcontentsline{toc}{section}{List of Figures}
    \listoffigures
}}
\DeclareOption{loe}{\renewcommand*{\makeloe}{
    \phantomsection
    \addcontentsline{toc}{section}{List of Equations}
    \listofequations
}}
\DeclareOption{loalg}{\renewcommand*{\makeloalg}{
    \phantomsection
    \addcontentsline{toc}{section}{\listalgorithmname}
    \listofalgorithms
}}
\DeclareOption{los}{\renewcommand*{\makelos}{
    \phantomsection
    \addcontentsline{toc}{section}{\losymbolsname}
    \listofsymbols
}}
\DeclareOption{loabbr}{\renewcommand*{\makeloabbr}{
    \phantomsection
    \addcontentsline{toc}{section}{\loabbreviationsname}
    \listofabbreviations
}}
\DeclareOption{lotodo}{\renewcommand*{\makeloabbr}{
    \phantomsection
    \todototoc
    \listoftodos
}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

\LoadClass[12pt]{book}

\setlength{\oddsidemargin}{0.5in}   %{.4375in}
\setlength{\evensidemargin}{.1in} %{.4375in}
\setlength{\topmargin}{-.5in}  %{-.5625in}
\setlength{\textheight}{9in}
\setlength{\textwidth}{6.0in}
\setcounter{secnumdepth}{5}  % set numbering of subsubsections
\long\def\abstract#1{\gdef\@abstract{#1}}
\AddToHook{begindocument/end}{\begincmd}
\endinput
%% 
%% End of file `thesis.cls'.
