function burk
  set host (burklee | fzf)
  if test -n "$host"
    ssh -A $host.spotify.net
  end
end
