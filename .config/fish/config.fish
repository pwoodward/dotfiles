if status is-interactive
    # Commands to run in interactive sessions can go here
end


set theme_color_scheme gruvbox

fish_add_path $HOME/tools/bin

alias docker=podman
set --export DOCKER_AUTH_FILE $HOME/.config/containers/auth.json

