+++
title = "10.6. counsel-tramp"
draft = false
+++
### [counsel-tramp.el] 
🔗 [masasam/emacs-counsel-tramp: Tramp ivy interface for ssh and docker and ‎vagrant.](https://github.com/masasam/emacs-counsel-tramp) 

```elisp
(leaf counsel-tramp
  :ensure t
  :custom `((tramp-persistency-file-name . ,"~/.emacs.d/tmp/tramp")
	        (tramp-default-method . "scp")
	        (counsel-tramp-custom-connections
	         . '(/scp:xsrv:/home/minorugh/gospel-haiku.com/public_html/)))
  :config
  (defun my:tramp-quit ()
	"Quit tramp, if tramp connencted."
	(interactive)
	(when (get-buffer "*tramp/scp xsrv*")
	  (tramp-cleanup-all-connections)
	  (counsel-tramp-quit)
	  (message "Tramp Quit!"))))
```
