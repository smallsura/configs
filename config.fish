alias vim 'nvim'
alias cvim 'nvim ~/.config/nvim/init.vim'

# so our brew install overrides the commands from the system
set -x PATH /usr/local/sbin $PATH

# bobthefish theme config 
set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal2

# iTerm2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
