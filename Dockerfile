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
    apk add --no-cache neovim fish git font-hack-nerd curl util-linux su-exec && \
    rm -f /tmp/* /etc/apk/cache/* && \
    adduser \
    --disabled-password \
    --gecos "" \
    --uid "$UID" \
    "$USER" && \
    sed -i -e "s/bin\/ash/usr\/bin\/fish/" /etc/passwd


# Add user and config
COPY --chown=1000:0  .config /home/$USER/.config

WORKDIR /home/$USER

USER 1000
ENV SHELL /usr/bin/fish

# OMF install
RUN curl -k https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install && \
    fish install --noninteractive && \
    rm install && \
#RUN curl -L https://get.oh-my.fish | fish --noninteractive && \
    fish -c "omf install bobthefish"


# Nvim setup
RUN sh -c 'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
    nvim --headless +PlugInstall +qa


ENTRYPOINT fish
