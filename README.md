# Curriculum vitae
Please find my current [curriculum vitae](https://github.com/MarkHedleyJones/CV/raw/main/MarkHedleyJones-CV.pdf).

It is writen in [LaTeX](https://www.latex-project.org/). Feel free to adapt my source files for yourself.

## Compiling
The LaTeX source is in [`.source/`](.source). Build the CV with **XeLaTeX** (it sets the document in the [Inter](https://rsms.me/inter/) typeface via `fontspec`):

    cd .source
    xelatex sidebar.tex     # run twice so the sidebar layout settles

`sidebar.tex` is the one-page CV; `singlecol-ats.tex` is a plain single-column variant for applicant-tracking systems.

## Dependencies
* XeLaTeX
* The **Inter** font
* TeX packages: `fontspec`, `fontawesome5`, `tikz`, `enumitem`, `ragged2e`, `eso-pic`, `textpos`, `microtype`, `tcolorbox`

On Fedora:

    sudo dnf install texlive-xetex texlive-fontawesome5 texlive-microtype texlive-tcolorbox texlive-textpos rsms-inter-fonts
