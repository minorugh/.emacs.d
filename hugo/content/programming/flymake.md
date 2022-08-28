+++
title = "10.3. flymake"
draft = false
weight = 3
+++
## [flymake] 構文エラー表示
ビルトインの `flymake-mode` が軽くて使いやすくなったので、`flycheck` から移行しました。

```elisp
(leaf flymake
  :hook (prog-mode-hook . flymake-mode)
  :config
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
  (leaf flymake-posframe
	:el-get Ladicle/flymake-posframe
	:hook (flymake-mode-hook . flymake-posframe-mode)
	:custom (flymake-posframe-error-prefix . " ")))
```
