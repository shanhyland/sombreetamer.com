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