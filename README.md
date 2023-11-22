# vim_plugin-binary_number_convert-

## これは何？
2進数から8・10・16進数に変換する。

## 使い方
nまたはvモード時に  
Ctrl+n → o(8進数)・d(10進数)・x(16進数)

nモード時はカーソル位置から後ろに対して実行。  
行頭あるいは01以外の文字の手前までの値を変換する。

vモード時は選択範囲内の全ての値に対して実行。  
01以外の文字が存在する場合はその文字の地点で区切られる。  
複数行の処理は未対応(複数行が選択されていた場合はエラーとなる)。