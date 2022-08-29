+++
date = "2022-08-29T05:58:29+09:00"
title = "9.4. savehist"
draft = false
+++
## ミニバッファの履歴などを保存してくれる機能
プログラミングを生業にしている人にはとても重要なものらしい。

```elisp
;; Don't clear kill-ring when restart emacs
(savehist-additional-variables . '(kill-ring))
```
