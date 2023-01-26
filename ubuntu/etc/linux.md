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

## Variables

- `getconf -a`

> Displays all configuration variables for the current system \
> and their values.

**PATH** _Reset to its default value_

```bash
PATH=$(getconf PATH)
```

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
|dmesg|boucle d'informations concernant les interractions avec le noyau (notamment les périphériques)|
|journalctl|affiche les infos nourries par systemd|
|stat|affiche, inode, type fichier / répertoire, périphérique...|
|bat|similaire à cat|
|tree|affiche l'arborescence sous la forme d'un arbre|
|$RANDOM|fonction interne bash générant un nombre pseudo-aléatoire entre 0 et 32767|
|!!:$|retourne les arguments de la commande précédente|
|!$|retourne le dernier argument de la commande précédente (_history_)|
|$_|retourne le dernier argument de la commande précédente|
|find|rechercher des fichiers sur critères|

*exemples*

- `dmesg -w` pour observer de façon continue les évènements adresser au noyau
- `journalctl -f` pour observer de façon continue le journal

## Recherche

|commandes|utilisation|
|:---------|:-----------|
|`find . -type f -exec ls -l {} \;`|exécute la commande `ls -l` sur tous les fichiers du répertoire courant|
|`find . -mmin -1 -exec cat {} \;`|affiche tous les fichiers modifiés il y a moins de 1 minute|

**find ... `\;` vs `+`**

> Variante avec disctinction importante retour à la ligne, flux... `find . -mmin -1 -exec cat {} +` pour afficher tous les fichiers modifiés il y a moins de 1 minute

## Filtrage

|commandes|utilisation|
|:---------|:-----------|
|grep|`cat file_name \| grep "\S"` : supprime toutes les lignes vides|
|sed|`sed -i "s/^$/#/" CPackConfig.cmake` : ajoute un `#` sur toutes les lignes vides; -i modification sur place|

## Services

|commandes|utilisation|
|:---------|:-----------|
|`systemctl [start\|stop\|status\|enable\|disable\|is-enabled] <nom_service>.service` | actions sur un service `<nom_service>` (enable : at boot time)|
|`service --status-all`|renvoie l'état de tous les services|

### Bluetooth

_Activate and use bluetooth from the command line_

`bluetoothctl` command can be used in interactive mode

- main commands : `scan, pair, paired-devices, connect, disconnect, remove, info, show`

> When error `a2dp-sink profile connect failed for 78:44:05:D2:D5:8D: Protocol not available` is logged into `journalctl`, do as follows

```bash
sudo apt-get install pulseaudio-module-bluetooth
sudo killall pulseaudio
pulseaudio --start    
sudo systemctl restart bluetooth
```

_Reference_

- [askubuntu](https://askubuntu.com/questions/1172000/a2dp-sink-profile-connect-failed)

## Fun

```bash
for i in $(seq 0 $(expr $RANDOM % 100)) ; do echo -n $(./list_comprehension_2.py) ; done ; echo
```

**Serveur HTTP** : _une ligne de commande_

- `python3 -m http.server 8000`
- `python2 -m SimpleHTTPServer 8000`

## Special files

|commandes|utilisation|
|---------|-----------|
|/dev/null|ne renvoie rien sur la stdout|
|/dev/zero|produit un flux continue de valeurs NULL (zero values bytes)

_Utilisation_

- `cat /dev/zero > file` : ajoute en permanence des '\0'
- `dd if=/dev/zero of=my_file  count=10` taille non nulle !!
- `cat /dev/null > file` : rien n'est ajouté
- `dd if=/dev/null of=my_file  count=10` aucun bytes copiés

## Commonly things

...read, but what are they exactly ?

### `rc` in...

- for example : `bashrc, vimrc, lcovrc`

means `run commands` or else `run control`

- used for any file that contains startup information for a command
- controls how a program runs 
- contains its initial configuration

## Biblio

- [Cheat sheet](http://cb.vu/unixtoolbox.xhtml)
- [linoxide](https://linoxide.com/linux-how-to/enable-disable-services-ubuntu-systemd-upstart/)
- [stackexchange](https://unix.stackexchange.com/questions/254384/difference-between-dev-null-and-dev-zero)
- [rc stackoverflow](https://superuser.com/questions/173165/what-does-the-rc-in-bashrc-etc-mean)
- [rc esr](http://www.catb.org/~esr/writings/taoup/html/ch10s03.html)
- [linux-france](http://www.linux-france.org/article/memo/node126.html)
