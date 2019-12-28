# suppression d'une ancienne installation de docker
sudo apt-get remove docker docker-engine docker.io

# installation de docker
sudo apt install docker.io

# lancer le service docker
sudo systemctl start docker

# activer docker au demarrage
sudo systemctl enable docker

# ajouter l'utilisateur au groupe docker
sudo usermod -a -G docker $USER
