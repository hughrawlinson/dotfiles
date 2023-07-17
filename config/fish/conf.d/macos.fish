if status --is-interactive; and test Darwin = (uname -a | cut -d' ' -f1)
    defaults write -g ApplePressAndHoldEnabled -bool false
end
