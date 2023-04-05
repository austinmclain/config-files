# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
export PATH="$HOME/.dotnet/tools:$PATH"

# Prompt
# PS1="%n@%m %1~ %#"
PS1="%n@%t %1~ %# "

echo Welcome!
echo "Use the command 'my_commands' to see a list of custom commands."

alias my_commands='
echo All commands:
echo

printf "%s %30s\n" "test" "print out a test message"

echo
'

# My Aliases
alias test='echo This is a test.'



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
