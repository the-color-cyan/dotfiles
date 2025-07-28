source /etc/fish/config.fish

if status is-interactive
    # only show fastfetch at SHLVL <= 2
    if test "$SHLVL" -le 2
        fastfetch
    end
end

function fish_greeting
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

starship init fish | source
