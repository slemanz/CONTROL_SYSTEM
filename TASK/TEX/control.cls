\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt,a4paper]{article}

\ProvidesClass{control}[
    Classe do LaTeX criada em Ago. 2022
]

\RequirePackage[top=3cm, bottom=2cm,left=3cm, right=2cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath, amsfonts, amssymb} 
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{xcolor}
\RequirePackage{cancel}

\RequirePackage[brazil]{babel} %idioma
\RequirePackage{helvet}
\RequirePackage{enumitem}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{indentfirst}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage[nomessages]{fp}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{xcolor}
\RequirePackage{listings}

% Define the code formatting style
\lstdefinestyle{python}{
    language=Python,
    basicstyle=\ttfamily,
    keywordstyle=\color{blue},
    commentstyle=\color{gray},
    numbers=left,
    numberstyle=\tiny\color{gray},
    stepnumber=1,
    numbersep=5pt,
    showstringspaces=false,
    breaklines=true,
    breakatwhitespace=true,
    frame=single,
    frameround=tttt,
    rulecolor=\color{black},
    backgroundcolor=\color{white},
}

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

\lstdefinestyle{customc}{
  belowcaptionskip=1\baselineskip,
  breaklines=true,
  frame=L,
  xleftmargin=\parindent,
  language=C,
  showstringspaces=false,
  basicstyle=\footnotesize\ttfamily,
  keywordstyle=\bfseries\color{green!40!black},
  commentstyle=\itshape\color{purple!40!black},
  identifierstyle=\color{blue},
  stringstyle=\color{orange},
}



%
% **** VARIAVEIS
%

% Cores

\definecolor{myOrange}{rgb}{0.04706, 0.32549, 0.65098} %#FF6600
\definecolor{myOrange2}{rgb}{1,0.84,0.54}
\definecolor{myGray}{rgb}{0.11,0.11,0.11}
\definecolor{myGray2}{rgb}{1,0.97,0.95}
\definecolor{myGray3}{rgb}{0.7,0.7,0.7}
\definecolor{myBlue}{rgb}{0, 0.23922, 0.5098}


\color{myGray}


\RequirePackage[hidelinks]{hyperref} 
\RequirePackage{url} % url
\urlstyle{same}


\RequirePackage{tikz}
\RequirePackage{schemabloc}
\usetikzlibrary{calc}
\usetikzlibrary{circuits}

\tikzset{every picture/.append style={trim left=0}}

%
% **** SECTIONS E HEADERS/FOOTERS
%

\RequirePackage{titlesec}
\RequirePackage{xpatch} %cor da linha do cabeçalho
\RequirePackage{fancyhdr}
\RequirePackage[export]{adjustbox} %imagem no footer



%seção (estilo)


\fancypagestyle{normalpage}{
	\fancyhf{} %zera tudoo
	\renewcommand{\headrulewidth}{0pt} %tira a linha
    \setlength{\headheight}{12.0pt}

	\fancyhead[C]{
			\begin{tikzpicture}[overlay,remember picture]
  \fill [myGray]
     ($ (current page.north west) + (11cm,0cm) $) --
($ (current page.north west) + (21cm,0cm) $) --
     ($ (current page.north west) + (21cm,-1.75cm) $) --
     ($ (current page.north west) + (12.5cm,-1.75cm) $) --
     ($ (current page.north west) + (11,0cm) $);


  \fill [myOrange]
     ($ (current page.north west) + (10cm,0cm) $) --
    ($ (current page.north west) + (10.5cm,0cm) $) --
     ($ (current page.north west) + (12cm,-1.75cm) $) --
     ($ (current page.north west) + (11.5cm,-1.75cm) $) --
     ($ (current page.north west) + (10cm,0cm) $);

  \fill [myOrange]
     ($ (current page.north west) + (9.2cm,0cm) $) --
($ (current page.north west) + (9.7cm,0cm) $) --
     ($ (current page.north west) + (11.2cm,-1.75cm) $) --
     ($ (current page.north west) + (10.7cm,-1.75cm) $) --
     ($ (current page.north west) + (9.2cm,0cm) $);

  \fill [myOrange]
     ($ (current page.north west) + (8.4cm,0cm) $) --
($ (current page.north west) + (8.9cm,0cm) $) --
     ($ (current page.north west) + (10.4cm,-1.75cm) $) --
     ($ (current page.north west) + (9.9cm,-1.75cm) $) --
     ($ (current page.north west) + (8.4cm,0cm) $);

	\fill [myGray]
		($ (current page.south west) + (0cm,0cm) $)--
		($ (current page.south west) + (10cm,0cm) $)--
		($ (current page.south west) + (8.5cm,1.75cm) $)--
		($ (current page.south west) + (0cm,1.75cm) $)--
		($ (current page.south west) + (0cm,0cm) $);

\fill [myOrange]
		($ (current page.south west) + (10.5cm,0cm) $)--
		($ (current page.south west) + (11cm,0cm) $)--
		($ (current page.south west) + (9.5cm,1.75cm) $)--
		($ (current page.south west) + (9cm,1.75cm) $)--
		($ (current page.south west) + (10.5cm,0cm) $);

\fill [myOrange]
		($ (current page.south west) + (11.3cm,0cm) $)--
		($ (current page.south west) + (11.8,0cm) $)--
		($ (current page.south west) + (10.3cm,1.75cm) $)--
		($ (current page.south west) + (9.8cm,1.75cm) $)--
		($ (current page.south west) + (11.3cm,0cm) $);

\fill [myOrange]
		($ (current page.south west) + (12.1cm,0cm) $)--
		($ (current page.south west) + (12.6,0cm) $)--
		($ (current page.south west) + (11.1cm,1.75cm) $)--
		($ (current page.south west) + (10.6cm,1.75cm) $)--
		($ (current page.south west) + (12.1cm,0cm) $);

		\node[xshift=3cm, yshift=-1.1cm] at (current page.north west) {};
		\node[xshift=-1.3cm, yshift=1cm, anchor=east] at (current page.south east) {\bfseries{\thepage}};

\end{tikzpicture}
	}
}

\pagestyle{normalpage}
