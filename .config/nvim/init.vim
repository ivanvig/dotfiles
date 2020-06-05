call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

inoremap fd <Esc>
set number

" COLOR SCHEME

colorscheme gruvbox
set background=dark " use dark mode

" LEADER KEY / WHICHKEY

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

call which_key#register('<Space>', "g:which_key_map")
call which_key#register(',', "g:which_key_localmap")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}
let g:which_key_localmap = {}

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
      \ 'b' : ['Buffers'   , 'fzf-buffer']      ,
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

let g:which_key_map.c = {
			\ 'name'	: '+code'			,
			\ 'c'		: 'comment-lines'		,
			\ 'n'		: 'comment-force-nesting'	,
			\ ' '		: 'toggle-comment'		,
			\ 'm'		: 'comment-minimal'		,
			\ 'i' 		: 'toggle-comment-individually'	,
			\ 's' 		: 'comment-sexy'		,
			\ 'y' 		: 'yank-and-comment'		,
			\ '$' 		: 'comment-from-cursor'		,
			\ 'A' 		: 'comment-append'		,
			\ 'a' 		: 'comment-alternate-delimiters',
			\ 'l' 		: 'comment-align-left'		,
			\ 'b' 		: 'comment-align-both'		,
			\ 'u' 		: 'uncomment-lines'		,
			\ 'r' 		: 'coc-rename-symbol'		,
			\ 'f' 		: 'coc-format-selected'		,
			\}

let g:which_key_map.x = {
			\ 'name'	: '+text',
			\ 'a'		: ['<Plug>(EasyAlign)', 'align'],
			\}

let g:which_key_map.t = {
			\ 'name'	: '+toggle',
			\ 'n'		: [':set nu!', 'line-number'],
			\ 'r'		: [':set rnu!', 'relative-line-number'],
			\}


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

augroup pybindings
  autocmd! pybindings
  autocmd Filetype python nmap <buffer> <silent> <localleader>db Oimport pdb; pdb.set_trace()<Esc>
  autocmd Filetype python let g:which_key_localmap.d = {'name' : '+debug'}
  autocmd Filetype python let g:which_key_localmap.d.b = 'add-breakpoint'
augroup end


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
set noshowmode



"""""""" CoC CONFIG 
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
nmap <leader>cr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" TODO: What is this?????
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" TODO: whats this?
" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
