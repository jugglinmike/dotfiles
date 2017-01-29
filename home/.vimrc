syntax on
"set gfn=Monospace\ 11

set t_Co=256
set background=dark
color wombat256mod
hi Number		ctermfg=73		cterm=none		guifg=#e5786d	gui=none
execute pathogen#infect()

" NERDTree
let NERDTreeChDirMode = 1
map <silent> <leader>f :NERDTreeToggle<CR>
let NERDTreeIgnore=['.pyc$[[file]]']

" Open a journal file for today
nnoremap <buffer> <localleader>j :call journal#Journal()<cr>

" Tabs!
" Hard tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Show line numbers
set number

" Place backups in tmp directory (not working directory)
set backupdir=~/tmp

" Display right margin at column #80
set colorcolumn=80
hi ColorColumn ctermbg=236 guibg=#383838
" Change background color
hi Normal ctermfg=252 ctermbg=234 cterm=none guifg=#e3e0d7 guibg=#242424 gui=none
hi LineNr ctermfg=241 ctermbg=234 cterm=none guifg=#857b6f guibg=#242424 gui=none

hi SpellBad term=reverse ctermbg=123 ctermfg=4 gui=undercurl guisp=Red

set list listchars=tab:→\ ,trail:·

" Supposedly sets yank to use the system clipboard as its default register,
" but I have yet to see this work
set clipboard+=unnamed

filetype plugin indent on

" Custom filetypes
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.pro set ft=prolog
au BufNewFile,BufRead *.coffee set ft=coffee

" Use Unix fileformat regardless of the format of the current file
set ff=unix

" use python/perl regexp syntax
nnoremap / /\v
vnoremap / /\v

" Faster split resizing (+,-) and navigation. Thanks Adam!
if bufwinnr(1)
  map + <C-w>+
  map - <C-w>-
  map <C-J> <C-w>j
  map <C-K> <C-w>k
  map <C-H> <C-w>h
  map <C-L> <c-w>l
"  map <C-w> <C-o><C-w>
end

" Spelling
set spellfile=~/.vim/spell/en.utf-8.add

" -------------------------
" Project-specific settings

au BufRead,BufNewFile ~/projects/bocoup/Bocoup.com/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/backbone.layoutmanager/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/crypto-research/* set tabstop=4 softtabstop=4 expandtab
au BufRead,BufNewFile ~/projects/soso/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/fortpoint.me/* set tabstop=4 softtabstop=4 expandtab
au BufRead,BufNewFile ~/projects/oss/cheerio/cheerio/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/backbone.search/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/mozilla/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/qunit-mocha-ui/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/amdclean2/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/bocoup/roost* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/transmogrify/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/jquery.pep.js/* set tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile ~/projects/whac-a-mole/* set tabstop=2 softtabstop=2 expandtab
