function films --wraps='prints all films on the watchlist'
  set section $(default $argv[1] Common)
  curl -sS $(cat ~/.dotfiles/.films.url) | awk "/^#/{f=0} f * NF; /## $section/{f=1}"
end

function filmsrng --wraps='selects a random film'
  films $argv | sort -R | head -n 1
end
