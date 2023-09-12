if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx PATH /Applications/WezTerm.app/Contents/MacOS {$HOME}/.nvim-osx64/bin {$HOME}/.local/bin {$HOME}/.cargo/bin {$HOME}/Library/Python/3.9/bin /Library/TeX/texbin /usr/local/opt/fzf/bin /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /Library/Apple/usr/bin /Library/Frameworks/Python.framework/Versions/3.9/bin /usr/local/mysql/bin

set -gx BAT_THEME "Dracula"
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

