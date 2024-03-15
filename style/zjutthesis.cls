%%


%基于电子科技大学模版修改
%-------------------------------------------------
% FileName: main.tex
% Author: Safin (zhaoqid@zsc.edu.cn)
% Version: 0.1
% Date: 2020-05-12
% Description: 主文档，包含其它tex文档
%     如果要增加新的章节，请先到 tex目录增加文件，再input
%     如果附录没有内容，就注释掉
% Others: 编译方法参考 make.sh
%         适配TeXLive2020
%         必须用 [UTF-8无BOM] 编码
% History: origin
%-------------------------------------------------

% latex 版本
\NeedsTeXFormat{LaTeX2e}

% 本文件提供的cls的名字，版本
\ProvidesClass{zjutthesis}[2023/06/25 version 0.1]

% ctexart 是 article 和 ctex 的结合，也即支持中文的文章
% ctexbook 是 book 和 ctex 的结合，也即支持中文的书籍
\LoadClass[
oneside,   % 单面排版
a4paper,   % A4纸
titlepage, % 指定标题命令 \maketitle 生成单独的标题页
UTF8,      % UTF-8编码
linespread=1.25, % 行距1.25倍字号大小
zihao=-4,  % 默认字号为小4 
]{ctexbook}



% \AtEndOfPackage{% class cfg loaded after package to make preamble commands take effect
%     \makeatletter
%     \InputIfFileExists{style/zjutthesis.cfg}{}{}
%     \makeatother
% }


% \RequirePackage{cleveref}% 载入自动引用宏包
% \crefname{figure}{图}{图}
% \crefname{table}{表}{表}
% \crefname{equation}{式}{式}
% \renewcommand{\eqref}[1]{\labelcref{#1}~\namecref{#1}}



% debug ---------------------------------------
% 仅编译，不生成PDF，用于debug
% \usepackage{syntonly}
% \syntaxonly

% 页面 ---------------------------------------
% 设置页面边距 (封面单独设置)
\RequirePackage[a4paper, top=3.0cm,bottom=3.0cm,left=3.0cm,right=3.0cm]{geometry}
% A4尺寸
% \RequirePackage[left=1.25in,right=1.25in, top=1in,bottom=1in]{geometry}

% 字号字体 ---------------------------------------
% 字号 \zihao{num}
% 0   初号  \zihao{0}
% −0  小初
% 1   一号
% −1  小一
% 2   二号
% −2  小二
% 3   三号
% −3  小三
% 4   四号
% −4  小四
% 5   五号
% -5  小五  \zihao{-5}

% 设置字体  会影响到所有的内容
% texdoc xeCJK
% SimSun KaiTi 通过查找系统字体得到  
% overleaf编译不通过
% AutoFakeBold 当没有声明对应的粗体时，是否使用伪粗体
% \setCJKmainfont[AutoFakeBold=true]{SimSun}  % overleaf 下错误
% \setCJKmainfont[AutoFakeBold=true]{fonts/simsun.ttc}

\RequirePackage{fontspec}

% \setmainfont{Times New Roman}

\setmainfont[NFSSFamily=entextrm]{XITS}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
    Ligatures=TeX,
]
\setsansfont[NFSSFamily=entextsf]{XITS}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
    Ligatures=TeX,
]
\setmonofont[NFSSFamily=entexttt]{XITS}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
    Ligatures=TeX,
]



% 判断当前所处的操作系统
\RequirePackage{ifplatform}

% windows
\ifwindows   
    \setCJKmainfont{SimSun}[AutoFakeBold=2.5,ItalicFont=KaiTi]%
    \setCJKsansfont{SimHei}[AutoFakeBold=2.5]%
    \setCJKmonofont{FangSong}%
\fi

% linux
\iflinux

\fi

% macosx
\ifmacosx
    
    \setCJKmainfont{Songti SC}[%
        UprightFont    = * Light,
        BoldFont       = * Bold,
        ItalicFont     = Kaiti SC,
        BoldItalicFont = Kaiti SC Bold,
    ]
    \setCJKsansfont{Heiti SC}[BoldFont = * Medium]%
    \setCJKmonofont{STFangsong}%
\fi  


% /c/windows/Fonts/simsun.ttc
% \setCJKmainfont{simsun.ttc} %宋体
% \setCJKsansfont{msyh.ttf} %微软雅黑
% \setCJKmonofont{FZYTK.ttf} %方正姚体

% 通过查找获得win10系统字体 
% fc-list -f "%{family}\n" :lang=zh > zhfont.txt 
% 参考 xeCJK `texdoc xeCJK`
% Arial Unicode MS
% FangSong,仿宋
% KaiTi,楷体
% Microsoft YaHei,微软雅黑
% MingLiU,細明體
% NSimSun,新宋体
% PMingLiU,新細明體
% SimHei,黑体
% SimSun,宋体




% 新的字体族 
% 宋体已经定义过了， 用法 \songti{xxxx}
% \newCJKfontfamily[song]\songti{SimSun}
% 黑体已经定义过了， 用法 \heiti{xxxx}
% \newCJKfontfamily[hei]\heiti{SimHei}

% 楷体 用法 \kaiti{xxxx}
% \newCJKfontfamily[kai]\kaiti{KaiTi}
% 仿宋体 用法 \fangsongti{xxxx}
% \newCJKfontfamily[fangsong]\fangsongti{FangSong}

% ctex 已经定义的字体
% 除了在 ubuntu 字库中没有
% \fangsong 的定义外，所有字库都有以下四个字体命令。
% \songti 宋体，CJK 等价命令 \CJKfamily{zhsong}。
% \heiti 黑体，CJK 等价命令 \CJKfamily{zhhei}。
% \fangsong 仿宋，CJK 等价命令 \CJKfamily{zhfs}。
% \kaishu 楷书，CJK 等价命令 \CJKfamily


% 章节格式---------------------------------------
% 设置章的标题格式 第X章
% \ctexset {
%     section = {
%         name = {第,章}, 
%         number = \arabic{section},
%     }
% }

\ctexset {
    chapter = {
        % 3号，黑体，居中
        format = \zihao{3}\heiti\centering, 
        % 设置章节的名字
        name = {第,章}, 
        % 中文数字序号
        number = \chinese{chapter},
        % 图目录, 章之间的图标题的距离
        lofskip = {0pt},
        % 表目录, 章之间的表标题的距离
        lotskip = {0pt},
        % 设置章节标题前的垂直间距
        beforeskip = {16pt},
        % 控制章节标题与后面下方之间的距离
        afterskip = {16pt},
    },
    section = {
        % 小3号，黑体，居左
        format = \zihao{-3}\heiti\raggedright, 
    },
    subsection = {
        % 4号，黑体，居左
        format = \zihao{4}\heiti\raggedright, 
    },
    subsubsection = {
        % 小4号，黑体，居左
        format = \zihao{-4}\heiti\raggedright,  
    },
}


% 章节编号的深度
% book文档类里默认为2, subsection编号，而subsubsection不编号
% 设置为3, 则subsubsection编号
% depth for the table of contents
\setcounter{secnumdepth}{3} 
% 目录的深度, subsection
\setcounter{tocdepth}{2}

% 这个导引点加了以后，目录，图目录，表目录就不居中
% 目录相关------
% 确保章与页码之间也有引导点
% \usepackage{subfigure}
% \usepackage[subfigure]{tocloft}
% \renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

%---------------------------------------------------------------------------%
%->> Configure table of contents
%---------------------------------------------------------------------------%
%- the table of contents is specified by defining \l@chapter, \l@section, ...
%- most commands are then defined with the \@dottedtocline:
%- \@dottedtocline{⟨level⟩}{⟨indent⟩}{⟨numwidth⟩}{⟨title⟩}{⟨page⟩}
%- ⟨level⟩    an entry is produced only if ⟨level⟩ <= value of the tocdepth counter
%-            note, \chapter is level 0, \section is level 1, etc
%- ⟨indent⟩   indentation from the outer left margin of the start of the contents line
%- ⟨numwidth⟩ width of a box in which the section number is to go
%- <title>    title
%- <page>     page number

%- parameters for spacing and length in toc
\def\@dotsep{1.5mu}% separation between dots in mu units
\def\@pnumwidth{2em}% width of a box in which the page number is put
\def\@tocrmarg{2em}% right margin for multiple line entries, \@tocrmarg ≥ \@pnumwidth
\def\@chaptervspace{1ex}% vertical space between chapter titles

%- redefine dottedtocline from classes.dtx and latex.ltx
\renewcommand*{\@dottedtocline}[5]{% [<level>,<indent>,<numwidth>,<title>,<page>]
    \ifnum #1>\c@tocdepth \else
        \vskip \z@ \@plus.2\p@
        {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
        \parindent #2\relax\@afterindenttrue
        \interlinepenalty\@M
        \leavevmode \zihao{-4}
        \@tempdima #3\relax
        \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
        {#4}\nobreak
        \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
        \nobreak
        \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
        \par\penalty\@highpenalty}%
    \fi
}
%- redefine l@part from book.cls to add dotted toc line
\renewcommand*{\l@part}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >-2\relax
        \addpenalty{-\@highpenalty}%
        \addvspace{2.25em \@plus\p@}%
        \setlength\@tempdima{3em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            {\leavevmode
            \zihao{-4} #1
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
            \nobreak
            \global\@nobreaktrue
            \everypar{\global\@nobreakfalse\everypar{}}%
        \endgroup
    \fi
}
%- redefine l@chapter from book.cls to add dotted toc line
\renewcommand*{\l@chapter}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip \@chaptervspace \@plus\p@
        \setlength\@tempdima{1.5em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode \zihao{-4}
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            #1\nobreak
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
            \penalty\@highpenalty
        \endgroup
    \fi
}
%- redefine indentation for others
\renewcommand*\l@section{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{2.8em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3em}{3.8em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{4em}{4.8em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{5em}{5.8em}}
\renewcommand*\l@figure{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@table{\@dottedtocline{1}{1em}{1.8em}} 



% 浮动体相关---------------------------------------
% textfraction页面中必须用来排放文本的最小比例。缺省值为 0.2， 即一页中浮动对象所占的比例不得超过 80%。
\renewcommand{\textfraction}{0.15} 
% topfraction页面顶部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.7，即放置在页顶部的浮动对象所占 的高度不得超过整个页面高度 70%。同样地，如果多个 使用了选项 t 的浮动对象的高度和超过了 整个页面高度的 60%，即使它们的数目没有超过  topnumber 的值，仍将一个也不会被放置 在页面顶部。
\renewcommand{\topfraction}{0.85} 
% bottomfraction页面底部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.3，这使得如果浮动对象的高度 不超过整个页面高度的 40%，可以允许放置在页面底部。
\renewcommand{\bottomfraction}{0.65} 
% 浮动页中必须由浮动对象占用的最小比例。因此 在一浮动页中空白所占的比例不会超过 1 - \floatpagefraction。缺省值为 0.5。
\renewcommand{\floatpagefraction}{0.60}


% 图，表，公式 ---------------------------------------
% 用于加载图片 includegraphics
\RequirePackage{graphicx}

% 设置图片路径，加载图片可以忽略img前缀
\graphicspath{{img/}}

% 绘图
% \RequirePackage{tikz}
% \usetikzlibrary{3d}
% \usetikzlibrary{graphs}
% \usegdlibrary{trees}



% 抑制图片表格等的浮动 
% \begin{figure}[H] [H]表示把图片放于当前位置
\RequirePackage{float}
% 禁止浮动体跨节
\RequirePackage[section]{placeins}

% 表格宏包
\RequirePackage{booktabs,tabularx,multirow,longtable,makecell}
\RequirePackage{array}


% 重新定义图目录的标题
\renewcommand\listfigurename{图目录}
% 重新定义表目录的标题
\renewcommand\listtablename{表目录}


% 重新定义图的标题前缀
% \renewcommand\figurename{}
% \renewcommand\thefigure{图\arabic{chapter}-\arabic{figure}}

% 重新定义图的标题序号格式 (章号-图号)
% {section}是章的计数器
% {figure}是图的计数器
% 图的标题由 \caption 命令生成
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}

% \renewcommand\tablename{}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}

% \caption 命令位于图表下方时，与上方图表的间距
\setlength{\abovecaptionskip}{10pt}
% \caption 命令位于图表上方时，与下方图表的间距
\setlength{\belowcaptionskip}{10pt}

% 设置公式编号样式
\makeatletter
\@addtoreset{equation}{chapter}
\makeatother
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}

% 设置图，表的 caption的属性
\RequirePackage{caption}

% 设置浮动体标题悬挂缩进
\captionsetup{format=hang}
% 宋体，5号
% 原始的word模板中图表标题的字号只有小五，似乎太小了点
% 把它改成5号
\DeclareCaptionFont{songti}{\songti}
\DeclareCaptionFont{zihao5}{\zihao{5}} 
\captionsetup{font={songti, zihao5}, textfont={songti, zihao5}}
% labelsep 设置编号和标题之间的符号，默认是冒号colon
\captionsetup{labelsep=space}
% 以下是图片和表格分开来设置
% \captionsetup[figure]{labelsep=space}
% \captionsetup[table]{labelsep=space}


% 以下改变\caption
% \newcommand{\mycaption}[1]{\caption{\zihao{6}\kaishu{#1}}}




% 列表相关 ---------------------------------------
\RequirePackage{enumitem}
% 每一个item第一行缩进
% \parindent 是首行缩进
\setlist[enumerate]{wide=\parindent}
\setlist[itemize]{wide=\parindent} 
% 列表项之间无多余间距，列表和正文之间无多余间距
\setlist{nosep}



% 下划线 颜色 相关 ---------------------------------------
% ulem宏包
% 可断行下划线命令\uline
\RequirePackage{ulem}

% 颜色宏包
\RequirePackage{color,xcolor}

% 参考文献相关 ---------------------------------------
% 载入参考文献宏包，设置引用格式
% natbib宏包配合gbt7714-numerical.bst使用
% number是参考文献显示数字标号
% sort&compress 是排序，以及[2-7]这种形式
% \RequirePackage[numbers, sort&compress]{natbib}

% gbt7714 格式 包含natbib，二者只要一个
% 这个宏包有两种用法，1是宏包，2是bst
% 没有直接使用这个宏包，而是直接使用gbt7714-numerical.bst，是为了定制“出版地不详“，参考 texdoc gbt7714
\RequirePackage[sort&compress]{gbt7714}
% \citestyle{numbers}
% 上角标
\citestyle{super}
% 参考文献页的行距
\setlength{\bibsep}{0.5ex} 

% 源代码相关 ---------------------------------------
\RequirePackage{style/zjutcode}

% 数学公式相关 ---------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amsfonts} 
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{newtxmath}
\RequirePackage{esint}

% 页眉页脚相关 ---------------------------------------
% texdoc fancyhdr
\usepackage{fancyhdr}

\RequirePackage{ifthen}
\newcommand{\myfancy}{
    % 先清空样式
    \fancyhf{}
    % 页脚，居中，页码
    %\fancyhead[CE]{\zihao{5}\songti{\fillType}}
    %\fancyhead[CO]{\zihao{5}\songti{\deftitle}}

    \fancyhead[C]{\ifthenelse{\isodd{\value{page}}}{\zihao{5}\songti{\defTitleCn}}{\zihao{5}\songti{\fillType}}}
    
    \fancyfoot[CO,CE]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0.75pt}
    % \renewcommand{\headheight}{13pt}
    \setlength{\headwidth}{\textwidth}
}

% 自定义页眉页脚样式
\fancypagestyle{myfancy}{
    \myfancy
}
% 使用自定义样式
\pagestyle{myfancy}

% book文档类的每章第一页为plain格式
% 默认的plain格式，每章第一页不显示页眉
% 重新定义plain样式，在每章第一页使用自定义样式\myfancy
\fancypagestyle{plain}{
    \myfancy
}


% {\expandafter\ifblank\expandafter}% expansion control
% \RequirePackage{expl3}% LaTeX3 programming environment
% \ExplSyntaxOn
% \newcommand{\zsclntotab}[2][1pt]{% convert lines into table lines
%     \seq_set_split:NnV \l_tmpa_seq {\\} {#2}
%     \clist_set_from_seq:NN \l_tmpa_clist \l_tmpa_seq
%     \clist_clear:N \l_tmpb_clist
%     \clist_map_inline:Nn \l_tmpa_clist
%         {%
%         \clist_put_right:Nn \l_tmpb_clist 
%             { {##1} }
%         }
%     %\clist_show:N\l_tmpb_clist% show the content of comma list
%     \clist_use:Nn \l_tmpb_clist { \\ & }
% }
% \ExplSyntaxOff

% \RequirePackage{changepage}

%%%gdy++
%%%%%%%% 文档信息 %%%%%%%%
\RequirePackage{xstring}      % 正文标题中替换换行
\RequirePackage{datetime}     % 日期

% 中文题目
\def\defTitleCn{}
\newcommand{\mytitle}[1]{\def\defTitleCn{#1}}
% 英文题目
\def\defTitleEn{}
\newcommand{\myTITLE}[1]{\def\defTitleEn{#1}}

%指导老师
%导师姓名
\def\defSupervisor{}
\newcommand{\supervisor}[1]{\def\defSupervisor{#1}}
%导师职称
\def\defSupervisorTitle{}
\newcommand{\supervisorTitle}[1]{\def\defSupervisorTitle{#1}}
%导师姓名(英)
\def\defSupervisorEn{}
\newcommand{\supervisorEn}[1]{\def\defSupervisorEn{#1}}
%导师职称(英)
\def\defSupervisorTitleEn{}
\newcommand{\supervisorTitleEn}[1]{\def\defSupervisorTitleEn{#1}}


%\DeclareRobustCommand{\defabstractname}{摘要}
%\DeclareRobustCommand{\defABSTRACTNAME}{ABSTRACT}

\DeclareRobustCommand{\fillType}{浙江工业大学硕士学位论文}
\DeclareRobustCommand{\zjutType}[1]{\renewcommand{\fillType}{#1}}

% \DeclareRobustCommand{\fillTitleCn}{中文题目}
% \DeclareRobustCommand{\fillTitleEn}{Title of Thesis}
% \DeclareRobustCommand{\zjutTitle}[2]{%
%   \renewcommand{\fillTitleCn}{#1}%
%   \renewcommand{\fillTitleEn}{#2}%
%   \title{\StrSubstitute{#1}{\\}{}}%
% }

\def\defFillMentorNameCn{}
\newcommand{\fillMentorNameCn}[1]{\def\fillMentorNameCn{#1}}

\def\defFillMentorTitleCn{}
\newcommand{\fillMentorTitleCn}[1]{\def\fillMentorTitleCn{#1}}



\def\defFillAuthorCn{}
\newcommand{\fillAuthorCn}[1]{\def\fillAuthorCn{#1}}

\def\defFillAuthorEn{}
\newcommand{\fillAuthorEn}[1]{\def\fillAuthorEn{#1}}

\DeclareRobustCommand{\zjutAuthor}[2]{%
\renewcommand{\fillAuthorCn}{#1}%
\renewcommand{\fillAuthorEn}{#2}%
}

\def\defFillMajor{}
\newcommand{\fillMajor}[1]{\def\fillMajor{#1}}

\def\defFillAcademic{}
\newcommand{\fillAcademic}[1]{\def\fillAcademic{#1}}

\def\defFillCultiviate{}
\newcommand{\fillCultiviate}[1]{\def\fillCultiviate{#1}}

\def\defFillCollege{}
\newcommand{\fillCollege}[1]{\def\fillCollege{#1}}

\def\defFillresearchArea{}
\newcommand{\fillresearchArea}[1]{\def\fillresearchArea{#1}}

\def\defFillchairman{}
\newcommand{\fillchairman}[1]{\def\fillchairman{#1}}

\def\defFillYear{}
\newcommand{\fillYear}[1]{\def\fillYear{#1}}

\def\defFillMonth{}
\newcommand{\fillMonth}[1]{\def\fillMonth{#1}}

\def\defFillDay{}
\newcommand{\fillDay}[1]{\def\fillDay{#1}}

\def\defvalueschool{浙江工业大学计算机科学与技术学院}

\def\deffrontpage{封面}
\def\deflabeltitle{毕业设计(论文)}
\def\deflabeleduinstitute{教学单位: }
\def\deflabelmajor{专业名称: }
\def\deflabelstudentid{学\hspace{2em}号: } 
\def\deflabelstudent{学生姓名: } 
\def\deflabeladvisor{指导教师: }   
\def\deflabelcmdinstitute{指导单位: }   
\def\deflabelcompletedate{完成时间: }  
\def\deflabelzscedu{\defvalueschool 教务处制发}

\def\defdeclarationpage{声明}

\def\deflabeldeclarecreativity{独创性声明}

\def\defvaluedeclarecreativity{%
    本人声明：所呈交的学位论文，是本人在指导老师的指导下独立进行研究工作所取得的研究成果。除文中特别加以标注、所列参考文献和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得\defvalueschool 或其它教育机构的学历、学位或课程、培训等非获奖类证书而使用过的成果材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。本人完全意识到本声明的法律后果由本人承担。
}

\def\deflabeldeclareauthor{作者签名：}
\def\deflabeldeclareadvisor{导师签名：}
\def\deflabeldeclaredate{日期：\quad\quad\quad 年\quad\quad 月\quad\quad 日}
\def\deflabeldeclarerights{论文使用授权声明}

\def\defvaluedeclarerights{%
    本学位论文作者完全了解\defvalueschool 有关保留、使用学位论文的规定，本人同意学校有权保留并向国家有关部门或机构送交论文的复印件和磁盘，允许论文被查阅和借阅。本人授权\defvalueschool 可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。
}
\def\defvaluedeclarerule{(保密的学位论文在解密后应遵守此规定)} 

\def\deflabeldeclarelevel{论文级别：硕士论文}
\def\deflabeldeclaremajor{学科专业：}
\def\deflabeldeclaretitle{论文题目：}
        

\def\defabstractname{摘要}
\def\defABSTRACTNAME{Abstract}
\def\defkeywords{关键词：}
\def\defKEYWORDS{Key Words: }

\def\defacknowledgement{致谢}


%%%gdy--

\newcommand{\cukaishu}[1]{\textbf\kaishu {#1}}

% 位置 左对齐的缩进
% \newcommand{\leftspace}{\hspace{4em}}

% 生成封面，空行用于换行
\newcommand{\mymaketitle}{  
%中文封面
    \begin{center}%gdy++
    {
      \includegraphics[width=25mm]{logo/zjutlogo}
      \includegraphics[width=90mm]{logo/zjutname}
    }\\
    \heiti

    \vspace*{0.5cm}
    
    {\zihao{0}硕士学位论文}\\
    \vspace*{\fill}
    \begin{tabular}{rc}
      \zihao{3}\defTitleCn \\
    \end{tabular}\\
    \vspace*{3.0cm}
    %\textbf{\kaishu
    \cukaishu

    \setlength{\tabcolsep}{10mm}{
    \begin{tabular}{rc}
    
      \vspace*{0.3cm}
      \zihao{4}作者姓名 & \zihao{4}\fillAuthorCn \\
      \vspace*{0.3cm}
      \zihao{4}指导教师 & \zihao{4}\defSupervisor\qquad\defSupervisorTitle \\
      \vspace*{0.3cm}
      \zihao{4}学科专业 & \zihao{4}\fillMajor \\
      \vspace*{0.3cm}
      \zihao{4}学位类型 & \zihao{4}\fillAcademic \\
      \vspace*{0.3cm}
      \zihao{4}培养类型 & \zihao{4}\fillCultiviate \\
      \vspace*{0.3cm}
      \zihao{4}所在学院 & \zihao{4}\fillCollege \\
    \end{tabular}\\
    }
    %}
    
    \vspace*{\fill}
    {提交日期：\fillYear 年\fillMonth 月}\\
    \vspace*{\fill}
    \end{center}
    \clearpage%{\pagestyle{empty}}
    \thispagestyle{empty}
%英文封面
    \begin{center}
        \vspace*{1cm}
        {\zihao{1}\sffamily\defTitleEn}\\
        \vspace*{0.5cm}
        \zihao{3}
        Dissertation Submitted to\\
        \textbf{Zhejiang University of Technology}\\
        in partial fulfillment of the requirement\\
        for the degree of\\
        \textbf{Master of Engineering}\\
        \includegraphics[width=3cm]{logo/zjutlogo}\\
        by\\
        \fillAuthorEn\\
        \vspace*{\fill}
        Dissertation Supervisor:            \defSupervisorTitleEn\,\defSupervisorEn\\
        \vspace*{\fill}
        \monthname, \fillYear\\
        \vspace*{\fill}
    \end{center}
    \clearpage%{\pagestyle{empty}}
    \thispagestyle{empty}
    %%gdy--
    
}

% 原创性声明
\newcommand{\makedeclaration}{%
    {
        %原创声明
    \vspace*{24bp}
    \begin{center}
      \zihao{3}\heiti\textbf{浙江工业大学学位论文原创性声明}
    \end{center}

    \doublespacing\zihao{-4}
    本人郑重声明：所提交的学位论文是本人在导师的指导下，独立进行研究工作所取得的研究成果。
    除文中已经加以标注引用的内容外，本论文不包含其他个人或集体已经发表或撰写过的研究成果，
    也不含为获得浙江工业大学或其它教育机构的学位证书而使用过的材料。
    对本文的研究作出重要贡献的个人和集体，均已在文中以明确方式标明。
    本人承担本声明的法律责任。

    作者签名：\hfill 日期：\fillYear 年\fillMonth 月 \hspace*{6em}

  \vspace*{24bp}
  \begin{center}
    \zihao{3}\heiti\textbf{学位论文版权使用授权书}
  \end{center}

    \doublespacing\zihao{-4}
    本学位论文作者完全了解学校有关保留、使用学位论文的规定，
    同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。
    本人授权浙江工业大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，
    可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。

    \begin{table}[!h]
      \renewcommand\arraystretch{1.5}
      \begin{tabular}{ll}
        \hspace{1.5em}本学位论文属于 & 1、保密$\square$，在一年解密后适用本授权书。\\
        & 2、保密$\square$，在二年解密后适用本授权书。 \\
        & 3、保密$\square$，在三年解密后适用本授权书。 \\
        & 4、不保密$\square$。 \\
        & （请在以上相应方框内打“√”） \\
      \end{tabular}
    \end{table}

    作者签名：\hfill 日期：\fillYear 年\fillMonth 月 \hspace*{6em}

    导师签名：\hfill 日期：\fillYear 年\fillMonth 月 \hspace*{6em}
    
    \clearpage%{\pagestyle{empty}}
    \thispagestyle{empty}
%论文分类号
    \begin{tabular*}{0.93\hsize}{@{\extracolsep{0.6cm}}r l c r l}   %   这里面的@什么意思
		%\hline
		\zihao{5}中图分类号                   & \zihao{5}TP391       &     &        \zihao{5}学校代码   &     \zihao{5}10337                           \\ %\hline
		\zihao{5}UDC 					& \zihao{5}004 			& 	& 		\zihao{5}密级				&\zihao{5}公开						\\  
		\vspace{0.5cm} %\hline
		\zihao{5}研究生类别				& \zihao{5}\fillCultiviate  &   &     &    \\
	\end{tabular*}	
	{\centering
		{
			\includegraphics[width=15mm]{logo/zjutlogo}
			\includegraphics[width=65mm]{logo/zjutname}
			
			\vspace*{0.1cm}
			\heiti{\zihao{2}硕士学位论文}\\
			\vspace*{2cm}
			\zihao{3}\defTitleCn \\
			\vspace*{0.4cm}
			\zihao{-2}\defTitleEn \\
		}       %\leavevmode
		
		\vspace*{3cm}
	}
	\zihao{-4}

	\begin{tabular*}{0.88\hsize}{@{\extracolsep{\fill}}l b{3.6cm} c l b{3.8cm}}   %   这里面的@什么意思
		%\hline
		作 \qquad   者         & \fillAuthorCn                &    &      第一导师  &     \fillMentorNameCn\hspace{0.2cm}\fillMentorTitleCn \\
		
		申请学位 &  \fillAcademic 	&	& 			&		\\  
		学科专业		& \fillMajor  &   &   培养单位& 计算机学院   \\
    %\end{tabular*}	\\
    %\begin{tabular*}{0.88\hsize}{@{\extracolsep{\fill}}l b{3.6cm} c l b{3.8cm}} 
		研究方向 &  \fillresearchArea	&	& 		答辩委员会主席	&  \fillchairman		\\ 
		
	\end{tabular*}	\\

	\vspace*{3cm}
	{\centering
		\zihao{4}
		{	
			\begin{tabular*}{0.8\hsize}{@{\extracolsep{\fill}}ccc c ccc}   %   这里面的@什么意思
				%\hline
				\hspace{1.0cm} 答辩日期：        & \fillYear      &  年   &       \fillMonth  &     月      & \fillDay &     日\hspace{1.8cm}       \\ %\hline
			\end{tabular*}	\\
		}
	}
    
    }
}

% 摘要相关---------------------------------- 

% 中文摘要
\newcommand{\abstract}[1]{%
    % \noindent {\bfseries {[\defabstractname]}} #1}
    % 垂直空间
    \vspace*{2ex}
    % 摘要
    \begin{center}
        {\zihao{3}\heiti \defabstractname}
    \end{center}
    % 垂直空间
    \vspace*{2ex}
    
    % 摘要实际内容
    #1}
% 英文摘要
\newcommand{\ABSTRACT}[1]{%
    %\noindent {\bfseries {[\defABSTRACTNAME]}} #1}
    % 垂直空间
    \vspace*{2ex}
    % Abstract
    \begin{center}
        {\zihao{3}\heiti \defABSTRACTNAME}
    \end{center}
    % 垂直空间
    \vspace*{2ex}
    
    % 摘要实际内容
    #1}

% 中文关键词
\newcommand{\keywords}[1]{%
    %\vspace{\baselineskip}
    \vspace{1ex}
    \noindent { \bfseries {\defkeywords} } #1}
% 英文关键词
\newcommand{\KEYWORDS}[1]{%
    %\vspace{\baselineskip}
    \vspace{1ex}
    \noindent {\bfseries {\defKEYWORDS}} #1}



% 例子相关 ---------------------------------------------
%\RequirePackage{style/zscexample}



% 超链接相关 -------------------------------------------
% 为减少可能的冲突，习惯上将 hyperref 宏包放在其它宏包之后调用
% 对于章节命令 \chapter、 \section等，默认情况下会为 PDF 自动生成书签
% bookmarks=⟨true|false⟩ 默认生成书签
% hidelinks=true 取消链接的颜色和边框
% bookmarksnumbered=true 书签带章节号
\usepackage[hidelinks,bookmarksnumbered=true]{hyperref}