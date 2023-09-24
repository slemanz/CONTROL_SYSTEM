% identificação:

\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt,a4paper]{article}

\ProvidesClass{layout}[
	Classe do LaTeX teste
]

%Formatação básica
\RequirePackage[utf8]{inputenc} %enconding
\RequirePackage[T1]{fontenc}
\RequirePackage[brazil]{babel} %idioma
\RequirePackage[default,scale=0.95]{opensans} %fonte
\RequirePackage[margin=2.5cm]{geometry} %margens
\RequirePackage{amsmath,amsfonts,amssymb} %pacotes matemáticos
\RequirePackage{newtxmath} % Fonte matemática
\RequirePackage{lipsum} % For generating dummy text

\RequirePackage{setspace} %pacote espaçamento
\singlespacing % 1.0 entre linhas
\setlength{\parindent}{20pt} %indentação
\setlength{\parskip}{6pt} %espaçacemnto entre paragrafos

\RequirePackage{indentfirst}

%url

\RequirePackage[hidelinks]{hyperref} 
\RequirePackage{url} % url
\urlstyle{same}

%floats

\RequirePackage{float} %pacote fig. / tables
\RequirePackage{adjustbox} % ajuste automático
\RequirePackage{caption} % legendas
\RequirePackage{subcaption}


%novas variaveis

\def \titulo#1{ \def\@titulo{#1} } % título
\def \@titulo {} % inicia a variável como vazia

\def \autor#1{ \def\@autor{#1}} %autor
\def \@titulo {} % inicia a variável como vázia

\def \materia#1{ \def\@materia{#1}} %linkedin texto e em italico
\def \@materia {} % inicia a variável como vázia

\def \mes_ano#1{ \def\@mes_ano{#1}} %linkedin texto e em italico
\def \@mes_ano {} % inicia a variável como vázia

\def \professor#1{ \def\@professor{#1}} %linkedin texto e em italico
\def \@professor {} % inicia a variável como vázia


\captionsetup[table]{
	labelfont = bf,
	labelsep = endash,
	skip = 3pt
}

\captionsetup[figure]{
	labelfont = bf,
	labelsep = period, %ponto
	skip = 3pt
}

\setlength{\textfloatsep}{6pt} %espaço entre texto e float (tabelas, figuras...)
\renewcommand{\arraystretch}{1.2} % espaçamento dentro da tabela

%-- Listas
\RequirePackage{enumitem} %pacote listas
\setlist{
	topsep=2pt,
	itemsep=0pt,
	partopsep=0pt,
	parsep=0pt
}

\setlist[enumerate]{label=\bfseries\arabic*.}

%----- CORES
\RequirePackage[dvipsnames]{xcolor}

% --- hiperlinks
\RequirePackage[hidelinks]{hyperref} 
\RequirePackage{url} % url
\urlstyle{same}

%--- Icones
\RequirePackage{fontawesome} %pacote ícones

%--- custamizando títulos 

\RequirePackage{titlesec}

%seção (estilo)

\titleformat{\section}{\Large\bfseries}{\thesection. }{0pt}{}
\titleformat{\subsection}{\bfseries\itshape}{\color{BlueViolet}\faCode}{0pt}{}
\titleformat{\subsubsection}{\bfseries\itshape}{}{0pt}{}

%espaçamentos títulos
\titlespacing{\section}{0pt}{8pt}{4pt}
\titlespacing{\subsection}{0pt}{4pt}{2pt}
\titlespacing{\subsubsection}{0pt}{4pt}{2pt}

% cor da linha do cabeçalho
\RequirePackage{xpatch}

%-----page styles
\RequirePackage{fancyhdr}

\fancypagestyle{mypage}{
	\fancyhf{} %zera tudoo
	\fancyhead[L]{{\color{BlueViolet} \bfseries \href{www.slemanz.com}\@autor} }
	\fancyhead[R]{{\color{BlueViolet} \bfseries \@materia}}
	\fancyfoot[C]{\footnotesize \bfseries \thepage}
	\xpretocmd\headrule{\color{gray!85}}{}{}
	
	\renewcommand{\headrulewidth}{0.2pt}
	\setlength{\headheight}{15pt} % tira warning
}

\pagestyle{mypage}


%----- Code listenings

\RequirePackage{listings}

% Definindo cores com xColor
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5} %em porcentagem de 0 a 1
\definecolor{codepurple}{rgb}{0.58,0,0.82}


%-- Criando o estilo da list

\lstdefinestyle{mystyle}{
	backgroundcolor=\color{gray!5},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{BlueViolet},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=t,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

\lstset{
 	style=mystyle, 
	framexleftmargin=3.5mm, 
	frame=shadowbox, 
 	rulesepcolor=\color{black}, 
  	linewidth=0.6\linewidth, 
  	xleftmargin=12pt, 
 	aboveskip=12pt, 
  	belowskip=12pt,
  	language=SQL
}

%--- caixas
\RequirePackage{tcolorbox}





%Criando novos comandos

\newcommand{\destacar}[1]{ {\color{BlueViolet}#1} } %destaca o texto

 %imprime titulo e autor no documento
\newcommand{\printtitle}{
	\begin{center}
		{\Huge\bfseries~\@titulo}\\ \medskip
		{\small Professor: \@professor}\\
		{\small \@mes_ano}
		
	\end{center}

}

%novos ambientes
\newenvironment{caixa}{
\begin{tcolorbox}[colback=black!10, colframe=white, arc=0pt, outer arc=0pt]

}{\end{tcolorbox}}

%tikz
\RequirePackage{circuitikz}
\RequirePackage{tikz}
\RequirePackage{schemabloc}
\usetikzlibrary{calc}
\usetikzlibrary{circuits}

%
% Códigos
%

\lstdefinestyle{matlab}{
    language=Matlab,
    basicstyle=\ttfamily,
    numbers=left,
    numberstyle=\tiny,
    numbersep=5pt,
    keywordstyle=\color{blue},
    commentstyle=\color{green!40!black},
    stringstyle=\color{red},
    breaklines=true,
    showstringspaces=false,
    tabsize=2,
    frame=single,
    rulecolor=\color{black!30},
    backgroundcolor=\color{gray!5},
    captionpos=b,
    morekeywords={matlabFunction},
  	linewidth=\linewidth
}

















