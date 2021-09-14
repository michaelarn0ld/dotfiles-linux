# Dotfiles

Dotfiles is a backup repository containing my personal configuration settings
for aliases, bash, and vim.

## Installation

- Download the .aliases file and move to the $HOME folder
```bash
mv ~/downloads/aliases $HOME/.aliases
```


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
 
- Add the GitLab dotfiles remote to the local repositiry at $HOME/dotfiles:
```bash
dotfiles remote add origin git@gitlab.com:michaelarn0ld/dotfiles.git
dotfiles branch -M main
dotfiles pull origin main
```

- Changes and updates are stored using:
```bash
dotfiles add ~/.dotfile_name
dotfiles commit -m "added .dotfile_name"
dotfiles push -u origin main 
```
