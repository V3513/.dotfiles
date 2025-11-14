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

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;67m\]\u\[\e[0m\]@\[\e[38;5;67m\]\h\[\e[0m\] \[\e[38;5;214m\]\w\[\e[0m\] (\[\e[38;5;208m\]${PS1_CMD1}\[\e[0m\])\n\[\e[38;5;28m\]\\$\[\e[0m\] '

if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach -t main || tmux new -s main
fi

export LC_CTYPE=$LANG
. "$HOME/.cargo/env"
