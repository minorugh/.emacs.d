+++
title = "7.10. iedit"
draft = false
weight = 10
+++
### [iedit] 選択領域を別の文字列に置き換える

* [`idet.el`](https://github.com/victorhge/iedit) は、バッファー内の複数箇所を同時に編集するツールです。

同じような機能のものは、複数あるようですが、わたしはこれを愛用しています。
* [`multi-cursors.el`](https://github.com/magnars/multiple-cursors.el) 
* [`replace-from-region.el`](https://www.emacswiki.org/emacs/replace-from-region.el) 
* [`anzu.el`](https://github.com/emacsorphanage/anzu) 

MELPAからpackage-installするだけで使えます。

対象範囲を選択して `C-;` を押すとiedit-modeとなり、選択したキーワードが全てハイライト表示され、モードラインに押すとIedit:とキーワードの出現した回数が表示され、ミニバッファにもメッセージが表示されます。

ここで、ハイライトされた部分を編集すると、他のハイライトも同時に編集されるようになります。編集後、もう一度 `C-;` を押すと確定されiedet-modeを抜けます。

かなりの頻度で使うので、Emacsでは使うことのない `<insert>` にキーバインドしています。
