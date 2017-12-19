alias vim 'nvim'
alias cvim 'nvim ~/.config/nvim/init.vim'

# bobthefish theme config 
set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox

# iTerm2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
