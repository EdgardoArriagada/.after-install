brew install --cask iterm2 font-hack-nerd-font

brew install \
  lsd \
  tmux \
  bat \
  tig \
  neovim \
  ripgrep \
  sd \
  nvm \
  gnupg2 \
  gh \
  pinentry-mac\ \
  fd \
  tldr \
  git-delta \
  sox \
  coreutils \
  fzf \
  btop \
  neofetch

# Unimatrix
pip install git+https://github.com/will8211/unimatrix.git && \
  sudo mv ~/Library/Python/3.8/bin/unimatrix /usr/local/bin

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

## zsh configuration
if [ -f ~/.zshrc ]; then
  # oh my zsh
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
  sed -i 's/plugins=(git)//g' ~/.zshrc

  # fzf-tab
  git clone https://github.com/Aloxaf/fzf-tab
  echo "source ~/fzf-tab/fzf-tab.plugin.zsh" >> ~/.zshrc

  # syntax highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
  echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

  # autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

  # zsh-spell-book
  git clone https://github.com/EdgardoArriagada/.zsh-spell-book ~/.zsh-spell-book
  echo "source ~/.zsh-spell-book/main.zsh" >> ~/.zshrc
fi

## git diff-highlighting (required for tig)
git clone https://github.com/git/git/tree/master/contrib/diff-highlight
(cd ~/git/contrib/diff-highlight && \
  make diff-highlight && \
  sudo mv diff-highlight /usr/local/bin)
