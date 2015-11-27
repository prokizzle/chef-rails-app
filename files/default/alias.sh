alias dev_server='bundle exec rails s -e development'
alias prod_server='bundle exec rake assets:clean && bundle exec rake assets:precompile && bundle exec rails s -e production'
alias -- -="cd -"
alias ......='cd ../../../../../'
alias .....='cd ../../../../'
alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ..'
alias h='cd $HOME'
alias l.='ls -d .* --color=auto'
alias l='ls -lAh --color'
alias la="ls -aF"
alias ld="ls -ld"
alias lg="ls -AlG"
alias ll="ls -l"
alias sl='ls'
alias mkdir='mkdir -p -v'
alias gc="git commit"
alias gd="git diff"
alias gitar="git ls-files -d -m -o -z --exclude-standard | xargs -0 git update-index --add --remove"
alias gl="git log --graph --full-history --all --color"
alias gp="git push origin master"
alias gp="git push origin master"
alias gpa="git push --all"
alias gpm="git push origin master"
alias gs="git status"
alias m="git add .;git commit -m"
alias mux="tmuxinator"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

function sshi() {
  ssh -i ~/.ssh/internal.pem ubuntu@$@
}