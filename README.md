# Notes-Packages

When I started university I started learning to use LaTeX. After my first year the preamble of my notes documents was large enough that I made a separate `.sty` file, called `NotesPackage.sty`. 
After another year this was a mess and I decided to start again. I created `NotesPackage2`. After a third year I wanted to greatly extend the package and the results of this are in this repository.
The source for the initial `NotesPackage` and `NotesPackage2` can be found [here](https://github.com/WilloughbySeago/Uni-Notes/tree/main/NotesPackage).

I decided to split the package into three, each responsible for a different aspect of the document:
* `NotesStyle` &mdash; this package contains all code relevant to the set-up of the document. This relies on the document class being memoir, and will result in an error if this is not the case.
* `NotesMaths` &mdash; this package contains all code relevant to typesetting maths, including importing some common packages and defining some commands.
* `NotesBoxes` &mdash; this package declares a lot of boxes from the [`tcolorbox` package](https://www.ctan.org/pkg/tcolorbox).
