
$if(date)$
\ChapterDate{$title$}{$date$}
$else$
\chapter*{$title$}
\addcontentsline{toc}{chapter}{#1}
$endif$

$body$