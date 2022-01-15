:: ECHO OFF stops commands showing as they are run
ECHO OFF
:: TITLE makeindex sets the title of the command line to makeindex
TITLE makeindex
:: Run the makeindex files for the index, glossary, and acronyms
makeindex -q -s <path to indexstyle.ist> %1
makeindex -q -s <path to glossarystyle.gst> -o %1.gls %1.glo
makeindex -q -s <path to glossarystyle.gst> -o acronym.gls acronym.glo
