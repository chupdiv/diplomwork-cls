\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{diplomwork}[2020/05/30]
\DeclareOption{14pt}{\PassOptionsToClass{\CurrentOption}{extreport}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{extreport}}


\newif\ifProject	% флаг Проект

\newif\ifCoursework	% флаг Курсовая работа
\newif\ifMagister	% флаг Магистерская диссертация
\newif\ifItog		% флаг Выпускная квалификационная работа
\newif\ifPractika	% флаг Отчет по практике

\newif\ifBiblatex	% флаг Использовать Biblatex

\newif\ifConsult	% флаг Есть консультант

\DeclareOption{Coursework}{
	\Courseworktrue
	\Magisterfalse  
	\Practikafalse
	\Itogfalse
}
\DeclareOption{Diplom}{
	\Itogtrue
	%  
	\Magisterfalse
	\Courseworkfalse
	\Practikafalse
}
\DeclareOption{biblatex}{
}
\DeclareOption{Magister}{
	\Itogtrue
	\Magistertrue
	\Courseworkfalse
	\Practikafalse
}
\DeclareOption{Otchet}{
	\Practikatrue
	\Courseworkfalse
	\Magisterfalse
	\Itogfalse
}
\DeclareOption{Report}{
	\Practikatrue
	\Courseworkfalse
	\Magisterfalse
	\Itogfalse
}

\DeclareOption{Project}{
  \Projectrue
}


\ProcessOptions
\relax

\LoadClass[a4paper]{extreport}


\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}
\RequirePackage{amssymb, amsmath, amsthm}
\RequirePackage{array}
\RequirePackage{setspace} 

\usepackage[margin=20mm, left=30mm, right=10mm, 
            nohead,  % без верхнего колонтитула
             foot=22pt % место под номер страницы
            ]{geometry} 


\usepackage{ncccomma}
\RequirePackage{indentfirst}
\RequirePackage[nobreak]{cite}  %группировка ссылок на литературу

\RequirePackage{enumitem} 
\setlist{nolistsep, leftmargin=\parindent} 
\AddEnumerateCounter{\Asbuk}{\@Asbuk}{\CYRM}
\AddEnumerateCounter{\asbuk}{\@asbuk}{\cyrm}

\setlist[itemize]{label=---} %маркированные списки
\setlist[enumerate]{label*=\arabic*.} % нумированный список с точкой
\newlist{alphlist}{enumerate}{1}
\setlist[alphlist,1]{label=\asbuk*), ref=\asbuk*)} %списки со скобками
\newlist{properties}{enumerate}{1}
\setlist[properties]{label=\arabic*$^\circ$, ref=\arabic*$^\circ$} %списки со скобками

\RequirePackage[unicode=true]{hyperref} 
\hypersetup{
%  pagebackref=true, 
%  hyperindex=true, 
  colorlinks=true, 
  allcolors=black, 
}


\RequirePackage{float}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{dot}{~--~}
\captionsetup[table]{
	labelfont={up}, 
	format=plain,
	justification=centering,
	singlelinecheck=false,
	margin= 1.5cm,
	labelsep=dot,
	position=above,
	name=Таблица}
\captionsetup[figure]{
	labelfont={up},
	justification=centering,
	labelsep=endash,
	position=below,
	name=Рисунок}

% Название кафедры и зав каф
\newcommand{\thekafedra}{}
\newcommand{\theshortkafedra}{}
\newcommand{\thezavkaf}{}
\newcommand{\kafedra}[3][]%
  {\renewcommand{\theshortkafedra}{#1}
  \renewcommand{\thekafedra}{#2}
   \renewcommand{\thezavkaf}{#3}}
% руководитель магистерской программы
\newcommand{\themagistradvisor}{}
\newcommand{\theMa}{}
\newcommand{\Ma}[2]%
  {\renewcommand{\themagistradvisor}{#2}
   \renewcommand{\theMa}{#1}}

% Направление подготовки
\newcommand{\theNapravIndex}{}
\newcommand{\theNaprav}{}
\newcommand{\theProfile}{}
\newcommand{\napravlenie}[2]{%
	\renewcommand{\theNapravIndex}{#1}
	\renewcommand{\theNaprav}{#2}}

\newcommand{\profile}[1]{
	\renewcommand{\theProfile}{Профиль: <<#1>>}
	}


% Факультет
\newcommand{\NIL}{}
\newcommand{\thedepartment}{}
\newcommand{\theinstitute}{}
\newcommand{\thedekan}{}
\newcommand{\institute}[1]% 
{\renewcommand{\theinstitute}{#1}}
\newcommand{\department}[2]% 
  {\renewcommand{\thedepartment}{#1}
   \renewcommand{\thedekan}{#2}}

% Автор работы
\newcommand{\theauthor}{}
\newcommand{\theAuthor}{}
\newcommand{\theauthorIO}{}
\renewcommand{\author}[3][]%
{%
	\renewcommand{\theauthorIO}{#1}%
	\renewcommand{\theAuthor}{#2}%
	\renewcommand{\theauthor}{#3}%
} 

% Руководитель

\newcommand{\theadvisor}{}
\newcommand{\theadvisorIO}{}
\newcommand{\theAdvisor}{}
\newcommand{\advisor}[3][]%
{%
	\renewcommand{\theadvisorIO}{#1}%
	\renewcommand{\theAdvisor}{#2}%
	\renewcommand{\theadvisor}{#3}%
}


% КонсультантРуководитель
\newcommand{\theconsult}{}
\newcommand{\theConsult}{}
\newcommand{\theconsultIO}{}
\newcommand{\consult}[3][]%
{%
	\Consulttrue
	\renewcommand{\theconsultIO}{#1}%
	\renewcommand{\theConsult}{#2}%
	\renewcommand{\theconsult}{#3}%
}

\newcommand{\therecenzent}{}
\newcommand{\theRecenzent}{}
\newcommand{\recenz}[2]%
  {\renewcommand{\theRecenzent}{#1}
   \renewcommand{\therecenzent}{#2}}


\newcommand{\thekeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\thekeywords}{#1}}

% название работы
\newcommand{\thework}{}
\newcommand{\work}[1]{\renewcommand{\thework}{#1}}

% Тип отчета
\newcommand{\theReportType}{}
\newcommand{\reporttype}[1]{\renewcommand{\theReportType}{#1}}

%\newcommand{\theTheme}{на тему:~}
%\newcommand{\thebeforeTitle}{<<}
%\newcommand{\theafterTitle}{>>}
\newcommand{\theTheme}{}
\newcommand{\thebeforeTitle}{}
\newcommand{\theafterTitle}{}
\newcommand{\thetitle}{}
\renewcommand{\title}[1]{\renewcommand{\thetitle}{#1}}
\newcommand{\show@title}{\theTheme\thebeforeTitle\thetitle\theafterTitle}

% Дата

\newcommand{\thedate}{}
\renewcommand{\date}[1]%
  {\renewcommand{\thedate}{#1}}



  
\ifItog %Дипломная
	\renewcommand{\theTheme}{}
	\ifMagister
		\work{Магистерская диссертация}
	\else 
		\work{Выпускная квалификационная работа}
	\fi
\fi
\ifCoursework 
	\ifProject
		\work{Курсовой проект}
	\else
		\work{Курсовая работа}
	\fi
\fi
\ifPractika
	\renewcommand{\theTheme}{}
	\renewcommand{\thebeforeTitle}{}
	\renewcommand{\theafterTitle}{}
	
	\work{Отчёт}
	\renewcommand{\show@title}{\thework{} \theReportType}    
\fi


\newcommand{\EmptyField}[2]{$\underset{\text{(\textit{#1})}}{\underline{\hspace{#2}}}$}
  
  
\def\theTitleHead{
	{
	\centering\small
	Министерство образования и науки Российской Федерации\par
	\smallskip
	ФГБОУ ВО <<ВЯТСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ>>\par
	\bigskip
%	Институт \theinstitute
%	\par
%	\smallskip
	Факультет \thedepartment
	\par
	\smallskip
	Кафедра \thekafedra\par
	}\par
}

\def\theTitleFoot{
	{
	\centering
	Киров\\
	\thedate\par
	}\par
}

\def\theTitleVisa{
	{\raggedright
		\ifItog
			{
			\small
			 Допущено к защите в ГЭК:
			 <<\underline{\hspace{2em}}>>\underline{\hspace{35mm}}20\underline{\hspace{2em}}\,г.\par
			 \smallskip
			 Заведующий кафедрой \thekafedra \par
			  \rule{0pt}{2em}\EmptyField{подпись}{6cm}\hfill \thezavkaf\par
			 \smallskip
			\ifMagister 
			     Руководитель магистерской программы \theMa \par
				 \rule{0pt}{2em}\EmptyField{подпись}{6cm}\hfill \themagistradvisor\par
				 \smallskip
			\fi
			 Декан факультета \thedepartment\par
			 \rule{0pt}{2em}\EmptyField{подпись}{6cm}\hfill \thedekan\par  
			 \par
			 }
		\fi
		\ifCoursework
			\vspace{1cm plus\fill minus 8mm\relax}
			Работа защищена с оценкой \underline{\hspace{4cm}}\hfill <<\underline{\hspace{8mm}}>>\underline{\hspace{25mm}} 20\underline{\hspace{5mm}}~г.
		\fi

	}\par
}

\def\theTitleWorkName{
	{\centering
		\ifItog
			{\Large \thework \par}
			\medskip
			по направлению подготовки\\
			\theNapravIndex\enspace{\theNaprav}\par 
			\theProfile
			\par
			\vspace{3mm plus 0mm minus 3mm\relax}
			{\large на тему <<\show@title>> \par}
		\fi
		\ifCoursework
			{\Large \thework \par}
			\vspace{1cm}
			{\Large\bfseries \show@title\par}
			\par
			\vspace{1cm}
			Направление подготовки: \theNapravIndex\enspace{\theNaprav}\par 
			\theProfile
			\vspace{1cm}
		\fi
		\ifPractika
			{\Large \scshape \bfseries \show@title\par} % Печатаем называние работы
			\vspace{1cm}
			Направление подготовки: \theNapravIndex\enspace{\theNaprav}\par 
			\theProfile
		\fi
	}\par
}

\def\theTitleSignums{
	\ifPractika 
		\def\advisortype{Руководитель практики}
	\else
		\def\advisortype{Научный руководитель}
	\fi
	\begin{flushright}
		\begin{minipage}{0.5\textwidth}
			Выполнил: {\theAuthor}
			\par \textit{\theauthor}\par
			\medskip\noindent\EmptyField{подпись}{6cm}\par
		\end{minipage}
		\par
		\vspace{\baselineskip}
		\begin{minipage}{0.5\textwidth}
			\advisortype:\par
			\theAdvisor\par
			\textit{\theadvisor}\par
			\medskip\noindent\EmptyField{подпись}{6cm}\par
		\end{minipage}
		\par
		\ifConsult
			\vspace{\baselineskip}
			\begin{minipage}{0.5\textwidth}
				Консультант:\par
				\theConsult\par
				\textit{\theconsult}\par
				\medskip\noindent\EmptyField{подпись}{6cm}\par
			\end{minipage}
		\fi
	\end{flushright}
}

\renewcommand{\maketitle}{
	\begin{titlepage}
		\linespread{1}\normalfont
		\centering 
		\theTitleHead
		\par
		\par
		\vspace{10mm plus \fill minus 3mm\relax}		
		\theTitleWorkName
		\par
		\vspace{1cm plus \fill minus 3mm\relax}
		\theTitleSignums
		\vspace{1cm plus \fill minus 8mm\relax}
		\theTitleVisa
		\vfill
		\theTitleFoot
	\end{titlepage}
	\setcounter{page}{2}
}


















% заголовки
% Выравнивание по левому краю без переносов.
\newcommand{\MTKPsectAlignLeft}{%
  \let\\\@centercr\@rightskip\@flushglue \rightskip\@rightskip%
  \leftskip\z@skip}

% Выравнивание по центру
\newcommand{\MTKPsectAlignCenter}{%
  \let\\\@centercr
  \rightskip\@flushglue\leftskip\@flushglue
  \parindent\z@\parfillskip\z@skip}
  
\RequirePackage{titlesec,titletoc}

% Оформление глав
	\titleformat{name=\chapter,numberless}
		{\filcenter}
		{}
		{8pt}
		{\large\bfseries}{\MTKPsectAlignCenter}

	\titlespacing*{\chapter}{0pt}{-30pt}{8pt}

\newcommand{\@SETCHAPTER}{
	\titleformat{\chapter}[display]
		{\filcenter}
		{\large \chaptertitlename~\thechapter}
		{8pt}
		{\large\bfseries}{\MTKPsectAlignCenter}
	\titlecontents{chapter}
		[0em] % ie, 1.5em (chapter) + 2.3em
		{\medskip \hyphenpenalty=10000 \hbadness=10000}
		{\@chapapp~\thecontentslabel.\enspace}
		{}
		{\enspace\titlerule*[1pc]{.}\contentspage}
		[\addvspace{0pt}]% 
}
\@SETCHAPTER

	\newcommand{\Chapter}[1]%			% Глава без номера
		{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}	
		

	\newcommand{\NOCHAPTER}{
		\titleformat{\chapter}
			{\filcenter}
			{\large \bfseries\thechapter.}
			{8pt}
			{\large\bfseries}{\MTKPsectAlignCenter}
		\titlecontents{chapter}
			[0em]
			{\medskip \hyphenpenalty=10000 \hbadness=10000}
			{\thecontentslabel.\enspace}
			{}
			{\enspace\titlerule*[1pc]{.}\contentspage}
			[\addvspace{0pt}]% 
	}	
	\setcounter{tocdepth}{2}   
     
% Оформление параграфов
	\titleformat{\section}
		{\normalsize\bfseries}
		{\thesection}
		{1em}
		{\MTKPsectAlignLeft}

	\titlespacing*{\section}{\parindent}{*4}{*4}

	\titlecontents{section}
		[2em] % ie, 1.5em (chapter) + 2.3em
		{\smallskip \hyphenpenalty=10000 \hbadness=10000}
		{\thecontentslabel.\enspace}
		{}
		{\enspace\titlerule*[1pc]{.}\contentspage}

     
    \titleformat{\subsection}
        {\normalsize\bfseries}
        {\thesubsection}
        {1em}{\MTKPsectAlignLeft}
     
% Настройка вертикальных и горизонтальных отступов
    \titlespacing*{\subsection}{\parindent}{*4}{*4}
	\titlespacing{\paragraph}{\parindent}{0pt}{.5em}[]    
	
	





%   \newcommand{\l@unchapter}[2]{{\@dottedtocline{0}{0pt}{0pt}{#1}{#2}}}    
   
   
% настройка библиографического списка перенесено из article.cls
\def\@biblabel#1{#1.}
\renewenvironment{thebibliography}[1]%
 { 
   \Chapter{\bibname}%
   \raggedright
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m
  %добавка
   \setlength{\labelwidth}{0pt}
   \setlength{\labelsep}{.5em}
   \setlength{\leftmargin}{0pt}
   \parsep\parskip
   \setlength{\itemsep}{0pt}
   \setlength{\topsep}{0pt}
   \partopsep\parskip
   \itemindent\parindent
   \advance\itemindent\labelsep  
}%
{\def\@noitemerr {\@latex@warning{Empty
      `thebibliography' environment}}%
 \endlist
}
\AtBeginDocument{
\def\bibname{Библиографический список}
\renewcommand{\appendixname}{ПРИЛОЖЕНИЕ}
\renewcommand{\chaptername}{ГЛАВА}
\renewcommand{\bibname}{Библиографический список} 
\addtocontents{toc}{\protect\renewcommand{\protect\@chapapp}{\chaptername}}%

\ifPractika 
	\renewcommand{\contentsname}{Содержание}
\fi
}

   
% теоремы
  \newtheorem{theorem}{\hspace{\parindent}Теорема}
  \newtheorem*{theorem*}{\hspace{\parindent}Теорема}
  \newtheorem{prop}{\hspace{\parindent}Предложение}
  \newtheorem{proposition}{\hspace{\parindent}Предложение}
  \newtheorem*{proposition*}{\hspace{\parindent}Предложение}
  \newtheorem{seq}{\hspace{\parindent}Следствие}
  \newtheorem{corollary}{\hspace{\parindent}Следствие}
  \newtheorem*{corollary*}{\hspace{\parindent}Следствие}
  \newtheorem{lemma}{\hspace{\parindent}Лемма}
  \newtheorem*{lemma*}{\hspace{\parindent}Лемма}
\theoremstyle{definition} 
  \newtheorem{example}{\hspace{\parindent}Пример}
  \newtheorem*{example*}{\hspace{\parindent}Пример}
  \newtheorem{definition}{\hspace{\parindent}Определение}
  \newtheorem*{definition*}{\hspace{\parindent}Определение}
  
\newcommand*{\hm}[1]{#1\nobreak\discretionary{}{\hbox{$\mathsurround=0pt #1$}}{}}  % Повторение знака в формулах
\sloppy
\linespread{1.3}



% Оформление приложений
\newcommand{\sectionname}{}
\newcommand{\APPENDIX}{
  \newpage
  \appendix
	\@SETCHAPTER
	\gdef\@chapapp{\appendixname}%
	\addtocontents{toc}{\protect\renewcommand{\protect\@chapapp}{\appendixname}}%
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}%
	\gdef\thechapter{\Asbuk{chapter}}  
%	\setcounter{page}{1} % нумерацию страниц начинаем с 2
%	\renewcommand{\thepage}{\roman{page}} % страницы нумеруем римскими числами, так как приложения не являются частью работы
}


\newcommand{\LISTINGS}{
%========================================================
% Описание алгоритмов (если не нужно, то можете удалить)
%========================================================
\usepackage{listings}
% подгружаемые языки — подробнее в документации listings
\lstset{
  inputencoding=utf8,
  extendedchars=true,
  columns=fullflexible,
  keepspaces = true,
  basicstyle=\sffamily\small,
  keywordstyle=\bfseries,
  emphstyle={\itshape}
  numbers=left,        % где поставить нумерацию строк (слева\справа)
  numberstyle=\scriptsize,   % размер шрифта для номеров строк
  numberfirstline=false,
  numberblanklines=false,
  stepnumber=1,        % размер шага между двумя номерами строк
  numbersep=5pt,       % как далеко отстоят номера строк от подсвечиваемого кода
  showspaces=false,         % не показывать пробелы специальными отступами
  showstringspaces=false,   % не показывать пробелы в строках
  showtabs=false,           % не показывать табуляцию в строках
  tabsize=2,                % размер табуляции по умолчанию равен 2 пробелам
  captionpos=t,             % позиция заголовка вверху [t] или внизу [b] 
  breaklines= true,          % автоматически переносить строки 
  breakatwhitespace=true,   % переносить строки только если есть пробел
  escapeinside={\%*}{*)},   % комментарии в коде
%   дополнителньые команды
  %бубен для listings см.
%http://roman.khimov.ru/2011/05/19/latex-listings-cyrillic/
  literate={а}{{\selectfont\char224}}1
    {б}{{\selectfont\char225}}1
    {в}{{\selectfont\char226}}1
    {г}{{\selectfont\char227}}1
    {д}{{\selectfont\char228}}1
    {е}{{\selectfont\char229}}1
    {ё}{{\"e}}1
    {ж}{{\selectfont\char230}}1
    {з}{{\selectfont\char231}}1
    {и}{{\selectfont\char232}}1
    {й}{{\selectfont\char233}}1
    {к}{{\selectfont\char234}}1
    {л}{{\selectfont\char235}}1
    {м}{{\selectfont\char236}}1
    {н}{{\selectfont\char237}}1
    {о}{{\selectfont\char238}}1
    {п}{{\selectfont\char239}}1
    {р}{{\selectfont\char240}}1
    {с}{{\selectfont\char241}}1
    {т}{{\selectfont\char242}}1
    {у}{{\selectfont\char243}}1
    {ф}{{\selectfont\char244}}1
    {х}{{\selectfont\char245}}1
    {ц}{{\selectfont\char246}}1
    {ч}{{\selectfont\char247}}1
    {ш}{{\selectfont\char248}}1
    {щ}{{\selectfont\char249}}1
    {ъ}{{\selectfont\char250}}1
    {ы}{{\selectfont\char251}}1
    {ь}{{\selectfont\char252}}1
    {э}{{\selectfont\char253}}1
    {ю}{{\selectfont\char254}}1
    {я}{{\selectfont\char255}}1
    {А}{{\selectfont\char192}}1
    {Б}{{\selectfont\char193}}1
    {В}{{\selectfont\char194}}1
    {Г}{{\selectfont\char195}}1
    {Д}{{\selectfont\char196}}1
    {Е}{{\selectfont\char197}}1
    {Ё}{{\"E}}1
    {Ж}{{\selectfont\char198}}1
    {З}{{\selectfont\char199}}1
    {И}{{\selectfont\char200}}1
    {Й}{{\selectfont\char201}}1
    {К}{{\selectfont\char202}}1
    {Л}{{\selectfont\char203}}1
    {М}{{\selectfont\char204}}1
    {Н}{{\selectfont\char205}}1
    {О}{{\selectfont\char206}}1
    {П}{{\selectfont\char207}}1
    {Р}{{\selectfont\char208}}1
    {С}{{\selectfont\char209}}1
    {Т}{{\selectfont\char210}}1
    {У}{{\selectfont\char211}}1
    {Ф}{{\selectfont\char212}}1
    {Х}{{\selectfont\char213}}1
    {Ц}{{\selectfont\char214}}1
    {Ч}{{\selectfont\char215}}1
    {Ш}{{\selectfont\char216}}1
    {Щ}{{\selectfont\char217}}1
    {Ъ}{{\selectfont\char218}}1
    {Ы}{{\selectfont\char219}}1
    {Ь}{{\selectfont\char220}}1
    {Э}{{\selectfont\char221}}1
    {Ю}{{\selectfont\char222}}1
    {Я}{{\selectfont\char223}}1
}
\lst@AddToHook{TextStyle}{\let\lst@basicstyle\sffamily\normalsize}

\captionsetup[lstlisting]{labelfont={},justification=centering,labelsep=dot}
%===============================================================================
}

\AtEndDocument{~\label{LastPage}}

% добавление страницы реферат
\newcommand{\makereferat}{
	\newcounter{tmppage}
	\setcounter{tmppage}{\value{page}}
	\newpage
	\chapter*{Реферат}
	\thispagestyle{empty}
	\ifx \theauthorIO \NIL
		\theauthor
	\else
		\theauthorIO
	\fi
	\enspace {\show@title}~: \thework~/ ВятГУ, 
	каф. 
	\ifx \theshortkafedra \NIL
		\thekafedra
	\else
		\theshortkafedra
	\fi;
	рук. 
	\ifx  \theadvisorIO \NIL
			 \theadvisor
		\else
			\theadvisorIO
		\fi;~---
	Киров, \thedate.~--- 
	\pageref{LastPage}~c.\par
	\bigskip
	{\scshape \thekeywords}\par
	\bigskip
	\theannotation
	\newpage
	\setcounter{page}{\value{tmppage}}
	}
	\newcommand{\theannotation}{}
	\newcommand{\annotation}[1]{\renewcommand{\theannotation}{#1}}
	


\RequirePackage{longtable}

\def\continetbl{% 
	\LT@mcol\LT@cols l{\hbox to\z@{\parbox[t]\LTcapwidth{%
	\sbox\@tempboxa{{}Продолжение таблицы\enspace\thetable}% 
	{\box\@tempboxa\hfil}%
	\endgraf}% 
	\hss}}} 
\endinput
