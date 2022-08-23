+++
title = "7.. which-key"
draft = false
+++

### [which-key] キーバインドの選択肢をポップアップする
`guide-key.el` の後発、ディスパッチャが見やすく直感的でとても使いやすい。

```elisp
(leaf which-key
  :ensure t
  :hook (after-init-hook . which-key-mode)
  :custom (which-key-max-description-length . 40))
```
