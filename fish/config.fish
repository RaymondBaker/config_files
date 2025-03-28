if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
#set -g fish_key_bindings fish_vi_key_bindings

fish_add_path ~/.local/bin

direnv hook fish | source
