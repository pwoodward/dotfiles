fish_add_path $HOME/.local/bin

if test -f /opt/homebrew/bin/brew
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin
else if test -f /usr/local/bin/brew
    fish_add_path /usr/local/bin
    fish_add_path /usr/local/sbin
else if test -f /home/linuxbrew/.linuxbrew/
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
end

fish_add_path $HOME/tools/bin
fish_add_path $HOME/tools/gobin

fish_add_path /usr/local/opt/postgresql@17/bin
