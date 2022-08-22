+++
title = "2.5. 設定をシェルから継承する"
draft = false
+++
* [purcell/exec-path-from-shell: Make Emacs use the $PATH set up by the user's shell](https://github.com/purcell/exec-path-from-shell) 

外部プログラムのサポートを得て動くパッケージは、設定の過程で「プログラムが見つからない」と怒られることがしばしばあります。 `exec-path-from-shell` は、シェルに設定した `PATH` の情報を継承して `exec-path` や `PATH` を設定してくれます。自分は、`shell-commad` や `compile-command` をよく使うので必須のパッケージです。

```elisp
(leaf exec-path-from-shell
  :ensure t
  :when (memq window-system '(mac ns x))
  :hook (after-init-hook . exec-path-from-shell-initialize)
  :custom (exec-path-from-shell-check-startup-files . nil))
```
  
