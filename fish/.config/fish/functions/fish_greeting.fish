function fish_greeting
    if not begin ; [ -n "$SSH_CLIENT" ] ; or [ -n "$SSH_TTY" ] ; end ;
        neofetch
    end
end
