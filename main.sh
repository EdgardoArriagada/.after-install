sudo apt install -y \
  pinentry-tty \
  xdotool \
  xclip \
  git \
  zsh \
  vim \
  tree \
  tmux \
  python3-pip \
  rofi \
  htop \
  curl \
  stow \
  sxhkd \
  bat

! code --version >/dev/null 2>&1 && \
  sudo snap install --classic code

if ! nvim --version >/dev/null 2>&1; then
  sudo snap install nvim --classic
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

if [ ! -d ~/tdrop ]; then
  sudo apt install -y gawk
  git clone https://github.com/noctuid/tdrop ~/tdrop
  (cd ~/tdrop && sudo make install)
fi

[ ! -d ~/snap/postman ] && \
  sudo snap install postman

if [ ! -d ~/sent ]; then
  sudo apt install -y farbfeld libxft2-dev
  git clone https://git.suckless.org/sent ~/sent
  (cd ~/sent && make && sudo mv sent /usr/local/bin)
fi

#! heroku -v >/dev/null 2>&1 && \
#  curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sudo apt-get install fonts-powerline
  # if you fail password at setting zsh as default shell,
  # use `chsh -s $(which zsh)` to try again
fi

# nvm
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
fi

# rbenv
if [ ! -d ~./rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    $(cd ~/.rbenv && src/configure && make -C src)
  # https://github.com/rbenv/ruby-build#readme
fi

## zsh configuration
if [ -f ~/.zshrc ]; then
  # oh my zsh
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
  sed -i 's/plugins=(git)//g' ~/.zshrc

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
