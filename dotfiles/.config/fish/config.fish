
fish_add_path /home/txema/.local/bin/

set -x EDITOR nvim

function vim
    nvim $argv
end

function vi
    nvim $argv
end

# Zoxide
zoxide init fish | source
# Prompt
starship init fish | source

function cd
    z $argv
end

function ls
    eza --icons $argv
end

function gst
    git status
end

function gdot
    git checkout .
end

function gl
    git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit
end


function lst
    eza -l -snew --icons $argv
end

function la
    eza -la --icons $argv
end

function lat
    eza -la -snew --icons $argv
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
