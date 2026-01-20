#!/bin/bash
# .bashrc - DevLab Development Environment
# =====================================================

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# =====================================================
# Welcome Message - Gruvbox Colors
# =====================================================

if [ "$TERM" != "linux" ]; then
    echo -e "\n\033[38;5;208m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\033[38;5;142m  DevLab Development Workspace\033[0m"
    echo -e "\033[38;5;208m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "  \033[38;5;214m👤 User:\033[0m $(whoami)@$(hostname)"
    echo -e "  \033[38;5;214m🛠 Tools:\033[0m docker, kubectl, terraform, k3d, helm"
    echo -e "  \033[38;5;214m📅 Date:\033[0m $(date '+%A, %B %d, %Y at %H:%M %Z')"
    
    # Show git branch if in a git repo
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local branch=$(git branch --show-current 2>/dev/null)
        echo -e "  \033[38;5;214m🌿 Branch:\033[0m ${branch:-detached}"
    fi
    
    # Show disk usage
    local disk_usage=$(df -h / | tail -1 | awk '{print $5}')
    echo -e "  \033[38;5;214m💾 Disk:\033[0m ${disk_usage} used"
    
    echo -e "  \033[38;5;214m💡 Tip:\033[0m Type 'alias' to see all shortcuts"
    echo -e "\033[38;5;208m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n"
fi

# =====================================================
# History Configuration
# =====================================================

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# =====================================================
# Shell Options
# =====================================================

shopt -s checkwinsize
shopt -s globstar 2>/dev/null

# =====================================================
# Color Support
# =====================================================

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# =====================================================
# Aliases
# =====================================================

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Docker aliases
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlogs='docker logs -f'

# Kubernetes aliases
alias k='kubectl'
alias kx='kubectl exec -it'
alias kl='kubectl logs -f'
alias kg='kubectl get'
alias kd='kubectl describe'
alias ka='kubectl apply -f'
alias kdel='kubectl delete'

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# Terraform aliases
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

# =====================================================
# Custom Functions
# =====================================================

# Make directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract archives
extract() {
    if [ -f "$1" ]; then
        case $1 in
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
            *)           echo "$1 cannot be extracted via extract()" ;;
        esac
    else
        echo "$1 is not a valid file"
    fi
}

# Find process by name
psgrep() {
    ps aux | grep -v grep | grep -i -e VSZ -e "$1"
}

# Get current IP
myip() {
    curl -s ifconfig.me
}

# Quick HTTP server
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Docker quick shell
dsh() {
    if [ -z "$1" ]; then
        echo "Usage: dsh <container>"
        return 1
    fi
    docker exec -it "$1" /bin/bash || docker exec -it "$1" /bin/sh
}

# Kubernetes quick shell
ksh() {
    if [ -z "$1" ]; then
        echo "Usage: ksh <pod>"
        return 1
    fi
    kubectl exec -it "$1" -- /bin/bash || kubectl exec -it "$1" -- /bin/sh
}

# Set kubectl namespace
kns() {
    if [ -z "$1" ]; then
        echo "Current namespace: $(kubectl config view --minify --output 'jsonpath={..namespace}')"
    else
        kubectl config set-context --current --namespace="$1"
        echo "Switched to namespace: $1"
    fi
}

# Docker compose tail logs
dctail() {
    if [ -z "$1" ]; then
        docker compose logs -f
    else
        docker compose logs -f "$1"
    fi
}

# Git quick commit
gca() {
    git add .
    git commit -m "$1"
    git push
}

# =====================================================
# Kubernetes Completion (if installed)
# =====================================================

if command -v kubectl &>/dev/null; then
    source <(kubectl completion bash)
    complete -F __start_kubectl k
fi

# =====================================================
# FZF Integration (if installed)
# =====================================================

if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
    
    # Use fd instead of find if available
    if command -v fd &>/dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    fi
fi

# =====================================================
# Prompt Configuration
# =====================================================

# Git branch in prompt
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Colorful prompt with git branch
if [ "$TERM" != "linux" ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi

# =====================================================
# Tool-specific Configurations
# =====================================================

# Docker buildkit
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Kubectl editor
export KUBE_EDITOR='nvim'

# Default editor
export EDITOR='nvim'
export VISUAL='nvim'

# =====================================================
# Local Customizations
# =====================================================

# Source local bashrc if exists
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

