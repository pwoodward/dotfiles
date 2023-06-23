FROM alpine:edge

ENV USER=dev
ENV UID=1000

# Install Dev tools:
# Fish shell
# - Hack nerd font
# - util-linux (Needed for omf)
# Neovim
# Git

RUN apk update && \ 
    apk add --no-cache neovim zsh git ripgrep lazygit font-hack-nerd curl gcc musl-dev zsh-syntax-highlighting zsh-autosuggestions && \
    rm -f /tmp/* /etc/apk/cache/* && \
    adduser \
    --disabled-password \
    --gecos "" \
    --uid "$UID" \
    "$USER" && \
    sed -i -e "s/bin\/bash/usr\/bin\/zsh/" /etc/passwd


WORKDIR /home/$USER
# Add user and config
COPY --chown=1000:0  .config .config

USER 1000
ENV SHELL /usr/bin/zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

COPY --chown=1000:0  .zshrc .zshrc
COPY --chown=1000:0  .p10k.zsh .p10k.zsh
COPY --chown=1000:0  .oh-my-zsh .oh-my-zsh

# Nvim setup
RUN rm -rf ~/.config/nvim && \
    git clone https://github.com/LazyVim/starter ~/.config/nvim && \
    rm -rf ~/.config/nvim/.git && \
    nvim --headless "+Lazy! sync" +qa


ENTRYPOINT zsh
