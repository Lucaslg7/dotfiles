alias sshp1='ssh -p 2201 lucas.gabriel@150.165.85.78'

# ~/.bashrc - Configuração do Bash para Desenvolvedor

# Se não estiver rodando interativamente, não fazer nada
case $- in
    *i*) ;;
      *) return;;
esac

# ============================================
# HISTÓRICO
# ============================================
HISTCONTROL=ignoreboth:erasedups  # Ignora duplicatas e comandos com espaço inicial
HISTSIZE=10000                     # Tamanho do histórico na memória
HISTFILESIZE=20000                 # Tamanho do arquivo de histórico
shopt -s histappend               # Adiciona ao histórico em vez de sobrescrever
shopt -s cmdhist                  # Salva comandos multi-linha em uma única entrada

# ============================================
# OPÇÕES DO SHELL
# ============================================
shopt -s checkwinsize             # Atualiza LINES e COLUMNS após cada comando
shopt -s globstar 2> /dev/null    # ** corresponde a todos os arquivos recursivamente
shopt -s cdspell                  # Corrige erros menores de digitação no cd
shopt -s dirspell                 # Corrige erros de digitação em nomes de diretório

# ============================================
# PROMPT PERSONALIZADO
# ============================================
# Cores
RED='\[\033[01;31m\]'
GREEN='\[\033[01;32m\]'
YELLOW='\[\033[01;33m\]'
BLUE='\[\033[01;34m\]'
PURPLE='\[\033[01;35m\]'
CYAN='\[\033[01;36m\]'
WHITE='\[\033[01;37m\]'
RESET='\[\033[00m\]'

# Função para obter branch do Git
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt com Git
PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${YELLOW}\$(parse_git_branch)${RESET}\$ "

# ============================================
# ALIASES GERAIS
# ============================================
alias ll='ls -lhF --color=auto'
alias la='ls -lAhF --color=auto'
alias l='ls -CF --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Navegação
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Segurança
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Utilitários
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%d-%m-%Y %T"'
alias ports='netstat -tulanp'

# ============================================
# ALIASES PARA DESENVOLVIMENTO
# ============================================
# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gpull='git pull'

# Docker
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcr='docker-compose restart'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dclean='docker system prune -af'

# Kubernetes (se usar)
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kdp='kubectl describe pod'

# Python
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# Node.js
alias ni='npm install'
alias ns='npm start'
alias nt='npm test'
alias nr='npm run'

# ============================================
# FUNÇÕES ÚTEIS
# ============================================
# Criar e entrar em um diretório
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extrair arquivos compactados
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' não pode ser extraído via extract()" ;;
        esac
    else
        echo "'$1' não é um arquivo válido"
    fi
}

# Buscar processos
psgrep() {
    ps aux | grep -v grep | grep -i -e VSZ -e "$1"
}

# Criar backup de arquivo
backup() {
    cp "$1"{,.bak-$(date +%Y%m%d-%H%M%S)}
}

# Encontrar arquivos rapidamente
ff() {
    find . -type f -iname "*$1*"
}

# Encontrar diretórios rapidamente
fd() {
    find . -type d -iname "*$1*"
}

# ============================================
# VARIÁVEIS DE AMBIENTE
# ============================================
export EDITOR=nano
export VISUAL=nano

# Adicionar ~/.local/bin ao PATH se existir
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Node.js (npm global)
if [ -d "$HOME/.npm-global/bin" ]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi

# ============================================
# AUTOCOMPLETE
# ============================================
# Habilitar bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Git completion (se disponível)
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi

# ============================================
# MENSAGEM DE BOAS-VINDAS
# ============================================
echo -e "${GREEN}Bem-vindo, $USER!${RESET}"
echo -e "${CYAN}Sistema: $(uname -sr)${RESET}"
echo -e "${YELLOW}$(date)${RESET}"
echo ""
