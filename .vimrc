" Don't try to be vi compatible (must set first)
set nocompatible

" Don't wrap files
set nowrap

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=longest:full,list:full


" Blink cursor on error instead of beeping (grr)
set visualbell
"set t_vb=

" Encoding
set encoding=utf-8

" Plugins essential
syntax on
filetype plugin indent on

" Autocomplétion intelligente
set omnifunc=syntaxcomplete#Complete

" Color
set cursorline

let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme delek

" Show line number / columns
set ruler

" Write the file when we leave the buffer
set autowrite

" Reload a file when it is changed from the outside
set autoread

" Hide buffers instead of closing them
set hidden

" Make backspace behave as expected
set backspace=eol,indent,start

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
"set noshowmode
set showmode
set showcmd

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=longest:full,list:full

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
