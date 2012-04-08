syntax on             " включить подсветку синтаксиса
set ts=4              " у меня табуляция 4 символа
set autoindent
set background=dark   " весьма важная штука! :)
set lbr
set showcmd
set nocompatible      " обойдёмся без стандартного vi
set backspace=indent,eol,start
set ai                " включим автоотступы для новых строк
set cin               "включим отступы в стиле Си
set showmatch 
set hlsearch
set incsearch
set ignorecase

" Порядок применения кодировок и формата файлов:
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Терпеть не могу «резервных копий» в рабочем каталоге. Я про "
" файлы, имя которых заканчиваются на «~». Предпочитаю или    "
" отключать создание резервных копий совсем, или держать      "
" где-нибудь в отдельном месте.                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/temp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" При редактировании файлов с длинными строками курсор часто  "
" «скачет» и передвигается не туда, куда хотелось бы. Сделаем,"
" чтобы поведение курсора было похоже на обычные текстовые ре-"
" дакторы (вроде KWrite):                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Так как мы включили autoindent, то вставка текста с отступа-"
" ми (из буфера обмена X Window или screen) будет «глючить» — "
" отсупы будут «съезжать». К счастью, это легко исправить —   "
" нажав Ctrl+U сразу после вставки.                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Надоело набирать chmod +x script.sh после создания нового   "
" скрипта? Пусть этим займётся Vim — все файлы, начинающиеся с"
" !#/bin/sh или чего-то подобного автоматически будут сделаны "
" исполняемыми:                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction
au BufWritePost * call ModeChange()

imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
nmap <F10> :q!<cr>
vmap <F10> <esc>:q!<cr>i
imap <F10> <esc>:q!<cr>i

map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

" Переключать кодировки на лету, нажимая F8:
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set wildmenu
set wcm=<Tab>
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.UTF-8    :e ++enc=utf-8<CR>
map <F8> :emenu Encoding.<TAB>

