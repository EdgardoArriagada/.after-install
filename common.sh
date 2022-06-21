# fnm
curl -fsSL https://fnm.vercel.app/install | bash

if [ -f ~/.zshrc ]; then
  # fzf-tab
  git clone https://github.com/Aloxaf/fzf-tab
  echo "source ~/fzf-tab/fzf-tab.plugin.zsh" >> ~/.zshrc

  # syntax highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
  echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

  # autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

  # alient prompt
  git clone https://github.com/eendroroy/alien.git
  cd alien
  git submodule update --init --recursive

  # zsh-spell-book
  git clone https://github.com/EdgardoArriagada/.zsh-spell-book ~/.zsh-spell-book
  echo "source ~/.zsh-spell-book/main.zsh" >> ~/.zshrc
fi

## git diff-highlighting (required for tig)
git clone https://github.com/git/git/tree/master/contrib/diff-highlight
(cd ~/git/contrib/diff-highlight && \
  make diff-highlight && \
  sudo mv diff-highlight /usr/local/bin)
