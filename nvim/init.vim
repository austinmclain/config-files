set number
set relativenumber
syntax on
set encoding=utf-8
set scrolloff=999

" Supposedly helps with highlighting errors
augroup MyStuff
    autocmd!
    autocmd FileType * syntax sync minlines=200
augroup end

" Add matching brace
inoremap {<CR> {<CR>}<C-o>O

" Ctrl-c Ctrl-v copy and paste
vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>

" Indent stuff
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Begin Vim-Plug Section
call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Themes
Plug 'joshdick/onedark.vim', { 'branch': 'main' }
Plug 'sheerun/vim-polyglot'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" telescope-file-browser.nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Zen Mode
Plug 'folke/zen-mode.nvim'

" Startify
Plug 'mhinz/vim-startify'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
" End Vim-Plug Section

" Visualize tabs and newlines
" set listchars=tab:▸\
" set list " To enable by default

" Tokyo Night
" colorscheme tokyonight-moon

" Source the Lua file
lua require('init')

