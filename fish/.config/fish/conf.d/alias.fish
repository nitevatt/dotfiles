alias gbdd "git branch -vv | grep ': gone' | grep -v '\*' | awk '{print $1}' | xargs -r git branch -d"
alias gl "git log --all --decorate --oneline --graph"
alias gp "git push -u origin HEAD"
alias gs "git status -sb"
alias gwa "git worktree add --guess-remote"
alias lg "lazygit"
alias ncu "npx -p npm-check-updates@latest ncu"
alias v "nvim"
