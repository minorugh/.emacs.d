+++
title = "9.5. savehist"
draft = false
+++
### [savehist] ミニバッファの履歴などを保存してくれる機能
プログラミングを生業にしている人にはとても重要なものらしい。

```elisp
;; Don't clear kill-ring when restart emacs
(savehist-additional-variables . '(kill-ring))
```
