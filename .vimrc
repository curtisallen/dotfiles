"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/callen/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/callen/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'faith/vim-go'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'terryma/vim-multiple-cursors'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

call pathogen#infect()
syntax on
filetype plugin indent on
set encoding=utf-8
set nofoldenable
set nocompatible
set nobackup
set nowb
set number
set noswapfile
set ic
set mouse=a 
set spell spelllang=en_us
set complete+=kspell
vnoremap . :norm.<CR>

let mapleader = "\<Space>"

" syntax highligting
syntax enable
set background=dark
let g:solarized_termcolors=256
set t_Co=16 " added for chromeos crosh chroot ubuntu
colorscheme solarized
"set guifont=Knack\ Bold\ Italic\ Nerd\ Font\ Complete\ Mono:h12
"set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
set guifont=devicons


" quiet pls
set visualbell t_vb=

" turn OFF line numbers
" set nonumber ...I go back and forth on this one

" 2 space softabs default
set expandtab
set ts=2
set sw=2

" \+n toggles the nerdtree
map <leader>n :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Auto quit NERDTree if it's the only buffer
" https://github.com/scrooloose/nerdtree/issues/21
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

" ctrl f for jsbeautify
let g:jsbeautify = {"indent_size": 4, "indent_char": "\t"}
let g:jsbeautify_engine = "node"
map <c-f> :call JsBeautify()<cr>

" 2 space coffeescript for the love of..
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" no need to fold things in markdown all the time
let g:vim_markdown_folding_disabled = 1

" use system clipboard
set clipboard=unnamed

" vim-go settings
set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" airline theme
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:indentLine_char='│'
let g:indentLine_color_term = 239
let g:deoplete#enable_at_startup = 1
