function current_dir() {
    local dir=$PWD
    if [[ $dir == $HOME ]]; then
        dir="~"
    else
        dir=${dir##*/}
    fi
    echo $dir
}

# Original non-plugin tile update
# function change_tab_title() {
#     local title=$1
#     command nohup zellij action rename-tab $title >/dev/null 2>&1
# }

# Change tab title using zellij-tab-name plugin
function change_tab_title() {
    local title=$1

    # Optional: Truncate long names
    if [[ ${#title} -gt 15 ]]; then
        title="${title:0:12}..."
    fi

    # Escape special characters
    title="${title//\\/\\\\}"
    title="${title//\"/\\\"}"
    title="${title//\{/\{\{}"
    title="${title//\}/\}\}}"

    zellij pipe \
        --name change-tab-name \
        -- "{\"pane_id\": \"$ZELLIJ_PANE_ID\", \"name\": \"{tab_position}: $title\"}" \
        &>/dev/null &!
}

function set_tab_to_working_dir() {
    local title=$(current_dir)
    change_tab_title $title
}

function set_tab_to_command_line() {
    local cmdline=$1
    change_tab_title $cmdline
}

# Enable automatic tab naming in Zellij
if [[ -n $ZELLIJ ]]; then
    add-zsh-hook precmd set_tab_to_working_dir
    #add-zsh-hook preexec set_tab_to_command_line
fi
