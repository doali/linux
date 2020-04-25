# Linux

## Version

- ```cat /etc/os-release```
- ```lsb_release -a```
- ```cat /etc/issue```
- ```cat /etc/debian_version```
- ```cat /etc/lsb-release```
- ```cat /proc/version```
- ```uname -a```
- ```cat /proc/version_signature```


## Obtenir de l'aide

- `man`
- `info`
- `whatis`
- `apropos`

## Commandes frequentes

|commandes|description|
|:---------|:-----------|
|man|manuel de référence dans le terminal|
|info|information sur une commande|
|whatis|affiche une ligne de description des pages de manuels|
|wget|télécharge des ressources via HTTP, HTTPS, FTP en mode non interractif|
|lsblk|liste les blocs des périphériques présents (notamment les clefs USB par exemple|
|dd|copie de fichiers, reproduction de zones de disques, affranchissement par rapport au système de fichiers|
|eject|ejecte le media amovible|
|curl|transfert des données sur un serveur (récupère ou envoie) via divers protocoles|
|lftp|transfert de fichiers via ftp, ...|
|dpkg|gestionnaire de paquets|
|apt-get|utilitaire pour la gestion de paquets|
|rsync|synchronise des fichiers, répertoires : nouveaux, modifiés depuis un hôte|
|chsh|permet de changer d'interpréteur par défaut|
|git|gestionnaire de versions|
|cmake|générateur du Makefile pour la compilation|
|make|lancement de la compilation|
|docker|logiciel permettant la conteneurisation|
|mktemp|creation d'un repertoire / fichier temporaire|
|dmesg|boucle d'informations concernant les interractions avec le noyau|
|journalctl|affiche les infos nourries par systemd|
|stat|affiche, inode, type fichier / répertoire, périphérique...|
|bat|similaire à cat|
|tree|affiche l'arborescence sous la forme d'un arbre|
|$RANDOM|fonction interne bash générant un nombre pseudo-aléatoire entre 0 et 32767|
|!!:$|retourne les arguments de la commande précédente|
|!$|retourne les arguments de la commande précédente|

## Filtrage

|commandes|utilisation|
|:---------|:-----------|
|grep|`cat <file> | grep "\S"` : supprime toutes les lignes vides|
|sed|`sed -i "s/^$/#/" CPackConfig.cmake` : ajoute un `#` sur toutes les lignes vides; -i modification sur place|

## Services

|commandes|utilisation|
|:---------|:-----------|
|`systemctl [start|stop|status|enable|disable|is-enabled] <nom_service>.service` | actions sur un service `<nom_service>` (enable : at boot time)|

## Fun

```bash
for i in $(seq 0 $(expr $RANDOM % 100)) ; do echo -n $(./list_comprehension_2.py) ; done ; echo
```

## Special files


|commandes|utilisation|
|---------|-----------|
|/dev/null|ne renvoie rien sur la stdout|
|/dev/null|produit un flux continue de valeurs NULL (zero values bytes)

_Utilisation_

- `cat /dev/zero > file` : ajoute en permanence des '\0'
- `dd if=/dev/zero of=my_file  count=10` taille non nulle !!
- `cat /dev/null > file` : rien n'est ajouté
- `dd if=/dev/null of=my_file  count=10` aucun bytes copiés

## Biblio

- [Cheat sheet](http://cb.vu/unixtoolbox.xhtml)
- [linoxide](https://linoxide.com/linux-how-to/enable-disable-services-ubuntu-systemd-upstart/)
- [stackexchange](https://unix.stackexchange.com/questions/254384/difference-between-dev-null-and-dev-zero)
