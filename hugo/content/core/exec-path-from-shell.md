+++
title = "2.5. exec-path-from-shell"
draft = false
+++
### [exec-path-from-shell.el] 設定をシェルから継承する

🔗 [purcell/exec-path-from-shell: Make Emacs use the $PATH set up by the user's shell](https://github.com/purcell/exec-path-from-shell) 

シェルに設定した `PATH`情報をEmacsにも継承して設定してくれます。

```elisp
(leaf exec-path-from-shell
  :ensure t
  :when (memq window-system '(mac ns x))
  :hook (after-init-hook . exec-path-from-shell-initialize)
  :custom (exec-path-from-shell-check-startup-files . nil))
```
  
