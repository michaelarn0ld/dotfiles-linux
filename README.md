# Dotfiles

Dotfiles is a backup repository containing my personal configuration settings
for aliases, bash, and vim.

## Usage

- Make a new "dotfiles" folder and initialize it as a git repository
```bash
cd ~
mkdir dotfiles
git init --bare $HOME/dotfiles
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
```
- Create an SSH key for the computer being used and add it to GitLab; follow
  the guide here: https://docs.gitlab.com/ee/ssh/
 
- Add the GitLab dotfiles remote to the local repositiry at $HOME/dotfiles:
```bash
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME remote add origin git@gitlab.com:michaelarn0ld/dotfiles.git
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME pull origin main
```

- Restart the shell and you will see the updates

- Note that the "dotfiles" command is an alias for git, specific to the $HOME/dotfiles directory.
  See .aliases for more information.

- Changes and updates are stored using:
```bash
dotfiles add ~/.dotfile_name
dotfiles commit -m "added .dotfile_name"
dotfiles push -u origin main 
```
