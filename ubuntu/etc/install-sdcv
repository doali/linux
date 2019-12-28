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

PATH_DOWNLOAD_DICT=$HOME/install/src/dict-en        # chemin du repertoire pour donnees telechargees
PATH_TO_EXTRACT=${PATH_DOWNLOAD_DICT}/dict-extract  # chemin du repertoire pour y extraire les donnees

FILE_BASE_NAME=dict                                 # nom de base du fichier .tar.bz2
FILE_TAR_BZ2=${FILE_BASE_NAME}.tar.bz2              # nom du fichier .tar.bz2
PATH_DICT=/usr/share/stardict/dic                   # repertoire ou sont cherches les dictionnaires

# Adresse du dictionnaire
HTTP_DICT_EN=http://download.huzheng.org/dict.org/stardict-dictd_www.dict.org_gcide-2.4.2.tar.bz2 
HTTP_DICT_EN_FR=http://downloads.sourceforge.net/xdxf/stardict-comn_sdict_axm03_English_French-2.4.2.tar.bz2

# --------------------------------------------
# - installation du paquet sdcv
# --------------------------------------------
# Recuperation du paquet
sudo apt install sdcv

# --------------------------------------------
# - preparation pour telechargement du dictionnaire
# --------------------------------------------
mkdir -p ${PATH_DOWNLOAD_DICT}
mkdir -p ${PATH_TO_EXTRACT}

# --------------------------------------------
# - telechargement du dictionnaire
# --------------------------------------------
# Traitement dictionnaire
# - au format DICT
# - telechargement && copie vers le repertoire donnees telechargees
# - extraction de l'archive vers le repertoire pour les donnees extraites
# - suppresion de l'archive
for i_dico in "${HTTP_DICT_EN}" "${HTTP_DICT_EN_FR}"; do
	echo "...download ${i_dico}"
	curl -L -o ${PATH_DOWNLOAD_DICT}/${FILE_TAR_BZ2} ${i_dico} && tar -jxvf ${PATH_DOWNLOAD_DICT}/${FILE_TAR_BZ2} -C ${PATH_TO_EXTRACT} && rm ${PATH_DOWNLOAD_DICT}/${FILE_TAR_BZ2}
done

# --------------------------------------------
# - configuration
# --------------------------------------------
sudo mkdir -p ${PATH_DICT}
# Lien symbolique pour stardict
for i_path in $(ls ${PATH_TO_EXTRACT}); do
	echo "...sets ${i_path}"
	sudo ln -sf ${PATH_TO_EXTRACT}/${i_path} ${PATH_DICT} 
done

echo "Installation finished"

