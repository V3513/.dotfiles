alias myip='curl ifconfig.me; echo'
alias reload='source ~/.bash_profile'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias h='cd ~'
alias hc='cd ~ && clear'
alias :q='exit'

alias bashprofile='nvim ~/.bash_profile'
alias bashrc='nvim ~/.bashrc'
alias vimrc='nvim ~/.vimrc'
alias nvimrc='nvim ~/.nvimrc'
alias ghostrc='nvim ~/.config/ghostty/config'
alias tmrc='nvim ~/.tmux.conf'
alias tmre='tmux source-file ~/.tmux.conf'

alias ll='ls -alF'
alias la='ls -A -F'
alias lsc='ls -A -F -G'
alias l='ls -CF'

alias shell='echo $SHELL'
alias shells='cat /etc/shells'

alias pingg='ping google.com'
alias python='python3'
alias emacs='emacs -nw'
alias pip='pip3'
alias dfj='docker compose down --volumes && docker system prune -a -f'

alias tmain='tmux attach -t main'

in_git_repo() {
  git rev-parse --is-inside-work-tree &>/dev/null || return 1
  local repo_root
  repo_root="$(git rev-parse --show-toplevel 2>/dev/null)"
  [[ "$repo_root" != "$HOME" ]]
}

git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}

git_repo_name() {
  basename "$(git rev-parse --show-toplevel 2>/dev/null)"
}

PS1='$(in_git_repo && printf "\n\[\e[38;5;244m\]%s \[\e[38;5;215m\]%s\[\033[0m\]" "$(git_repo_name)" "$(git_branch)")\
\n\[\e[38;5;110m\]\u\[\033[0m\]@\[\e[38;5;110m\]\h \[\e[38;5;229m\]\w\[\033[0m\]\n\[\e[38;5;114m\]\$ \[\033[0m\]'

[ -f "$HOME/google-cloud-sdk/path.bash.inc" ] && source "$HOME/google-cloud-sdk/path.bash.inc"
[ -f "$HOME/google-cloud-sdk/completion.bash.inc" ] && source "$HOME/google-cloud-sdk/completion.bash.inc"

if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach -t main || tmux new -s main
fi

export LC_CTYPE=$LANG
. "$HOME/.cargo/env"
