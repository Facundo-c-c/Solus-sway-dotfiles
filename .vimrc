call plug#begin('~/.vim/plugged')

" Autocompletado con coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
 
call plug#end()

" Configurar el tema de colores
set background=dark

" Mostrar números de línea
set number

" Mostrar números de línea relativos
set relativenumber

" Usar espacios en lugar de tabulaciones
set expandtab

" Número de espacios que un <Tab> debería insertar
set tabstop=4

" Número de espacios usados para auto indentación
set shiftwidth=4

" Habilitar búsqueda incremental
set incsearch

" Ignorar mayúsculas en búsqueda a menos que se usen mayúsculas explícitamente
set ignorecase
set smartcase

" Resaltar resultados de búsqueda
set hlsearch

" Activar la lectura de archivos al ser modificados fuera de Vim
set autoread

" Habilitar resaltado de sintaxis
syntax on

" Configurar barra de estado
set laststatus=2

" Activar modo de pantalla dividida inteligente
set splitbelow
set splitright

" Habilitar la línea de cursor actual
" set cursorline

" Configurar la copia y pega con el portapapeles del sistema
set clipboard=unnamedplus

" Mantener 8 líneas de margen cuando se desplaza
set scrolloff=8

" Desplazamiento suave con Ctrl+j/k
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" Quitar resaltado de búsqueda con <leader>/
nnoremap <leader>/ :nohlsearch<CR>

" Guardar archivo con <leader>w
nnoremap <leader>w :w<CR>

" Salir de Vim con <leader>q
nnoremap <leader>q :q<CR>

" Guardar y salir con <leader>x
nnoremap <leader>x :x<CR>

" Configuración del autocompletado
set completeopt=menuone,noselect

" Configurar coc.nvim para autocompletado
" Usa <Tab> para navegar entre las sugerencias
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ "\<Tab>"

" Usa <CR> para confirmar la selección
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Mapea <leader>a para acciones de código
nmap <leader>a  <Plug>(coc-codeaction)

" Función para copiar al portapapeles de Wayland
function! YankToClipboard()
    " Guarda el contenido del registro de yank en una variable
    let l:yank_content = getreg('"')
    " Utiliza wl-copy para copiar el contenido al portapapeles de Wayland
    call system('echo ' . shellescape(l:yank_content) . ' | wl-copy')
endfunction

" Mapea la función a una tecla (por ejemplo, <leader>y)
nnoremap <leader>y :call YankToClipboard()<CR>
