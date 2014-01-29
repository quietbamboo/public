" .vimrc by Junxian Huang
" Version 11.11.2010
"
" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
  set autoindent
  set cindent
  set shiftwidth=2
  set expandtab
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Turn on line numbering. Turn it off with "set nonu" 
set number

"all PHP files in current file's directory and recursively will be scanned
"use mapping to re-build tags files after editing
nmap <silent> <F4>
	\ :!ctags -f %:p:h/tags
	\ --langmap="php:+.inc"
	\ -h ".php.inc" -R --totals=yes
	\ --tag-relative=yes --PHP-kinds=+cf-v %:p:h<CR>
set tags=./tags,tags

"Text width
"set tw=80

"Tell me where I am
set ruler

"Spell check on
set spell

" Higlhight search
set hls
" Map Ctrl+N to remove highlight
nmap <silent> <C-N> :silent noh<CR>

" make that backspace key work the way it should
set backspace=indent,eol,start

" make space = page down
nmap <Space> <PageDown>

" remove the buffer limit when dong yank to copy and past in VIM
set viminfo='100,h 

"Color scheme
colors desert

" Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Taglist
" filetype plugin on
"TlistOpen

if has("autocmd")
  filetype off
  filetype plugin indent off
  set runtimepath+=/usr/share/vim/addons
  filetype plugin indent on
endif

if has("syntax")
  syntax off
  syntax on
endif
