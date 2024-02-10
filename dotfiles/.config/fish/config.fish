set -x PATH $PATH /home/txema/.local/bin/ /home/txema/.cargo/bin/ /home/txema/.lua-language-server/bin/

function vim
    nvim $argv
end

function vi
    nvim $argv
end

function ls
    exa --icons $argv
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
