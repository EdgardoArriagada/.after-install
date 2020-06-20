# configuration goes to ~/.gitconfig
git config --global core.editor "vim"
git config --global pager.branch false
git config --global --replace-all core.excludesfile ~/.after-install/src/main.gitignore

# Colors
git config --global color.diff.meta cyan
git config --global color.diff.commit magenta
