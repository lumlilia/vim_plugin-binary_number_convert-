if exists('g:binary_number_convert')
  finish
endif
let g:binary_number_convert = 1

command! -nargs=+ BtoN call binary_number_convert#BtoN(<f-args>)
nnoremap <C-n>o <ESC>:BtoN 0 o<CR>
nnoremap <C-n>x <ESC>:BtoN 0 x<CR>
nnoremap <C-n>d <ESC>:BtoN 0 d<CR>
vnoremap <C-n>o <ESC>:BtoN 1 o<CR>
vnoremap <C-n>x <ESC>:BtoN 1 x<CR>
vnoremap <C-n>d <ESC>:BtoN 1 d<CR>
