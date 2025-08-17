if ! pidof ssh-agent > /dev/null
  echo "Starting ssh agent"
  ssh-agent -c > ~/.ssh-agent.fish
end
if test -e ~/.ssh-agent.fish
  eval (cat ~/.ssh-agent.fish) > /dev/null
end
