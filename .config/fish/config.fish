set PATH $PATH /home/mystery/.local/bin

# disable standard fish greeting
set fish_greeting

function task
  if test -z "$TASKCONTEXT"
    command task $argv
  else
    command task rc.verbose=false rc.context="$TASKCONTEXT" $argv
  end
end
