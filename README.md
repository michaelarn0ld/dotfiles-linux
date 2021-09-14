# Dotfiles

Dotfiles is a backup repository containing my personal configuration settings
for aliases, bash, and vim.

## Installation

- Navigate to $HOME to install the folder:
```bash
git clone https://gitlab.com/michaelarn0ld/dotfiles.git
``` 
- Move all dotfiles from the clone to $HOME except for .git and delete
  the folder

## Usage

- Make a new "dotfiles" folder and initialize it as a git repository
```bash
cd ~
mkdir dotfiles
git init --bare $HOME/dotfiles
dotfiles config --local status.showUntrackedFiles no
```
- Note that the "dotfiles" command is an alias for git, specific to the 
  $HOME/dotfiles directory. See .aliases for more information.

- Create an SSH key for the computer being used and add it to GitLab; follow
  the guide here: https://docs.gitlab.com/ee/ssh/
 
- Start a new empty GitLab project repository and add the remote to the local
 $HOME/dotfiles:
```bash
dotfiles remote add origin git@gitlab.com:michaelarn0ld/<<repo_name>>.git
dotfiles branch -M main
dotfiles add ~/.dotfile_name
dotfiles commit -m "added .dotfile_name"
dotfiles push -u origin main 
```
