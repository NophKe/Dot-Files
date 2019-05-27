nnoremap § 0Odef XXX(txt):<esc>o    <c-r>*<cr><esc>


inoremap <F11> <esc><esc>:Commentary<cr>i
nnoremap <F11> :Commentary<cr>
vnoremap <F11> :Commentary<cr>
inoremap <s-cr> <esc>
packadd shellmenu
inoremap jk <esc>
let python_highlight_all=1
iab qch quelque chose

set autoindent
set smartindent

nnoremap <F3> :set spell!<CR> 

inoremap <F12> <esc><esc>V"+y
nnoremap <F12> <esc><esc>V"+y

nnoremap ,a 0dt]xi=<esc>$a=<esc>0



nnoremap ,c /^=<cr>:s/\v<(.)(\w*)/\u\1\L\2/g<cr>

" nnoremap <LEFT> <nop>
" nnoremap <RIGHT> <nop>
" nnoremap <UP> <nop>
" nnoremap <DOWN> <nop>


nnoremap <A-F1> ]s1z=

" call NERDTree

colorscheme Tomorrow-Night
set t_Co=256
iab ``` ```<CR><CR>```<UP><UP>
iab <<<< «»<LEFT>

map <F5> :wa<CR>:!./soft.sh<cr>

nnoremap <F2> :split $MYVIMRC<cr>
nnoremap <C-l> :let @/ =""<cr>

nnoremap <F10> :split /home/nono/.txt2tagsrc<cr>

filetype plugin on          		" plugins are enabled
syntax enable 				" Turn on syntax highlighting

" Pour tout nouveau fichier, ou toute ouverture de fichier dont le nom se
" termine par .txt démarre la corection orthographique.
"
au BufNewFile,BufRead *.text set spell
au BufNewFile,BufRead *.py nnoremap <F9> :w !python3.7<cr>
inoremap <F9> <esc>:w !python3.7<cr>

" Pour tout nouveau fichier, ou toute ouverture de fichier dont le nom se
" termine par .t2t règle la syntaxe en txt2tags. 
au BufNewFile,BufRead *.t2t set ft=txt2tags spell spelllang=fr


packadd! editexisting	" when editing a file that is already edited with
			" another Vim instance, go to that Vim instance


""	 OPTIONS DE RENDU DU TEXTE
""""""""""""""""""""""""""""""""""
set encoding=utf-8			"" Utiliser l'unicode.

set wrap				"" Coupe les lignes trop longues pour s'afficher à l'écran
set linebreak				"" Evite de couper une ligne au millieu d'un mot.

set display+=lastline			"" Éssaie de montrer la dernière ligne d'un paragraphe	

set scrolloff=5				"" Le nombre de ligne à à garder au dessus et en dessous du curseur.
set sidescrolloff=5			"" The number of screen columns to keep to the left and right of the cursor.

set hidden 				" Leave hidden buffers open
set history=100 			" by default Vim saves your last 8 commands.  We can handle more
""
"" 		USER INTERFACE
""
set mouse=a
set showcmd  				" show command in bottom bar
set number 				" show line numbers
set ruler				" Always show cursor position
set wildmenu 				" visual autocomplete for command menu
set ttyfast
""
""		SEARSH OPTIONS
""
set hlsearch
set ignorecase
set incsearch
set smartcase

set laststatus=2


set backspace=indent,eol,start  " more powerful backspacing

" set foldenable          		" enable folding


" imap <F12>  :exec 'normal h'<bar>exec 'normal gE'<cr> <Right>'<CR>
" imap <C-LEFT>  :exec 'normal h'<bar>exec 'normal gE'<cr><Right>

imap <F3>  gEl

nmap <C-UP> :m-2<CR>  
nmap <C-DOWN> :m+1<CR>

nmap <C-A-RIGHT> :wn<CR>
nmap <C-A-LEFT> :wprevious<CR>

" nnoremap ,r :.w !bash<CR>
nnoremap ,r yypV!sh<CR>

" set cursorline   			"sou-ligne ligne courante
"
"
"
":set statusline=%F         		" Path to the file
" :set statusline+=___          		" space
" :set statusline+=%y        		" filetype 
" :set statusline+=%=        		" Switch to the right side
" :set statusline+=%l        		" Current line
" :set statusline+=___          		" space
" :set statusline+=%L        		" Total lines
" :set statusline+=_lignes__          	" space
" :set statusline+=%p        		" %age
" :set statusline+=%%        		" %age 
