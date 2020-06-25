## git configuration
if git --version >/dev/null 2>&1; then
  # configuration goes to ~/.gitconfig
  git config --global core.editor "vim"
  git config --global pager.branch false
  git config --global --replace-all core.excludesfile ~/.after-install/src/main.gitignore

  # Colors
  git config --global color.diff.meta cyan
  git config --global color.diff.commit magenta
fi

## zsh configuration
if [ -f ~/.zshrc ]; then
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
  sed -i 's/plugins=(git)//g' ~/.zshrc
  echo "source ~/.zsh-spell-book/main.zsh" >> ~/.zshrc
fi

