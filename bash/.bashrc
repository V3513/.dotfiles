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
alias pip='pip3'
alias dfj='docker compose down --volumes && docker system prune -a -f'
alias tmain='tmux attach -t main'

short_pwd() {
  local p=$PWD h=$HOME
  [[ $p == "$h"* ]] && p="~${p#$h}"
  local IFS=/ parts=() out=()
  read -ra parts <<< "$p"
  local leading_slash=0
  [[ ${p:0:1} == "/" ]] && leading_slash=1
  local start=0
  (( leading_slash )) && start=1
  local last=$(( ${#parts[@]} - 1 ))
  for i in "${!parts[@]}"; do
    (( i < start )) && continue
      if (( i == start || i == last )); then
        out+=("${parts[i]}")
      else
        out+=("${parts[i]:0:1}")
      fi
  done
  local prefix=""
  (( leading_slash )) && prefix="/"
  printf "%s%s" "$prefix" "$(IFS=/; printf "%s" "${out[*]}")"
}

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
PS1='\[\e[38;5;67m\]\u\[\e[0m\]@\[\e[38;5;67m\]\h\[\e[0m\] \[\e[38;5;214m\]$(short_pwd)\[\e[0m\] (\[\e[38;5;208m\]${PS1_CMD1}\[\e[0m\])\n\[\e[38;5;28m\]\\$\[\e[0m\] '

if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach -t main || tmux new -s main
fi

export LC_CTYPE=$LANG
. "$HOME/.cargo/env"
