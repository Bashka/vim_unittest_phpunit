" Date Create: 2015-05-28 10:36:14
" Last Change: 2015-05-28 17:01:12
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:AdapterInterface = vim_unittest#AdapterInterface
let s:System = vim_lib#sys#System#.new()

let s:Class = s:AdapterInterface.expand()

function! s:Class.exec(comm) " {{{
  let l:cwd = getcwd()
  exe 'cd ' . self.testDir
  call s:System.exe('phpunit ' . a:comm)
  exe 'cd ' . l:cwd
endfunction " }}}

function! s:Class.run() " {{{
  call self.exec('.')
endfunction " }}}

function! s:Class.runFile(file) " {{{
  call self.exec(a:file)
endfunction " }}}

function! s:Class.runTest(file, test) " {{{
  call self.exec('--filter ' . a:test . ' ' . a:file)
endfunction " }}}

let g:vim_unittest_phpunit#adapter = s:Class
