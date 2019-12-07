" Bruno
" Don't try to be vi compatible (must set first)
set nocompatible

" Don't wrap files
set nowrap

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Plugins essential
syntax on
filetype plugin indent on

" Autocomplétion intelligente
set omnifunc=syntaxcomplete#Complete

" Color
set cursorline

" Show line number / columns
set number
set ruler

" Rendering
set ttyfast

" Tab and indent
set autoindent
set smartindent
set smarttab
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

" Search
set hlsearch " Highlight all search result
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" Highlight matching brace
set showmatch

" Show last line
set noshowmode
set showcmd

" Don't redraw while executing macros (performance config)
set lazyredraw

" Display extra whitespace
set list listchars=tab:»·,trail:·,eol:¬,space:·,extends:>,precedes:<
set nolist

" Number of undo levels
set undolevels=1000

" Set how many history vim has to remember
set history=1000

" Ignore files vim doesnt use
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*
