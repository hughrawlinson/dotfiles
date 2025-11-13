if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin edc/bass
fundle plugin tuvistavie/fish-ssh-agent
fundle plugin evanlucas/fish-kubectl-completions
fundle plugin ngladkikh/fish_env
fundle plugin berk-karaal/loadenv.fish
fundle plugin jillyerd/plugin-git
fundle init
