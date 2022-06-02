if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin edc/bass
fundle plugin tuvistavie/fish-ssh-agent
fundle plugin rstacruz/fish-asdf
fundle plugin evanlucas/fish-kubectl-completions
fundle init
