" Date Create: 2015-05-28 10:36:14
" Last Change: 2015-05-28 11:22:17
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:AdapterInterface = vim_unittest#AdapterInterface
let s:System = vim_lib#sys#System#.new()

let s:Class = s:AdapterInterface.expand()

function! s:Class.run(testDir) " {{{
  let l:cwd = getcwd()
  exe 'cd ' . a:testDir
  call s:System.exe('phpunit .')
  exe 'cd ' . l:cwd
endfunction " }}}

let g:vim_unittest_phpunit#adapter = s:Class
