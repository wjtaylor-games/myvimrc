set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Tim Pope plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'

" Some simple autocomplete
" Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Github copilot, AI-powered autocomplete
" WARNING: This plugin is not open-source, and it costs $10 
" per month. Remember to disable it later.
" Plugin 'github/copilot.vim'

" More colorscheme options
Plugin 'EdenEast/nightfox.nvim'

" For unit testing
Plugin 'vim-test/vim-test'

" For deleting buffers
Plugin 'Asheq/close-buffers.vim'
" Useage: :Bd[elete] other | hidden | all | this | nameless | select | menu

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:deoplete#enable_at_startup = 1

set timeout ttimeoutlen=50

syntax on
set number
set nowrap

set encoding=utf-8

" vim-test mappings
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<CR>

" color scheme
set t_Co=256
colorscheme nordfox

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
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

set foldenable
set foldlevelstart=100
nnoremap <space> za
set foldmethod=indent

set relativenumber
nnoremap <silent> <F7> :set relativenumber!<CR>

" Don't use escape
" inoremap jk <esc>
" inoremap kj <esc>
" inoremap JK <esc>
" inoremap KJ <esc>
inoremap <C-;> <ESC>


nnoremap <C-P> :cp<CR>
nnoremap <C-N> :cn<CR>

" Terminal settings
tnoremap <esc> <C-\><C-N>
tnoremap <C-n> <down>
tnoremap <C-p> <up>

" Tab-related settings
nnoremap <F3> gT
tmap <F3> <esc><F3>
nnoremap <F4> gt
tmap <F4> <esc><F3>

" Reload from vimrc
nnoremap <A-v> :source ~/.vim/vimrc<CR>

" Reload
nnoremap <A-e> :e<CR>

" If you delete a visual selection with x, black-hole it.
vnoremap x "_x


" Global clipboard

vnoremap <silent> "+y :w !clip.exe<CR><CR>
" nmap "+y :set opfunc=CountSpaces<CR>g@
map <A-y> "+y

function! CountSpaces(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  " if a:0  " Invoked from Visual mode, use gv command.
  "   normal gv"+y
  if a:type == 'line'
    silent normal '[V']"+y
  else
    silent normal `[v`]"+y
  endif

  " echomsg strlen(substitute(@@, '[^ ]', '', 'g'))

  " let &selection = sel_save
  " let @@ = reg_save
endfunction

" nmap "+p ] :.+1!powershell.exe Get-Clipboard<CR>
map <A-p> "+p

" Set/remove python breakpoints
nnoremap <leader>b obreakpoint()<esc>
nnoremap <leader>B Obreakpoint()<esc>
nnoremap <A-b> :%g/\Vbreakpoint()/d<CR>


" Get to path of file
cnoremap <A-f> %:h
nnoremap <A-f> :e %:h<CR>

" Run current python script.
nnoremap <S-F9> :!python %<CR>

" Run super jump dude
nnoremap <F9> :$tabnew<CR>:term C:\\Users\\wjtay\\Desktop\\run-sjd.bat<CR>

" Open python console in current window
" nnoremap <F8> :term "C:\Users\WilsonTaylor\PycharmProjects\TriangulationDataPipeline\venv\Scripts\python.exe"<CR>i
" nnoremap <F8> :term "C:\Users\WilsonTaylor\PycharmProjects\proshop-tracker\venv\Scripts\python.exe"<CR>i
nnoremap <F8> :term python<CR>

" Open consoles in new tabs
command Wsl tabnew term://wsl
command Cmd tabnew +term

nnoremap j gj
nnoremap k gk

" Alt-w to save
nnoremap <A-w> :up<cr>
 
" Ctrl-c to close
nnoremap <C-c> ZQ

set linebreak

" Edit vimrc
command Evimrc e C:\Users\wjtay\.vim\vimrc
" Edit bashrc
command Ebashrc e '\\wsl$\Ubuntu\home\wjtaylor\.bashrc'
" Edit zshrc
command Ezshrc e '\\wsl$\Ubuntu\home\wjtaylor\.zshrc'


" Move faster
nnoremap <C-J> 5j
nnoremap <C-K> 5k


" Bracket completion.
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Exit insert mode and undo
inoremap <A-u> <ESC>u

" Insert lines between two characters.
" Useful for breaking a `{}` into a block of code.
nnoremap <A-o> i<CR><ESC>O

" Insert at cursor on a blank line, with correct indent.
nnoremap <A-i> ddO

" Y yanks linewise
nnoremap Y yy

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


augroup PythonCustomization
  " highlight python self, when followed by a comma, a period or a parenth
   :autocmd FileType python syn match pythonAsync "\(\W\|^\)\@<=self\([\.,)]\)\@="
augroup END

" --ycm mappings--

" Upgrade gd
" nnoremap gd :YcmCompleter GoTo<CR> 

" Hover manually
" Overrides normal `K` command
" let g:ycm_auto_hover = ""
" nmap K <plug>(YCMHover)

" Disable highlighting
" let g:ycm_enable_diagnostic_highlighting = 0

" Set error and warning symbols
" let g:ycm_error_symbol = '🔥'
" let g:ycm_warning_symbol = '😠'

" let g:ycm_autoclose_preview_window_after_insertion = 1

" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_enable_diagnostic_signs = 0

" Python config
let g:python3_host_prog = 'C:\Users\WilsonTaylor\PycharmProjects\proshop-tracker\venv\Scripts\python.exe'
