"
" autoloadディレクトリ
" 必要になったタイミングで読み込まれるスクリプトファイルを置く.
" 呼び出される関数を書く
"

" vimのスクリプトファイルが指定したエンコーディングで読み込まれることを保証.
scriptencoding utf-8

" 読み込み制御用の変数が未定義なら、
" plugin以下のスクリプトが読み込まれていないと判断できるため処理を抜ける.
if !exists('g:loaded_amatatsu')
  finish
endif

let g:loaded_amatatsu = 1

" ユーザー設定を一時退避.
let s:save_cpo = &cpo
set cpo&vim

" ランダムな値n(min =< n =< max)を返す.
function! amatatsu#getRandom(min, max)
  " 余りの最大値は分母から1を引いた値になる.
  return reltime()[1] % (a:max - a:min + 1) + a:min
endfunction

function! amatatsu#amatatsuRandom()
  :let weather_list = ["Sunny","Cloudy","Rainy","Snowy", "Amatatsu"]
  :let index = amatatsu#getRandom(0, 4)
  echo weather_list[index]
endfunction

" 退避していたユーザ設定を戻す.
let &cpo = s:save_cpo
unlet s:save_cpo

