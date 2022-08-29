+++
date = "2022-08-29T05:53:26+09:00"
title = "6.10. iedit"
draft = false
weight = 10
+++
## [iedit.el] 選択領域を別の文字列に置き換える
🔗 [victorhge/iedit: Modify multiple occurrences simultaneously.](https://github.com/victorhge/iedit) 

バッファー内の複数箇所を同時に編集するツールです。

対象範囲を選択して `C-;` を押すとiedit-modeとなり、選択したキーワードが全てハイライト表示され、モードラインにキーワードの出現した回数が表示され、ミニバッファにもメッセージが表示されます。

ハイライトされた部分を編集すると、他のハイライトも同時に編集されるようになります。編集後、もう一度 `C-;` を押すと確定され `iedet-mode`を抜けます。

Emacsでは使うことのない `<insert>` にキーバインドして重宝しています。
