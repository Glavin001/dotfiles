Dotfiles
========

> Automated installer for personal dotfiles.

## Features
- Automated, interactive installer (See *Installation* below for details).
- Backup of original files, before installation of these dotfiles.

## Installation
Run the following command in your Terminal.

> *Note*: Make sure that you do not already have any dotfiles installed a `$HOME/.vimrc`, as this will clone the repo and setup a symlink to that path.

#### 1) Clone via SSH:
```bash
git clone git@github.com:Glavin001/dotfiles.git ; cd dotfiles ; ./install.sh
```
#### 2) Clone via HTTP:
```bash
git clone https://github.com/Glavin001/dotfiles.git ; cd dotfiles ; ./install.sh
```

## Backup
Backup of original files are located in `~/.dotfiles_backup/`, each in a directory named after the backup date. 

## More Information
See http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
### Dawson Reid's ([@dreid93](https://github.com/dreid93)) original dotfiles
https://github.com/dreid93/dotfiles
