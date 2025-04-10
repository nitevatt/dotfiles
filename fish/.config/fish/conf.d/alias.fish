alias dc "docker compose"
alias gbdd 'git branch -vv | grep \': gone\' | grep -v \'\*\' | awk \'{print $1}\' | xargs -r git branch -d'
alias gl "git log --all --decorate --oneline --graph"
alias gp "git push -u origin HEAD"
alias gs "git status -sb"
alias gui "git update-index"
alias gui-nsw "gui --no-skip-worktree"
alias gui-sw "gui --skip-worktree"
alias gw "git worktree"
alias gwa "gw add --guess-remote"
alias gwl "gw list"
alias gwr "gw remove"
alias lg "lazygit"
alias llm "ollama run llama3.2:3b --nowordwrap"
alias ncu 'npx npm-check-updates@latest --interactive --format group'
alias ncusemver 'ncu --target semver'
alias ni "npm install"
alias nig "ni --global"
alias no "npm outdated"
alias nog "no --global"
alias nr "npm run"
alias ns "npm start"
alias nt "npm test"
alias nu "npm update"
alias nug "nu --global"
alias nun "npm uninstall"
alias nung "nun --global"
alias nvim-chad 'NVIM_APPNAME=NvChad nvim'
alias t 'tmux new -s (basename "$PWD")'
alias ta "tmux a"
alias v 'nvim'
alias vc 'nvim-chad'
alias vcn "vc $NOTES_PATH"
alias vn "v $NOTES_PATH"

function node-ai-commit
    npx tsx@latest /home/dev/workspace/git-ai-commit/index.ts
end
