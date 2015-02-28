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
1. LaTeX (on Mac, install with the [MacTeX][] `pkg` installer)
2. [pandoc][] (on Mac, best to install with [Homebrew][])

## Usage

### Creating and formatting your chapters

Store your "chapters" as `post01.md`, `post02.md`, etc., within the `input` folder. Each file should contain title and date information in the header, like so:

    ---
    title: Imagination and Self-Doubt
    author: Joel Dueck
    date: July 18, 2014
    ---
    
    Body of post...

Note:

 * There should *not* be a top-level header in the body of the post.
 * Currently the PDF output does not include the author info anywhere within chapters (it is assumed that the whole book has a single author).
 * There must be a blank line between the `---` and the body of the post.
 * You can include any additional info you want in the headers and optionally incorporate it into the template somewhere; refer to [pandoc][] documentation for details.

Finally, edit the `input/book-meta.md` text file to reflect your book's title, author and date.

### Creating the PDF

When ready, run the `buildbook.sh` shell script. (Make sure you `chmod u+x ./buildbook.sh` to make it executable.) It will output a `Book.pdf` file in the same folder as the script. 

**Note on the table of contents:** On the very first try, your Table of Contents will not be populated in the PDF. The first time xelatex builds your PDF, it needs to run twice in order to fully incorporate the chapter titles into your table of contents.

 as well as a `Book.tex` file in the `./output` folder, where you can further customize the LaTeX generated for the whole book if you want.

Once you have the contents to your liking, this PDF file can theoretically be uploaded straight to CreateSpace for use in a 5.25″ × 8″ sized bound book.


## Future improvements

* Need to work on image inclusion
* Add a second template based on [tufte-latex][] for Ed Tufte-style books (8.5″ × 11″)
* Allow for customizing copyright/license info in `book-meta.md`
* An automated way of creating basic book covers that match 
* Basic support for tags for each chapter, optionally add tags to an index at the end, etc.)

[pandoc]: http://johnmacfarlane.net/pandoc/index.html
[MacTeX]: https://tug.org/mactex/
[Homebrew]: http://brew.sh
[tufte-latex]: https://code.google.com/p/tufte-latex/