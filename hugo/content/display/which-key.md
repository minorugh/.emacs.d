+++
date = "2022-08-29T05:52:08+09:00"
title = "7.1. which-key"
draft = false
+++
## [which-key.el] キーバインドの選択肢をポップアップする
🔗 [justbur/emacs-which-key: Emacs package that displays available keybindings in popup.](https://github.com/justbur/emacs-which-key) 

`guide-key.el` の後発、ディスパッチャが見やすく直感的でとても使いやすい。

```elisp
(leaf which-key
  :ensure t
  :hook (after-init-hook . which-key-mode)
  :custom (which-key-max-description-length . 40))
```

