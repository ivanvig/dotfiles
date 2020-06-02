call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
call plug#end()

inoremap fd <Esc>

" COLOR SCHEME

colorscheme gruvbox
set background=dark " use dark mode

" LEADER KEY / WHICHKEY

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map.f = {
      \ 'name' : '+files' ,
	"\ c 	'copy current file to a different location' ,
	"\ C d 	'convert file from unix to dos encoding' ,
	"\ C u 	'convert file from dos to unix encoding' ,
	\ 'D' : ['DeleteFileAndCloseBuffer()'	,	'delete-current-buffer-file'],
	\ 'E' :	['w !sudo tee %'		,	'sudo-edit'],
	\ 'f' :	['Files'			,	'open-file'],
	"\ F 	'try to open the file under point =helm=' ,
	"\ j 	'jump to the current buffer file in dired' ,
	"\ l 	'open file literally in =fundamental mode=' ,
	"\ L 	'Locate a file (using =locate=)' ,
	"\ o 	'open a file using the default external program' ,
	"\ R 	'rename the current file' ,
	\ 's' :	['update' 	, 	'save-file'] ,
	\ 'S' :	['wall' 	, 	'save-all-files'] ,
	"\ r 	'open a recent file with =helm=' ,
	"\ t 	'toggle file tree side bar using [[https://github.com/jaypei/emacs-neotree][NeoTree]]' ,
	"\ v d 	'add a directory variable' ,
	"\ v f 	'add a local variable to the current file' ,
	"\ v p 	'add a local variable to the first line of the current file' ,
	"\ y 	'show current file absolute path in the minibuffer' ,
	\ }

fun! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Yes\n&No", 1)
  if choice == 1 | call delete(expand('%:p')) | q! | endif
endfun

let g:startify_custom_header = 'startify#center([
			\"                       s/    .-/-                 ",
			\"                       -m/`` ..-:/..`yo           ",
			\"                       -oh`         /o            ",
			\"                      :.  `::/:o` `/--/           ",
			\"                     `:  `hhhho.   :ydN-          ",
			\"                     /  `yydMMMm  :msMMMo         ",
			\"                     /`  yyNMMMN..omdMMMd         ",
			\"                    -d+   /yyyo. /-/yhd+`         ",
			\"                      s/ `      -.//  +           ",
			\"                   .yNMN.  `    soo: -.           ",
			\"      -/oo/`-/+ooymMMMMMy      -oo`hsN:           ",
			\"    /mMMMMMMMMMMMMMMMMMMo      /...yMMMN+         ",
			\"   +MMMMMMMMMMMMMMMMMMmMMdo-.  .+hMMMMMMM/        ",
			\"   NMMMMMMMMMMMMMMMMNdmhMMMMMMNNMMoMhMMMM/        ",
			\"   hMMMMMMMMMMMMMMMMMMmMMMMMMMMMMMydmMMMs         ",
			\"   `sMMMMMMmoMMMMMMMMMMMMMMMMMMMMMMMMMmo          ",
			\"     /+sNh-  NMMMMMMMMMMMMMMMMMMMMMMm-` :         ",
			\"    `: :My   sMMMMMMMMMMMMMMMMMMMMMN. .` -        ",
			\"    /` mMN.  `yMMMMMMMMMMMMMMMMMMMm-   -. -       ",
			\"   `: +MMMN.   :hNMMMMMMMMMMMMMMNo`    `+:/+      ",
			\"   /  hMMMm.   -. `-///++shdNdso+oosyhmMMMMMNy+.  ",
			\" `/mdmdMMMo::-+-.`  .+..--.`NMMMMMMMMMMMMMMMMMMNh+",
			\"mMMMMMMMMMMMMMMMMMm/`...````-:+oydNMMMhhhdmms`    ",
			\"odNMMMMMMMMMMMNNNy`..`.-/..``        `            ",
			\" .-::-yhyo/:.   ` -  :...```.`.`                  ",
			\"                                                  ",
			\"          Oh boy, here I go coding again          ",
			\])'

