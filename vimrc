set nocompatible              " be iMproved, required
filetype off                  " required

" Tim Pope plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

" Open gitlab with GBrowse
Plug 'shumphrey/fugitive-gitlab.vim'

" More colorscheme options
Plug 'EdenEast/nightfox.nvim'
" Plug 'jnurmine/Zenburn'
Plug 'phha/zenburn.nvim'
Plug 'morhetz/gruvbox'
Plug 'Mofiqul/dracula.nvim'
Plug 'navarasu/onedark.nvim'

" For unit testing
Plug 'vim-test/vim-test'

" For deleting buffers
Plug 'Asheq/close-buffers.vim'
" Useage: :Bd[elete] other | hidden | all | this | nameless | select | menu


" Use :A to swap between .cpp and .hpp
Plug 'vim-scripts/a.vim'

" Conquer Of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Dap Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
" Plug 'LiadOz/nvim-dap-repl-highlights'
Plug 'igorlfs/nvim-dap-view'

" Treesitter (neovim only)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

let g:python3_host_prog = 'C:\Users\p003002H\source\repos\MissilePrototyper\venv\Scripts\python.exe'
" let g:deoplete#enable_at_startup = 1

set timeout ttimeoutlen=50

syntax on
set number
set nowrap

set encoding=utf-8

set ignorecase
set smartcase

" vim-test mappings
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<CR>

" ----- coc.nvim -----

set nobackup
set nowritebackup
set updatetime=300
" Avoid anoying shifting
set signcolumn=yes
" Completion with <C-n> and <C-p>
inoremap <silent><expr> <C-n>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" toggle coc argument labels
nnoremap yog :CocCommand document.toggleInlayHint<CR>

" --------------------

" Swap from cpp to hpp
nnoremap <A-a> :A<cr>
" nnoremap <esc>a :A<cr>

" color scheme
set t_Co=256
let g:onedark_config = {
    \ 'style': 'warm',
\}
colorscheme onedark

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
" set cursorline
filetype indent on

" Highlight searches
set nohlsearch

" splitting settings
set splitright
set splitbelow
nnoremap <C-W>v <C-W>v<C-W>2<
nmap <leader>v <C-W>v
nmap <leader>s <C-W>s

" navigate split windows
nnoremap <A-h> <C-w>h
" nnoremap <esc>h <C-w>h
nnoremap <A-j> <C-w>j
" nnoremap <esc>j <C-w>j
nnoremap <A-k> <C-w>k
" nnoremap <esc>k <C-w>k
nnoremap <A-l> <C-w>l
" nnoremap <esc>l <C-w>l

set foldenable
set foldlevelstart=100
nnoremap <space> za
set foldmethod=indent

set relativenumber
set linebreak

" Terminal settings
tnoremap <esc> <C-\><C-N>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <C-n> <down>
tnoremap <C-p> <up>

" Reload from vimrc
nnoremap <A-v> :source ~/.vimrc<CR>
" nnoremap <esc>v :source ~/.vimrc<CR>

" Reload
nnoremap <A-e> :e<CR>
" nnoremap <esc>e :e<CR>

" If you delete a visual selection with x, black-hole it.
vnoremap x "_x


" Global clipboard

vnoremap <silent> "+y :w !clip.exe<CR><CR>
map <A-y> "+y
" map <esc>y "+y
map <A-p> "+p
" map <esc>p "+p

" Set/remove python breakpoints -- actually dap breakpoints
" nnoremap <leader>b obreakpoint()<esc>
nnoremap <leader>b :DapToggleBreakpoint<CR>
" nnoremap <leader>B Obreakpoint()<esc>
" nnoremap <A-b> :%g/\Vbreakpoint()/d<CR>
nnoremap <A-b> :DapClearBreakpoints<CR>
" nnoremap <esc>b :%g/\Vbreakpoint()/d<CR>

" Dap steps
nnoremap <down> :DapStepOver<CR>
nnoremap <right> :DapStepInto<CR>
nnoremap <left> :DapStepOut<CR>
nnoremap <up> :DapContinue<CR>

" Start Dap
nnoremap <F9> :DapNew<CR>

" Turn on Dap repl
" nnoremap <silent> <F10> :DapToggleRepl<CR>
nnoremap <silent> <F10> :DapViewToggle<CR>


" Get to path of file
cnoremap <A-f> %:h
" cnoremap <esc>f %:h

" Run current python script.
nnoremap <S-F9> :!python %<CR>

" Open consoles in new tabs
command Cmd tabnew +term

nnoremap j gj
nnoremap k gk

" Alt-w to save
nnoremap <A-w> :up<cr>
" nnoremap <esc>w :up<cr>
 
" Spam Ctrl-C to finally exit vim
nnoremap <C-c> ZQ

" Edit vimrc
command Evimrc e ~/.vimrc
" Edit init.lua
command Elua e ~/.config/nvim/init.lua
" Edit bashrc
command Ebashrc e ~/.vimrc
" Edit zshrc
command Ezshrc e ~/.zshrc


" Move faster
nnoremap <C-J> 5j
nnoremap <C-K> 5k


" Bracket completion.
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Exit insert mode and undo
inoremap <A-u> <ESC>u
" inoremap <esc>u <ESC>u

" Insert lines between two characters.
" Useful for breaking a `{}` into a block of code.
nnoremap <A-o> i<CR><ESC>O
" nnoremap <esc>o i<CR><ESC>O

" Y yanks to end of line like D does
nnoremap Y y$

" Set consistent shift widths
autocmd BufRead,BufNewFile *.omi set filetype=html
autocmd BufRead,BufNewFile *.oma set filetype=html
autocmd BufRead,BufNewFile *.xml set filetype=html
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType cpp setlocal shiftwidth=3 tabstop=3
autocmd FileType lua setlocal shiftwidth=2 tabstop=2

" Conventional commit mappings
function ConventionalCommitSetup()
    nnoremap <buffer> =b Ibuild: 🔨
    nnoremap <buffer> =c Ici: 👷
    nnoremap <buffer> =d Idocs: 📝
    nnoremap <buffer> =f Ifeat: ✨
    nnoremap <buffer> =x Ifix: 🔧
    nnoremap <buffer> =p Iperf: 🏭
    nnoremap <buffer> =r Irefactor: ♻
    nnoremap <buffer> =s Istyle: 💎
    nnoremap <buffer> =t Itest: ✅
endfunction
autocmd BufNewFile,BufRead COMMIT_EDITMSG call ConventionalCommitSetup()

" augroup PythonCustomization
"   " highlight python self, when followed by a comma, a period or a parenth
"    :autocmd FileType python match pythonAsync "\(\W\|^\)\@<=self\([\.,)]\)\@="
" augroup END


" Python config
" let g:python3_host_prog = 'nodefined'
