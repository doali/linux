#!/usr/bin/bash

# ------------------------------------------------------------------------------
# Conversion d'un fichier .md en un fichier .pdf
# - utilisation du script perso md2html
# - utilisation de wkhtmltopdf
# ------------------------------------------------------------------------------
# jeu. févr.  8 09:37:09 CET 2024
# ------------------------------------------------------------------------------

readonly FILE_MD=$1
readonly FILE_HTML="${FILE_MD%.md}".html
readonly FILE_PDF="${FILE_MD%.md}".pdf
readonly FILE_CSS=md.css

readonly MD2HTML_BIN=~/.local/bin/md2html
readonly CONV_HTML2PDF=wkhtmltopdf

# Conversion de md -> html
${MD2HTML_BIN} ${FILE_MD}
[ ${?} -ne 0 ] && echo "KO Conversion de ${FILE_MD} en ${FILE_HTML}"

${CONV_HTML2PDF} ${FILE_HTML} ${FILE_PDF}
[ ${?} -ne 0 ] && echo "KO Conversion de ${FILE_HTML} en ${FILE_HTML}"

# Nettoyage
[ -e ${FILE_CSS} ] && rm ${FILE_CSS} && echo "OK suppression de ${FILE_CSS}"
[ -e ${FILE_HTML} ] && rm ${FILE_HTML} && echo "OK suppression de ${FILE_HTML}"
