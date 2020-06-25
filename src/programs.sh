! tilda --version >/dev/null 2>&1 && \
  sudo apt-get install tilda -y

! xdotool -version >/dev/null 2>&1 && \
  sudo apt-get install xdotool -y

! xclip -version >/dev/null 2>&1 && \
  sudo apt-get install xclip -y

! git --version >/dev/null 2>&1 && \
  sudo apt-get install git -y

! zsh --version >/dev/null 2>&1 && \
  sudo apt-get install zsh -y

! vim --version >/dev/null 2>&1 && \
  sudo apt-get install vim -y

! tmux -V >/dev/null 2>&1 && \
  sudo apt-get install tmux -y

! flameshot --version >/dev/null 2>&1 && \
  sudo apt-get install flameshot -y

! code --version >/dev/null 2>&1 && \
  sudo snap install --classic code

####
# The following scripts may depend on previous ones
####

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sudo apt-get install fonts-powerline
  # change in .zshrc ZSH_THEME="agnoster" and comment git plugins
fi

# zsh-spell-book
if [ ! -d ~/.zsh-spell-book ]; then
  git clone https://github.com/EdgardoArriagada/.zsh-spell-book ~/.zsh-spell-book
  echo "source ~/.zsh-spell-book/main.zsh" >> ~/.zshrc
fi

# nvm
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
fi


