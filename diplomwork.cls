\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{diplomwork}[2018/09/03]
\DeclareOption{14pt}{\PassOptionsToClass{\CurrentOption}{extreport}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{extreport}}


\newif\ifMagister
\newif\ifItog
\newif\ifPractika
\newif\ifBiblatex

\DeclareOption{Kurs}{}
\DeclareOption{Diplom}{
  \Itogtrue
}
\DeclareOption{biblatex}{
	
	
}
\DeclareOption{Magister}{
  \Itogtrue
  \Magistertrue
}
\DeclareOption{Otchet}{
\Practikatrue
}
\DeclareOption{OtchetII}{
	\Practikatrue
}
\DeclareOption{OtchetIII}{
	\Practikatrue
}

\ProcessOptions
\relax

\LoadClass[a4paper]{extreport}


\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}
\RequirePackage{amssymb, amsmath, amsthm}
\RequirePackage{setspace} 

\usepackage[margin=20mm, left=30mm, right=10mm, % поля по 20\, мм
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

\RequirePackage[unicode=true]{hyperref} 
\hypersetup{
%  pagebackref=true, 
%  hyperindex=true, 
  colorlinks=true, 
  allcolors=black, 
}


\RequirePackage{float}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{dot}{.~}
\captionsetup[table]{labelfont={it}, justification=centering,labelsep=dot}
\captionsetup[figure]{labelfont={it},justification=centering,labelsep=dot}

% Название кафедры и зав каф
\newcommand{\thekafedra}{}
\newcommand{\thezavkaf}{}
\newcommand{\kafedra}[2]%
  {\renewcommand{\thekafedra}{#1}
   \renewcommand{\thezavkaf}{#2}}
% руководитель магистерской программы
\newcommand{\themagistradvisor}{}
\newcommand{\theMa}{}
\newcommand{\Ma}[2]%
  {\renewcommand{\themagistradvisor}{#2}
   \renewcommand{\theMa}{#1}}

% Направление подготовки
\newcommand{\theNapravIndex}{}
\newcommand{\theNaprav}{}
\newcommand{\napravlenie}[2]{\renewcommand{\theNapravIndex}{#1}
\renewcommand{\theNaprav}{#2}}


% Факультет
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
\renewcommand{\author}[2]%
  {\renewcommand{\theAuthor}{#1}
   \renewcommand{\theauthor}{#2}} 
% Руководитель
\newcommand{\theadvisor}{}
\newcommand{\theAdvisor}{}
\newcommand{\advisor}[2]%
  {\renewcommand{\theAdvisor}{#1}
   \renewcommand{\theadvisor}{#2}}
\newcommand{\therecenzent}{}
\newcommand{\theRecenzent}{}
\newcommand{\recenz}[2]%
  {\renewcommand{\theRecenzent}{#1}
   \renewcommand{\therecenzent}{#2}}


% название работы
\newcommand{\thework}{}
\newcommand{\work}[1]{\renewcommand{\thework}{#1}}


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
\else
  \renewcommand{\theTheme}{}
  \renewcommand{\thebeforeTitle}{}
  \renewcommand{\theafterTitle}{}
  \ifPractika
    \work{Отчёт по производственной практике}
  \else 
    \work{}
%    \work{Курсовая работа}
  \fi
\fi

\newcommand{\EmptyField}[2]{$\underset{\text{(\textit{#1})}}{\underline{\hspace{#2}}}$}
  
\renewcommand{\maketitle}{
\begin{titlepage}
\linespread{1}\normalfont
\centering 
{
	\small
	Министерство науки и высшего образования РФ\par
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
}

\vfill


 \ifItog %Дипломная
	{\Large \thework
	\par}
	по направлению подготовки\\
	\theNapravIndex~--- {\theNaprav}\par 
	\bigskip
	На тему <<\show@title>> 
  \else
	\ifPractika 
		{\Large \scshape \bfseries \thework\par} % Печатаем называние работы
		\bigskip
	\else 
	{
		{\Large \scshape \bfseries \show@title} % Печатаем называние работы
		\par
		\bigskip
		\textbf{\thework}
		\par
	}
	\fi
	\bigskip
	Направление подготовки: \theNapravIndex~--- {\theNaprav}\par 
  \fi

\vfill
\begin{flushright}
\begin{minipage}{0.5\textwidth}
	Выполнил: {\theAuthor}
	\par \textit{\theauthor}\par
	\ifItog\medskip\noindent\EmptyField{подпись}{6cm}\par\fi
\end{minipage}
\par
\vspace{\baselineskip}
\begin{minipage}{0.5\textwidth}
	\ifPractika 
		Руководитель практики:
	\else 
		Научный руководитель:
	\fi\par
	\theAdvisor\par
	 \textit{\theadvisor}\par
	\ifItog\medskip\noindent\EmptyField{подпись}{6cm}\par\fi	 
 \end{minipage}
 \end{flushright}
 
\vfill


\ifItog %Дипломная
{\raggedright \small
  Допущено к защите в ГЭК:
  <<\underline{\hspace{2em}}>>\underline{\hspace{35mm}}20\underline{\hspace{2em}}\,г.\par
  \medskip
  Заведующий кафедрой \thekafedra \par
  \rule{0pt}{2em}\EmptyField{подпись}{6cm}\hfill \thezavkaf\par
  \bigskip

  \ifMagister 
     Руководитель магистерской программы \theMa \par
	  \rule{0pt}{2em}\EmptyField{подпись}{6cm}\hfill \themagistradvisor\par
     \bigskip
  \fi

  Декан факультета \thedepartment\par
  \rule{0pt}{2em}\EmptyField{подпись}{6cm}\hfill \thedekan\par  
  \par
}
\fi\par
\vfill
Киров\\
\thedate\par
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
  
\RequirePackage{titlesec}
     
    \titleformat{\chapter}[display]
        {\filcenter}
        {\large \chaptertitlename~\thechapter}
        {8pt}
        {\large\bfseries}{\MTKPsectAlignCenter}
     
    \titleformat{\section}
        {\normalsize\bfseries}
        {\thesection}
        {1em}{\MTKPsectAlignLeft}

     
    \titleformat{\subsection}
        {\normalsize\bfseries}
        {\thesubsection}
        {1em}{\MTKPsectAlignLeft}
     
% Настройка вертикальных и горизонтальных отступов
    \titlespacing*{\chapter}{0pt}{-30pt}{8pt}
    \titlespacing*{\section}{\parindent}{*4}{*4}
    \titlespacing*{\subsection}{\parindent}{*4}{*4}
    
% Глава без номера    
   \newcommand{\l@unchapter}[2]{{\@dottedtocline{0}{0pt}{0pt}{#1}{#2}}}    
   \newcommand{\Chapter}[1]%
   {\chapter*{#1}\addcontentsline{toc}{unchapter}{#1}}
   
   
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
\ifPractika 
	\renewcommand{\contentsname}{Содержание}
\fi
}

   
% Настройка Оглавления    

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\@chapapp~\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
%                    \if@twocolumn
%                      \@topnewpage[\@makechapterhead{#2}]%
%                    \else
			
                      \@makechapterhead{#2}%
                      \@afterheading
%                    \fi
                    }


\RequirePackage{tocloft}
\renewcommand{\@tocrmarg}{1em plus1fil} %Запрещаем переносы в словах содержания
    \renewcommand{\cfttoctitlefont}{\hspace{0.38\textwidth} \bfseries\large}
    \renewcommand{\cftbeforetoctitleskip}{-1em}
%%%    \renewcommand{\cftaftertoctitle}{\mbox{}\hfill \\ \mbox{}\hfill{\footnotesize Стр.}\vspace{-2.5em}}
    \renewcommand{\cftchapfont}{\normalsize}
    \renewcommand{\cftchappagefont}{\normalsize}
    \renewcommand{\cftsecfont}{\hspace{31pt}}
    \renewcommand{\cftsubsecfont}{\hspace{11pt}}
    \renewcommand{\cftbeforechapskip}{1ex}
    \renewcommand{\cftparskip}{-1mm}
    \renewcommand{\cftdotsep}{5.5}
    \setcounter{tocdepth}{2}   


% теоремы
  \newtheorem{theorem}{\hspace{\parindent}Теорема}
  \newtheorem{prop}{\hspace{\parindent}Предложение}
  \newtheorem{seq}{\hspace{\parindent}Следствие}
  \newtheorem{lemma}{\hspace{\parindent}Лемма}
\theoremstyle{definition} 
  \newtheorem{example}{\hspace{\parindent}Пример}
  \newtheorem{definition}{\hspace{\parindent}Определение}
\sloppy
\linespread{1.3}





% Оформление приложений
\newcommand{\sectionname}{}
\newcommand{\APPENDIX}{
  \newpage
  \appendix
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\Asbuk{chapter}}  
%  \setcounter{chapter}{0}%
%  \setcounter{section}{0}%
%  \gdef\thechapter{\@Alph\c@chapter}}
%  \setcounter{section}{0} % нумерация глав сначала
%  \renewcommand{\thesection}{\Asbuk{section}} % Разделы нумеруем русскими буквами
%  \renewcommand{\sectionname}{Приложение} % перед разделом пишем Приложение
  \setcounter{page}{1} % нумерацию страниц начинаем с 2
  \renewcommand{\thepage}{\roman{page}} % страницы нумеруем римскими числами, так как приложения не являются частью работы
  
}

\endinput
