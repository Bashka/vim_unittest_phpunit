" Date Create: 2015-05-28 10:34:05
" Last Change: 2015-05-28 10:34:23
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:Plugin = vim_lib#sys#Plugin#

let s:p = s:Plugin.new('vim_unittest_phpunit', '1', {'plugins': ['vim_unittest']})

call s:p.reg()
