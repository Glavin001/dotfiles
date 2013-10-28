#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir="$(pwd)"                    # dotfiles directory
backupDir="$HOME/.dotfiles_backup/$(date)"            # old dotfiles backup directory
files="bashrc vimrc vim"    # list of files/folders to symlink in homedir

##########

# Show working directory
echo "Using working current: $dir"
echo

# init and update Git submodules
echo "Init and update Git Submodules"
git submodule update --init --recursive
echo

# vim-pathogen install: http://stackoverflow.com/a/14545852

# create dotfiles_old in homedir
echo "Creating '$backupDir' for backup of any existing dotfiles in ~/"
mkdir -p "$backupDir"
echo "Done."
echo

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd "$dir"
echo "Done."
echo 

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from $HOME/.$file to $backupDir/.$file"
    mv "$HOME/.$file" "$backupDir/$file"
    if [ -e "$HOME/.$file" ]
    then
        echo "Removing existing dotfile"
        rm "$HOME/.$file"
    fi
    echo "Creating symlink to $file in home directory."
    ln -s "$dir/$file" "$HOME/.$file"
	echo
done
echo 

echo "Important: On Mac the ~/.bashrc file is not executed automatically when logging in to bash shell through the Terminal app."
echo "This can be easily resolved by appending the following line to your '~/.bash_profile':"
echo "  source ~/.bashrc"
echo
read -p "Would you like to set that up automatically now? [Y/n]: " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Yes, apply fix now.
    echo "Backing up your .bash_profile"
    cp "$HOME/.bash_profile" "$backupDir/.bash_profile"
    
    echo "Applying Mac fix to your ~/.bash_profile"
    echo "# Execute your ~/.bashrc file automatically on login." >> "$HOME/.bash_profile"
    echo 'source "~/.bashrc"' >> "$HOME/.bash_profile"

    echo "Done."
fi

echo
echo "For further information or to post an issue please go to the GitHub repository page:"
echo "  https://github.com/Glavin001/dotfiles"
echo "Thank you and enjoy!"
echo


