function l() {
    # if the argument is a single file or stdin is pipe
    if [[ ($# -eq 1 && -f "$1") || (-p /dev/stdin) ]]; then
        ${PAGER:-less -R} "$@"
    else
        ls -FG "$@"
    fi
}

function h() {
    if [[ $# -gt 0 ]]; then
        history | tail -r | sort -k2 -u | sort | grep "$@"
    else
        history 50
    fi
}

function cd() {
    builtin cd -P $@ && ls -FG;
}

alias rm='rm -ir'
alias mkdir='mkdir -p'
alias up='cd ..;'
alias la='ls -laFG'
alias cl='clear'
alias g='git'
alias tm='tmux'
alias be='bundle exec'
alias digz='dig -tAXFR'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# the results of history substitution are not immediately passed to the shell parser. 
# Instead, the resulting line is loaded into the Readline editing buffer, allowing further modification.
shopt -s histverify

# for heroku
export PATH='/usr/local/heroku/bin:$PATH'

# for pypi
alias upypi='python setup.py sdist bdist_wheel upload'
alias rpypi='python setup.py register'

############
# mac only #
############
function cdf () {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        builtin cd "$target"
            pwd
    else
        echo 'No Finder window found' >&2
    fi
}

alias f='open .'
alias objcopy='gobjcopy'
alias objdump='gobjdump'
alias readelf='greadelf'
