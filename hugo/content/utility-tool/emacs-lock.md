+++
title = "12.2. emacs-lok-mode"
draft = false
+++
## Scratch バッファーを消さない
難しい関数を設定せずともビルトインコマンドで簡単に実現できます。

```elisp
;; Set buffer that can not be killed
(with-current-buffer "*scratch*"
  (emacs-lock-mode 'kill))
(with-current-buffer "*Messages*"
  (emacs-lock-mode 'kill))
```
