" Date Create: 2015-05-28 10:36:14
" Last Change: 2015-06-11 23:27:43
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:AdapterInterface = vim_unittest#AdapterInterface
let s:System = vim_lib#sys#System#.new()
let s:File = vim_lib#base#File#

let s:Class = s:AdapterInterface.expand()

function! s:Class.exec(comm) " {{{
  let l:cwd = getcwd()
  exe 'cd ' . self.testDir
  call s:System.exe('phpunit --colors ' . a:comm)
  exe 'cd ' . l:cwd
endfunction " }}}

function! s:Class.silentExec(comm) " {{{
  let l:cwd = getcwd()
  exe 'cd ' . self.testDir
  call s:System.silentExe('phpunit ' . a:comm . ' > errors.err')
  exe 'cd ' . l:cwd

  let l:efm = &errorformat
  let l:ef = &errorfile

  set efm=%f:%l
  let &errorfile = g:vim_unittest#.testDir . s:File.slash . 'errors.err'
  cg
  cope

  let &errorformat = l:efm
  let &errorfile = l:ef
endfunction " }}}

function! s:Class.run() " {{{
  call self.silentExec('.')
endfunction " }}}

function! s:Class.runFile(file) " {{{
  call self.silentExec(a:file)
endfunction " }}}

function! s:Class.runTest(file, test) " {{{
  call self.silentExec('--filter ' . a:test . ' ' . a:file)
endfunction " }}}

let g:vim_unittest_phpunit#adapter = s:Class
