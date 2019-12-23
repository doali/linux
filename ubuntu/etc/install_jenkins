# Modification de la liste des paquets
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Liste jenkins de paquets
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Mise à jour de la liste des paquets
sudo apt update

# Installation des paquets de jenkins
sudo apt install jenkins
