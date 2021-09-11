# Notes-Packages

When I started university I started learning to use LaTeX. After my first year the preamble of my notes documents was large enough that I made a separate `.sty` file, called `NotesPackage.sty`. 
After another year this was a mess and I decided to start again. I created `NotesPackage2`. After a third year I wanted to greatly extend the package and the results of this are in this repository.
The source for the initial `NotesPackage` and `NotesPackage2` can be found [here](https://github.com/WilloughbySeago/Uni-Notes/tree/main/NotesPackage).

I decided to split the package into three, each responsible for a different aspect of the document:
* `NotesStyle` &mdash; this package contains all code relevant to the set-up of the document. This relies on the document class being memoir, and will result in an error if this is not the case.
* `NotesMaths` &mdash; this package contains all code relevant to typesetting maths, including importing some common packages and defining some commands.
* `NotesBoxes` &mdash; this package declares a lot of boxes from the [`tcolorbox` package](https://www.ctan.org/pkg/tcolorbox).

Details on how these three packages work is given [here](https://github.com/WilloughbySeago/Notes-Packages/blob/main/Notes-Packages.pdf).

As well as these packages I also wrote styles for glossaries/indexes to use with [`makeindex`](https://mirror.ox.ac.uk/sites/ctan.org/indexing/makeindex/doc/makeindex.pdf).
To go with these I wrote a `.bat` script, `mkindex.bat`, which runs the necessary commands to compile the indices.
To use this script simply edit in the paths to your `.gst` and `.ist` files, place the `.bat` in your PATH and then execute
```batch
mkindex <.tex file name without .tex extension>
```
For example, if your `.tex` file is `main.tex` run
```batch
mkindex main
```
