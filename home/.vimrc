" Pathogen
execute pathogen#infect()

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" No compatible with vi
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" Golden ration
let g:golden_ratio_autocommand = 0

" Git gutter
let g:gitgutter_enabled = 0

" Enable mouse cursor
if has("mouse")
  set mouse=a
  set ttymouse=xterm2
endif

" Paste toggle
set pastetoggle=<F4>

" MacVim or GVim settings
set guifont=Source\ Code\ Pro\ 10
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=L " Removes left hand scroll bar

" Enable filetype plugin
filetype plugin indent on
syntax on

" Line numbers
set number

" Colorscheme
set t_Co=256

if has('gui_running')
  colorscheme base16-tomorrow
  set background=dark
else
  colorscheme Tomorrow-Night
endif

" Indentation
set autoindent
set backspace=indent,eol,start
set showmatch
set smartcase
set expandtab

" Soft tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
retab

" Wrap column
set colorcolumn=80
" highlight ColorColumn ctermbg=DarkGray

" Invisible characters
set list
" set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ ,trail:·

" No swp files
set nobackup
set nowb
set noswapfile

" Ignore folder and files in NERDTree
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:NERDTreeIgnore=['\~$', 'tmp', 'log', 'bin']

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Snipmate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

" Vim rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" No gemfile rspec
nmap <Leader>rs :!clear; rspec --color<CR>

let g:rspec_command = "!clear; bundle exec rspec {spec}"

nmap <Leader>n :NERDTreeToggle<CR>

" Trim white space
function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" Inline ruby interpreter
let g:xmpfilter_cmd = "seeing_is_believing"

autocmd FileType ruby nmap <buffer> <Leader>m <Plug>(seeing_is_believing-mark)
autocmd FileType ruby xmap <buffer> <Leader>m <Plug>(seeing_is_believing-mark)
autocmd FileType ruby imap <buffer> <Leader>m <Plug>(seeing_is_believing-mark)

autocmd FileType ruby nmap <buffer> <Leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby xmap <buffer> <Leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby imap <buffer> <Leader>c <Plug>(seeing_is_believing-clean)

" xmpfilter compatible
autocmd FileType ruby nmap <buffer> <Leader>r <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby xmap <buffer> <Leader>r <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby imap <buffer> <Leader>r <Plug>(seeing_is_believing-run_-x)

" auto insert mark at appropriate spot
autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing_is_believing-run)
autocmd FileType ruby xmap <buffer> <F5> <Plug>(seeing_is_believing-run)
autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing_is_believing-run)

" Status line
set laststatus=2
set statusline=%<\ %n:%t\ %m%r%y\ %{fugitive#statusline()}%=%-33.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
