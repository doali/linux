#!/bin/bash

# ============================================
# Star Dict Console Version
# Dictionnaire au format DICT
# --------------------------------------------
# Objet du script
# - installation du paquet sdcv
# - preparation pour telechargement du dictionnaire
# - telechargement du dictionnaire
# - configuration
# --------------------------------------------
# samedi 28 décembre 2019, 10:14:52 (UTC+0100)
# ============================================

readonly SCRIPT_NAME=$(basename ${0})

readonly PATH_DOWNLOAD_DICT=$HOME/install/src/dict-en        # chemin du repertoire pour donnees telechargees
readonly PATH_TO_EXTRACT=${PATH_DOWNLOAD_DICT}/dict-extract  # chemin du repertoire pour y extraire les donnees

readonly FILE_BASE_NAME=dict                                 # nom de base du fichier .tar.bz2
readonly FILE_TAR_BZ2=${FILE_BASE_NAME}.tar.bz2              # nom du fichier .tar.bz2
readonly PATH_DICT=/usr/share/stardict/dic                   # repertoire ou sont cherches les dictionnaires

# Adresses des dictionnaires
readonly FILE_ADDR_HTTP=list-http-sdcv.txt

# --------------------------------------------
# - installation du paquet sdcv
# --------------------------------------------
# Recuperation du paquet
_install_sdcv()
{
  sudo apt install sdcv
}

# --------------------------------------------
# - preparation pour telechargement du dictionnaire
# --------------------------------------------
_prepare()
{
  mkdir -p ${PATH_DOWNLOAD_DICT}
  mkdir -p ${PATH_TO_EXTRACT}
}

# --------------------------------------------
# - telechargement du dictionnaire
# --------------------------------------------
# Traitement dictionnaire
# - au format DICT
# - telechargement && copie vers le repertoire donnees telechargees
# - extraction de l'archive vers le repertoire pour les donnees extraites
# - suppresion de l'archive
_install_xdxf()
{
  local file_http=${1}

  # Verifications
  if [ -z ${file_http} ]; then
    file_http=${FILE_ADDR_HTTP}
  fi

  for i_dico in $(cat ${file_http}); do
    echo "...download ${i_dico}"
    curl -L -o ${PATH_DOWNLOAD_DICT}/${FILE_TAR_BZ2} ${i_dico} && tar -jxvf ${PATH_DOWNLOAD_DICT}/${FILE_TAR_BZ2} -C ${PATH_TO_EXTRACT} && rm ${PATH_DOWNLOAD_DICT}/${FILE_TAR_BZ2}
done
}

# --------------------------------------------
# - configuration
# --------------------------------------------
_finish_install()
{
  sudo mkdir -p ${PATH_DICT}
  # Lien symbolique pour stardict
  for i_path in $(ls ${PATH_TO_EXTRACT}); do
    echo "...sets ${i_path}"
    sudo ln -sf ${PATH_TO_EXTRACT}/${i_path} ${PATH_DICT} 
  done

  echo "Installation finished"
}

_usage() {
    echo "USAGE" >&2
    echo -e "\t${SCRIPT_NAME} [<FILE_ADDR_HTTP>]" >&2
}

_main()
{
  _install_sdcv
  _prepare
  _install_xdxf ${1}
  _finish_install
}

# ====================
if [ ${#} -eq 1 ]; then
  if [ -f "${1}" ]; then
    _main ${1}
  else
    echo "Error ${1} does not exist"
    exit 1
  fi
elif [ ${#} -eq 0 ]; then
  echo "Reading info from ${FILE_ADDR_HTTP}"
  _main
else
  _usage
fi
