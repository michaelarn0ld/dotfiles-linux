# Dotfiles

Dotfiles is a backup repository containing command line scripts and
configuration settings for aliases, bash, and vim

## Usage

- Make a $HOME/dotfiles directory and initialize it as a bare git repository
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

- Restart the shell to register the configuration settings

- Changes to the dotfiles repository are updated to the remote using: 
```bash
dotfiles add ~/.dotfile_name
dotfiles commit -m "added .dotfile_name"
dotfiles push -u origin main 
```

- Note that the "dotfiles" command is an alias for git, specific to the $HOME/dotfiles directory.
  See .aliases for more information

## License

Copyright © 2021 Michael Arnold

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
