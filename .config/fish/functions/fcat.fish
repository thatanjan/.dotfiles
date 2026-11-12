function fcat
    set -l target_dir "."
    if test (count $argv) -gt 0
        set target_dir $argv[1]
    end
    
    cat (fd --type f --hidden --exclude .git --exclude node_modules . $target_dir | fzf)
end
