if status is-interactive
    # Commands to run in interactive sessions can go here
end
export CC="gcc-11"
set -gx PATH {$HOME}/.local/bin /Library/TeX/texbin /usr/local/opt/fzf/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /Library/Apple/usr/bin /Library/Frameworks/Python.framework/Versions/3.9/bin

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

