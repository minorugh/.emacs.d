+++
title = "2.5. exec-path-from-shell"
draft = false
+++
* `exec-path-from-shell` は、シェルに設定した `PATH` の情報を継承して `exec-path` や `PATH` を設定してくれます。
* 自分は、`shell-commad` や `compile-command` をよく使うので必須のパッケージです。

[purcell/exec-path-from-shell: Make Emacs use the $PATH set up by the user's shell](https://github.com/purcell/exec-path-from-shell) 

```elisp
(leaf exec-path-from-shell
  :ensure t
  :when (memq window-system '(mac ns x))
  :hook (after-init-hook . exec-path-from-shell-initialize)
  :custom (exec-path-from-shell-check-startup-files . nil))
```
  
