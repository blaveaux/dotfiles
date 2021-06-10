"" Airline Configs

"" Airline Font Configs
" airline specific font content
let g:airline_powerline_fonts=1

" set the airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"" Airline general configs
" set airline theme
let g:airline_theme='papercolor'

" Function configuring section parts
" set section c (bufferline section) of bottom bar to relative path to current file and readonly status
function! AirlineInit()
  let g:airline_section_c = airline#section#create(["%{expand('%:~:.')}", ' ', 'readonly'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()


"" fugitive airline branch options
" enable showing branch name
let g:airline#extensions#branch#enabled = 1

" to truncate all path sections but the last one, e.g. a branch
" 'foo/bar/baz' becomes 'f/b/baz', use
let g:airline#extensions#branch#format = 2

" truncate long branch names to a fixed length >
let g:airline#extensions#branch#displayed_head_limit = 20


"" airline-tabline options
" enable tabline
let g:airline#extensions#tabline#enabled = 1

" show list of buffers on tabline when on a single tab
" when disabled shows same view as multi-tab view
" NOTE: #show_tabs = 0 sets list buffer view always on
let g:airline#extensions#tabline#show_buffers = 0

" remove X 'button' on right side of tabline
let g:airline#extensions#tabline#show_close_button = 0

" set airline tab formatting to short hand path except tail (filename)
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
