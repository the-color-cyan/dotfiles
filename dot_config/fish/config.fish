if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    neofetch
end

function fish_mode_prompt
end

# direnv
direnv hook fish | source

set fish_key_bindings fish_user_key_bindings
set fish_sequence_key_delay_ms 100
set -gx EDITOR nvim
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -g theme_color_scheme nord
set -g theme_display_vi yes
set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_newline_cursor yes

# starship init fish | source
