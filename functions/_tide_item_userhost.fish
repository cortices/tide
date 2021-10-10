function _tide_item_userhost
    set_color yellow
    printf '%s@' "$USER"
    set_color --bold yellow
    printf '%s' "$hostname"
end
