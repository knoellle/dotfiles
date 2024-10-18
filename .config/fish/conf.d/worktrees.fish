function gwa
  set -l NAME "$(basename $(command git worktree list | head -n1 | cut -d' ' -f1))-$argv[1]"
  set -l CURRENT_WORKTREE_PATH "$(git rev-parse --show-toplevel)"
  set -l BASE_WORKTREE_PATH "$(command git worktree list | head -n1 | cut -d' ' -f1)"
  set -l NEW_WORKTREE_PATH "$CURRENT_WORKTREE_PATH/../$NAME"
  echo $NEW_WORKTREE_PATH

  command git worktree add "$NEW_WORKTREE_PATH" "$(git rev-parse HEAD)"
  cd "$NEW_WORKTREE_PATH"
end

alias gwl="git worktree list"

function gwj
  set -l WORKTREE "$(git worktree list | fzf | cut -d' ' -f1)"
  cd $WORKTREE
end

function gwd
  set -l ORIGINAL_WORKTREE "$(git worktree list | head -n1 | cut -d' ' -f1)"
  command git worktree remove "$(pwd)" && cd $ORIGINAL_WORKTREE
end
