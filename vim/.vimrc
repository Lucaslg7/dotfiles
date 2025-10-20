" ====================================
" Configurações Básicas
" ====================================
set nocompatible              " Desabilita compatibilidade com vi
filetype plugin indent on     " Detecção de tipo de arquivo
syntax enable                 " Habilita syntax highlighting

" ====================================
" Interface e Aparência
" ====================================
set number                    " Mostra números de linha
" set relativenumber            " Números relativos
set showcmd                   " Mostra comando parcial
set wildmenu                  " Menu de autocompletar
set wildmode=longest:full,full
set laststatus=2              " Sempre mostra status bar
set ruler                     " Mostra posição do cursor
set showmatch                 " Destaca parênteses correspondentes
set matchtime=2               " Tempo de highlight (décimos de segundo)
set scrolloff=8               " Linhas visíveis acima/abaixo do cursor
set sidescrolloff=8           " Colunas visíveis à esquerda/direita
set fillchars=vert:│,eob:\    " Remove ~ e melhora divisor vertical
set termguicolors             " Habilita cores true color

" Tema e Cores
set background=dark
colorscheme slate             " Tema padrão bonito (também pode usar: desert, elflord, pablo)

" ====================================
" Busca e Substituição
" ====================================
set incsearch                 " Busca incremental
set hlsearch                  " Destaca resultados da busca
set ignorecase                " Ignora case na busca
set smartcase                 " Case-sensitive se houver maiúscula
set gdefault                  " Flag 'g' por padrão em substituições

" ====================================
" Indentação e Formatação
" ====================================
set autoindent                " Mantém indentação da linha anterior
set smartindent               " Indentação inteligente
set expandtab                 " Usa espaços ao invés de tabs
set tabstop=4                 " Largura do tab
set shiftwidth=4              " Largura da indentação
set softtabstop=4             " Espaços ao pressionar Tab
set shiftround                " Arredonda indentação para múltiplos de shiftwidth
set linebreak                 " Quebra de linha em palavras

" ====================================
" Edição
" ====================================
set backspace=indent,eol,start " Backspace funciona normalmente
set clipboard=unnamedplus     " Usa clipboard do sistema
set mouse=a                   " Habilita mouse
set encoding=utf-8            " Encoding UTF-8
set fileencoding=utf-8        " Encoding de arquivo UTF-8
set undofile                  " Persistir histórico de undo
set undodir=~/.vim/undo       " Diretório para arquivos de undo
set backup                    " Habilita backup
set backupdir=~/.vim/backup   " Diretório de backup
set directory=~/.vim/swap     " Diretório de swap
set updatetime=300            " Tempo para salvar swap (ms)
set timeoutlen=500            " Tempo para mapear sequências
set hidden                    " Permite buffers não salvos em background

" ====================================
" Performance
" ====================================
set lazyredraw                " Não redesenha durante macros
set ttyfast                   " Conexão rápida
set synmaxcol=300             " Syntax highlighting até coluna 300

" ====================================
" Divisão de Janelas
" ====================================
set splitbelow                " Split horizontal abre abaixo
set splitright                " Split vertical abre à direita

" ====================================
" Configurações Específicas por Linguagem
" ====================================
" Java
autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" autocmd FileType java setlocal colorcolumn=120

" Python
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python setlocal colorcolumn=79

" JavaScript/TypeScript
autocmd FileType javascript,typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascriptreact,typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" HTML/CSS
autocmd FileType html,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Go
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Markdown
autocmd FileType markdown setlocal textwidth=80 wrap

" ====================================
" Atalhos Personalizados
" ====================================
" Define leader key
let mapleader = " "
let maplocalleader = "\\"

" Salvar e sair
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Limpar highlight de busca
nnoremap <silent> <leader>h :nohlsearch<CR>

" Navegação entre buffers
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>d :bdelete<CR>

" Navegação entre janelas
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Redimensionar janelas
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>> :vertical resize +5<CR>
nnoremap <leader>< :vertical resize -5<CR>

" Mover linhas
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Indentar sem perder seleção
vnoremap < <gv
vnoremap > >gv

" Copiar para clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>yy "+yy

" Colar de clipboard
nnoremap <leader>P "+P
nnoremap <leader>p "+p

" Toggle número relativo
nnoremap <leader>r :set relativenumber!<CR>

" Abrir netrw (explorador de arquivos)
nnoremap <leader>e :Explore<CR>

" Executar arquivo atual (baseado em filetype)
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python3 %<CR>
autocmd FileType java nnoremap <buffer> <F5> :w<CR>:!javac % && java %:r<CR>
autocmd FileType javascript nnoremap <buffer> <F5> :w<CR>:!node %<CR>
autocmd FileType sh nnoremap <buffer> <F5> :w<CR>:!bash %<CR>

" ====================================
" Netrw (Explorador de Arquivos Nativo)
" ====================================
let g:netrw_banner = 0        " Remove banner
let g:netrw_liststyle = 3     " Estilo em árvore
let g:netrw_browse_split = 4  " Abrir em janela anterior
let g:netrw_altv = 1          " Split à direita
let g:netrw_winsize = 25      " Largura de 25%

" ====================================
" Autocomandos Úteis
" ====================================
" Criar diretórios necessários
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p", 0700)
endif
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "p", 0700)
endif
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "p", 0700)
endif

" Remove espaços em branco no final das linhas ao salvar
autocmd BufWritePre * :%s/\s\+$//e

" Retorna à última posição do cursor ao abrir arquivo
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Destaca coluna 80/120 em arquivos de código (comentado - descomente se quiser)
" autocmd FileType java,python,javascript,typescript,go,c,cpp set colorcolumn=80

" ====================================
" Statusline Personalizada
" ====================================
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %f\                    " Caminho do arquivo
set statusline+=%#LineNr#
set statusline+=\ %m                     " Flag de modificado
set statusline+=\ %r                     " Flag read-only
set statusline+=%=                       " Lado direito
set statusline+=%#CursorColumn#
set statusline+=\ %y                     " Tipo de arquivo
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]     " Format (unix/dos)
set statusline+=\ %p%%                   " Porcentagem do arquivo
set statusline+=\ %l:%c                  " Linha:Coluna
set statusline+=\

" ====================================
" Comentários Úteis
" ====================================
" Para instalar plugins, recomendo usar vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Depois adicione entre call plug#begin() e call plug#end():
" Plug 'preservim/nerdtree'
" Plug 'tpope/vim-fugitive'
" Plug 'dense-analysis/ale'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
