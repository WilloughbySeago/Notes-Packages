:: ECHO OFF stops commands showing as they are run
ECHO OFF
:: TITLE makeindex sets the title of the command line to makeindex
TITLE makeindex
:: Run the makeindex files for the index, glossary, and acronyms
makeindex -s <path to indexstyle.ist> %1
makeindex -s <path to glossarystyle.gst> -o %1.gls %1.glo
makeindex -s <path to glossarystyle.gst> -o acronym.gls acronym.glo
