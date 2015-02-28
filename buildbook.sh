#!/bin/bash

# Simple Book Machine
#
# Converts a collection of dated Markdown files (e.g., a collection
# of blog posts) into a well-designed, print-ready PDF, suitable 
# for printing as a bound book using CreateSpace or a similar print-
# on-demand service.
# 
# Store your posts/chapters in ./input as post01.md, post02.md, etc.
# Edit ./input/book-meta.md to reflect your book's title, author and
# date.
# 
# Latest version/more info at: https://github.com/otherjoel/simplebookmachine

{ cat ./input/book-meta.md; echo ""; } > ./output/contents.md

for f in ./input/post*.md; do \
     pandoc --template=latex-templates/chapter-tex.md -t markdown_phpextra "$f"; \
     echo ""; echo ""; \
done >> ./output/contents.md

pandoc ./output/contents.md --toc --template=latex-templates/memoir-blog.tex \
      --standalone -o ./output/Book.tex

# Note you'll have to run the following command twice the first time the PDF is
# generated in order to populate the Table of Contents (if --toc is enabled
# above). Simplest thing is just to run this script twice.
xelatex ./output/Book.tex Book.pdf

rm ./output/contents.md

