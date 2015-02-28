# Simple Book Machine

I wanted a basic but well-designed template/system for taking a bunch of "dated" Markdown files (e.g., blog posts) and producing a properly typeset PDF that I could take right to CreateSpace and order as a bound book.

Most of the work here is in the LaTeX template. I've used the "memoir" class and created a template suitable for adapting blogs to print, and incorporating best practices from Bringhurst's *Elements of Typographic Style*:

* Title page, copyright info page and optional Table of Contents
* Footnote numbers within the footnote are set in the same size as the footnote text vs. being superscripted
* Ability to use any OpenType or TrueType font on your computer
* Text block and line length set using classical proportions
* Hyperlinks are converted to footnotes
* Custom chapter style optionally incorporating a date for each chapter instead of a chapter number (excluding appendix chapters)

## Requirements

0. A *nix or Mac OS environment (mainly for the included shell script)
1. LaTeX
2. [pandoc][]

## Usage

Store your "chapters" as `post01.md`, `post02.md`, etc., within the `input` folder. Edit the `input/book-meta.md` text file to reflect your book's title, author and date.

When ready, run the `buildbook.sh` shell script. (Make sure you `chmod u+x ./buildbook.sh` to make it executable.) It will output a Book.pdf file in the same folder, as well as a `Book.tex` file in the output folder, where you can further customize the LaTeX generated for the whole book if you want.

[pandoc]: http://johnmacfarlane.net/pandoc/index.html
