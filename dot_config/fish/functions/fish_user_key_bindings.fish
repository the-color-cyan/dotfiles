function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default kj backward-char force-repaint
end
