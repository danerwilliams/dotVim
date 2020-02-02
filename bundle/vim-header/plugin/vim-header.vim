if exists('g:sample_plugin_loaded')
	finish
endif

if !exists('g:VimHeaderEmails')
	let g:VimHeaderEmails = 'You need to add the g:VimHeaderEmails variable to your .vimrc. See the README for instructions'
endif

if !exists('g:VimHeaderNames')
	let g:VimHeaderNames = 'You need to add the g:VimHeaderNames variable to your .vimrc. See the README for instructions'
endif
"Check if the program has python
if has("python")
let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
import vim_header
EOF

" Define functions in vim
function! InsertFunctionHeader()
		python vim_header.insert_function_header()
endfunction
command! -nargs=0 InsertFunctionHeader call InsertFunctionHeader()

function! InsertFileHeader()
	python vim_header.insert_file_header()
endfunction
command! -nargs=0 InsertFileHeader call InsertFileHeader()
finish
endif

"Check if the vim has python3
if has("python3")
let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
import vim_header
EOF

function! InsertFunctionHeader()
		python3 vim_header.insert_function_header()
endfunction
command! -nargs=0 InsertFunctionHeader call InsertFunctionHeader()

function! InsertFileHeader()
	python3 vim_header.insert_file_header()
endfunction
command! -nargs=0 InsertFileHeader call InsertFileHeader()
let g:sample_plugin_loaded = 1
finish
endif


if !has("python") && !has("python3")
	echo "vim has to be compiled with +python or +python3 to run this"
	finish
endif


