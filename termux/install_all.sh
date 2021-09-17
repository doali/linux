for i in $(cat installed_packages.bck | tail +2 | cut -d/ -f1); do echo $i && pkg install $i; done
