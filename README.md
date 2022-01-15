# Notes-Packages

When I started university I started learning to use LaTeX. After my first year the preamble of my notes documents was large enough that I made a separate `.sty` file, called `NotesPackage.sty`. 
After another year this was a mess and I decided to start again. I created `NotesPackage2`. After a third year I wanted to greatly extend the package and the results of this are in this repository.
The source for the initial `NotesPackage` and `NotesPackage2` can be found [here](https://github.com/WilloughbySeago/Uni-Notes/tree/main/NotesPackage).

I decided to split the package into two packages and a class, each responsible for a different aspect of the document:
* `NotesClass` &mdash; this class contains all code relevant to the set-up of the document.
* `NotesMaths` &mdash; this package contains all code relevant to typesetting maths, including importing some common packages and defining some commands.
* `NotesBoxes` &mdash; this package declares a lot of boxes from the [`tcolorbox` package](https://www.ctan.org/pkg/tcolorbox).

Details on how these three packages work is given [here](https://github.com/WilloughbySeago/Notes-Packages/blob/main/Notes-Packages.pdf).

Also in this repository is a package called `ParticlesPackage`, which is simply a list of definitions for commands for inserting symbols for particles.
All fundamental particles are included.
Each particle typically has four commands associated with it, for example `\Pelectron` for an electron, or the short form `\Pe`, and `\APelectron` or `\APe` for an antielectron (positron).
There are some package options for typesetting the particles as upright or italic (upright is the preffered standard but many people don't follow it).
There are also three gluons (red, blue and green) which appear coloured in the document and a package option to turn this off.

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

Also included in this repository are `.cwl` files for the two packages and class.
These are used by [TeXtudio](https://www.texstudio.org/) to autocomplete commands.
