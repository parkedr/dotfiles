export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export M2_HOME=/usr/local/maven/apache-maven-3.3.9
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# command aliases
alias ll="ls -lG"
alias dir=ll

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# boxfuse 
export PATH=$PATH:/Users/robparker/boxfuse

export NVM_DIR="/Users/robparker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# nvm use v6.9.5 > /dev/null

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

