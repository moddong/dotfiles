if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr vi nvim
    abbr vim nvim
    abbr gs git status
    abbr ga git add
    abbr gf git fetch
    abbr gF git pull
    abbr gp git push
    abbr gco git checkout
    abbr gc git commit -m
    abbr tree lsd --tree
    abbr ls lsd
    abbr ll lsd -hl
    abbr la lsd -ahl
    abbr p paru
    abbr parui "paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
    abbr parur "paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rns"
end


set -gx PATH "$HOME/.local/bin" $PATH
set --export EDITOR nvim



