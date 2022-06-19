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
  font-caskaydia-cove-nerd-font \
  neofetch

# Unimatrix
pip install git+https://github.com/will8211/unimatrix.git && \
  sudo mv ~/Library/Python/3.8/bin/unimatrix /usr/local/bin

source ~/.after-install/common.sh
