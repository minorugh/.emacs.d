+++
title = "4.4. ivy-format-function-arrow"
draft = false
+++

* `ivy-mode` の選択行をアイコンで強調する設定です。

```elisp
  (defun my:ivy-format-function-arrow (cands)
	"Transform into a string for minibuffer with CANDS."
	(ivy--format-function-generic
	 (lambda (str)
	   (concat (if (display-graphic-p)
				   (all-the-icons-octicon "chevron-right" :height 0.8 :v-adjust -0.05)
				 ">")
			   (propertize " " 'display `(space :align-to 2))
			   (ivy--add-face str 'ivy-current-match)))
	 (lambda (str)
	   (concat (propertize " " 'display `(space :align-to 2)) str))
	 cands
	 "\n"))
(setq ivy-format-functions-alist '((t . my:ivy-format-function-arrow)))
```
