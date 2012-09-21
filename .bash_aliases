alias bc='bc -l'
alias cpan='perl -MCPAN -e shell'
alias ducks='du -cks * |sort -rn |head -11'
alias eamcs='emacs'
alias fn='find . -name'
alias guid='mysql -u root -e"select uuid();"'
alias joegrossberg='ssh joegross@joegrossberg.com'
alias ls='ls -bG'
alias la='ls -abG'
alias ll='ls -abGl'
alias lynx='/Applications/Lynxlet.app/Contents/Resources/lynx/bin/lynx'
alias now='ruby -e "puts Time.now.utc.to_i"'
alias rlc='rake log:clear'
alias tgz='tar -pczf'

# git ones
function gitbranch {
  git checkout -b "$1";
  git push -u origin "$1";
}
alias gitlg='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen%cn%Creset %Cblue%cr%Creset'\'' --abbrev-commit --date=relative'
