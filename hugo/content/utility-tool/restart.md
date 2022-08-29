+++
date = "2022-08-29T06:03:08+09:00"
title = "12.6. restart-emacs"
draft = false
+++
## [rstert-emacs.el] Emacsを再起動させる
🔗 [iqbalansari/restart-emacs: A simple emacs package to restart emacs from within emacs.](https://github.com/iqbalansari/restart-emacs) 

`restart-emacs` は、Emacsを再起動させるコマンドです。

`C-u` の数で再起動の方法を制御できます。

`M-x restart-emacs`
: 通常のEmacsを立ち上げる

`C-u M-x restart-emacs`
: emacs --debug-init

`C-u C-u M-x restart-emacs`
: emacs -Q

`C-u C-u C-u M-x restart-emacs`
: 引数を尋ねる

```elisp
(leaf restart-emacs
  :ensure t
  :bind ("C-x C-c" . restart-emacs))
```
