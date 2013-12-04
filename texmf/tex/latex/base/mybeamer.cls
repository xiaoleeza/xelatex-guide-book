% mybeamer.cls
%
% by wanze
% LPPL LaTeX Public Project License
%
%

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{mybeamer}
\PassOptionsToPackage{table}{xcolor}
\PassOptionsToPackage{bookmarks,colorlinks}{hyperref}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}%???
\ProcessOptions\relax
\LoadClass[covered]{beamer}
\mode<presentation>{\beamer@suppressreplacementstrue}


%========基本必备的宏包========%
\RequirePackage{calc,float,multicol,moresize}

%===========加入目录 某章或某节=====%

\newcommand{\addchtoc}[1]{
        \cleardoublepage
        \phantomsection
        \addcontentsline{toc}{chapter}{#1}}

\newcommand{\addsectoc}[1]{
        \phantomsection
        \addcontentsline{toc}{section}{#1}}

%===========全文基本格式==========%

\newenvironment{common-format}{ %
        \setlength{\parskip}{1.6ex plus 0.2ex minus 0.2ex}   %段落間距
        \setlength{\parindent}{\baselineskip * \real{0.06} + \textpt * \real{2.4}}}
    {}

%=============color=============%
\definecolor{bgcolor-0}{HTML}{CCFFCC}

%======fancycolorbox 这一小段以后可能被tcolorbox宏包取代====%
\newsavebox{\tempbox}
\newenvironment{fancycolorbox}[1][bgcolor-0]
 {\noindent%%
  \newcommand{\tempcolor}{#1}
  \begin{lrbox}{\tempbox}%
  \begin{minipage}{\linewidth-10pt}
        \setlength{\parskip}{1.6ex plus 0.2ex minus 0.2ex}   %段落間距
        \setlength{\parindent}{\baselineskip * \real{0.06} + \textpt * \real{2.4}}}
 {\ignorespacesafterend%
  \end{minipage}%
  \end{lrbox}%
  \colorbox{\tempcolor}{\usebox{\tempbox}}}


%================字體================%
\RequirePackage{xltxtra,fontspec,xunicode} %必備三件套
\RequirePackage[CJKnumber=true]{xeCJK} %中文環境宏
\xeCJKsetup{PunctStyle=plain}
\defaultCJKfontfeatures{Scale=1.2}   %放大全局CJK字體。中文字應該稍微高於英文字
\setCJKmainfont[BoldFont=Adobe 黑体 Std,ItalicFont=Adobe 楷体 Std]
    {Adobe 宋体 Std}%影響rmfamily字體
\setCJKsansfont{Adobe 黑体 Std}%影響sffamily字體
\setCJKmonofont{Adobe 楷体 Std}%影響ttfamily字體
 %設置英文字體
\setmainfont[Mapping=tex-text]{DejaVu Serif}
\setsansfont[Mapping=tex-text]{DejaVu Sans}
\setmonofont[Mapping=tex-text]{DejaVu Sans Mono}

%=============新的字符===========%
\newfontfamily{\libertine}[Scale=1.5]{Linux Libertine O}
\newfontfamily{\ubuntu}[Scale=3]{Ubuntu}
\RequirePackage{newunicodechar}
\newunicodechar{Ⓐ}{{\libertine{Ⓐ}}}
\newunicodechar{Ⓑ}{{\libertine{Ⓑ}}}
\newunicodechar{Ⓒ}{{\libertine{Ⓒ}}}
\newunicodechar{Ⓓ}{{\libertine{Ⓓ}}}
\newunicodechar{①}{{\libertine{①}}}
\newunicodechar{②}{{\libertine{②}}}
\newunicodechar{③}{{\libertine{③}}}
\newunicodechar{④}{{\libertine{④}}}
\newunicodechar{⑤}{{\libertine{⑤}}}
\newunicodechar{}{{\ubuntu{}}}

%%===============中文化=========%
\renewcommand\contentsname{目~录}
\renewcommand\listfigurename{插图目录}
\renewcommand\listtablename{表格目录}
\renewcommand\bibname{参~考~文~献}
\renewcommand\indexname{索~引}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\partname{部分}
\renewcommand\appendixname{附录}
\renewcommand\today{\number\year年\number\month月\number\day日}


%=======页眉页脚格式=========%
\RequirePackage{fancyhdr}   %頁眉頁腳
\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{第\CJKnumber{\arabic{section}}节~~#1}{}}
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
%    \renewcommand{\chaptermark}[1]{\markboth{第\CJKnumber{\arabic{chapter}}章~~#1}{}}
%    \fancyhf[HL]{\ttfamily \footnotesize \leftmark }
    \fancyhf[HR]{\ttfamily \footnotesize \rightmark }
    \fancyhf[FR]{\thepage}
    \fancyhfoffset[R]{\marginparwidth+\marginparsep}}
\pagestyle{plain}

%=========章節標題設計=========%
\RequirePackage{titlesec}
%修改part
\titleformat{\part}{\huge\sffamily}{}{0em}{}
%修改chapter
\titleformat{\chapter}{\LARGE\sffamily}{}{0em}{}
%修改section
\titleformat{\section}{\Large\sffamily}{}{0em}{}
%修改subsection
\titleformat{\subsection}{\large\sffamily}{}{0em}{}
%修改subsubsection
\titleformat{\subsubsection}{\normalsize\sffamily}{}{0em}{}


%================目录===============%
%toc label to contents space   dynamic adjust
\RequirePackage{tocloft}%
\renewcommand{\numberline}[1]{%
  \@cftbsnum #1\@cftasnum~\@cftasnumb%
}

%==============超鏈接===============%
\RequirePackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref} %設置書簽和目錄鏈接等
\newcommand{\hlabel}[1]{\phantomsection \label{#1}}%某一小段的引用


%=================文字強調=========%
\RequirePackage{ulem} %下劃線,加點
\normalem

\newcommand\reduline{\bgroup\markoverwith
    {\textcolor{red}{\rule[-0.8ex]{1em}{0.4pt}}}\ULon}
\renewcommand\emshape{\color{red}}

%==================插入圖片=======%
\RequirePackage{graphicx}
\graphicspath{{figures/}}

\newenvironment{fig}[1]
        {\begin{figure}[H]
        \includegraphics[width=\linewidth ,totalheight=\textheight , keepaspectratio]{#1}
        \caption{#1}}
        {\end{figure}}
\newenvironment{scalefig}[2][0.4]
        {\begin{figure}[H]
        \includegraphics[scale=#1]{#2}
        \caption{#2}}
        {\end{figure}}

%==============插入表格========%
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.3}

%插入代码
\RequirePackage{fancyvrb}
\DefineVerbatimEnvironment%
    {verbatim}{Verbatim}
    {numbers=left,frame=lines,tabsize=4 ,baselinestretch=2,
    xleftmargin=6pt, fontsize=\footnotesize , numbersep=2pt}


%=============插入尾注=========%
%\RequirePackage{endnotes}





\endinput

