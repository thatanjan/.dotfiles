function fdiff
  set -l sel(git diff --name-only; git ls-files --others --exclude-standard)
  echo "$sel"
    set -l selection (git diff --name-only; git ls-files --others --exclude-standard $argv | fzf)
    if test -n "$selection"
        git diff $selection
    end
end
