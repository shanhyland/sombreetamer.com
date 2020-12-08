# Installing

## On Ubuntu

### Installing dependencies

```bash
sudo apt-get update
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install ruby-full python2.7 python-pip nodejs
```

### Installing Libraries

```bash
sudo gem install bundler
npm install
```

### Installing the project

```bash
# cd into the project and install dependencies
bundle install
npm install
```

## Development

### Note concernant Node.js
On doit utiliser une version de node plus basse que 12, sinon on a un problème avec gulp en version 3.9.1.
J'ai installé nvm pour régler le probleme.
Avant de travailler dans ce projet, il faut exécuter la commande
```bash
nvm use v8.17.0
```
Une fois la job terminé pour recommencer à utiliser la version plus à jour de Node
```bash
nvm use node
```

Sur Windows le node manager est Nodist
On dirait par contre qu'il y a un problème quand on essaie de faire matcher la version de npm en utilisant la commande
```bash
nodist npm match
```

### Running local node server

```bash
gulp watch
```

## Build

```bash
gulp build
```

## Deployment

Avant de deployer s'assurer d'avoir commiter sur GitHub

You will need to setup the Droplet with an SSH key: <https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/create-with-openssh/>

S'assurer que le fichier /var/www/video/repo/config est 'configurer' correctement
[remote "origin"]
    url = https://github.com/USER-GITHUB/NOM-DU-PROJET.git

```bash
# preflight
bundle exec cap production deploy:check

# deploying
bundle exec cap production deploy
```