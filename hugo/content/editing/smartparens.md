+++
title = "7.9. smartparens"
draft = false
+++
### 対応する括弧の挿入をアシスト
[smartparens.el](https://github.com/Fuco1/smartparens) の設定がいまいちよくわからず、とりあえず次のように設定して今のところ機嫌よく働いている。 

```elisp
(leaf smartparens
  :ensure t
  :require smartparens-config
  :hook (prog-mode-hook . turn-on-smartparens-mode)
  :config
  (smartparens-global-mode t))
```
