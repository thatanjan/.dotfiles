# Installation: Save to ~/.config/fish/completions/opencode.fish

function __opencode_completions
    set -l args (commandline -opc)
    set -e args[1]
    set -l results (opencode --get-yargs-completions $args 2>/dev/null | grep -v '^\$0$')
    if test (count $results) -eq 0
        __fish_complete_path (commandline -ct)
    else
        printf '%s\n' $results
    end
end

complete -c opencode -f -a '(__opencode_completions)'
