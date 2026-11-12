function fgd
    set -l selection (git diff --name-only $argv | fzf)
    if test -n "$selection"
        git diff $selection
    end
end

