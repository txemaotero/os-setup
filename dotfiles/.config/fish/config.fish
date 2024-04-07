
fish_add_path /usr/local/gcc-14.1.0/bin
fish_add_path /home/txema/.local/bin/
fish_add_path /home/txema/.cargo/bin/
fish_add_path /home/txema/.lua-language-server/bin/
fish_add_path /home/txema/.cpptools/extension/debugAdapters/bin/
fish_add_path /home/txema/.cmake-3.30.0/bin/

set -x EDITOR nvim


function vim
    nvim $argv
end

function vi
    nvim $argv
end

# Zoxide
zoxide init fish | source

function cd
    z $argv
end

function ls
    exa --icons $argv
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
    exa -l -snew --icons $argv
end

function la
    exa -la --icons $argv
end

function lat
    exa -la -snew --icons $argv
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
