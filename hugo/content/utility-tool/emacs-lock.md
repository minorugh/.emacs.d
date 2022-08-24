### 13.1. Scratch バッファーを消さない
難しく関数を設定せずとも内蔵コマンドで簡単に実現できます。

```elisp
;; Set buffer that can not be killed
(with-current-buffer "*scratch*"
  (emacs-lock-mode 'kill))
(with-current-buffer "*Messages*"
  (emacs-lock-mode 'kill))
```
