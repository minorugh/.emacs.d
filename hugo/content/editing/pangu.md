+++
title = "7.13. pangu-spacing"
draft = false
+++

```elisp
;; Add space between full-width and half-width
(leaf pangu-spacing
  :ensure t
  :after mozc
  :hook ((markdown-mode-hook text-mode-hook) . pangu-spacing-mode)
  :config
  (setq pangu-spacing-include-regexp
		(rx (or (and (or (group-n 3 (any "。，！？；：「」（）、"))
						 (group-n 1 (or (category japanese))))))
			(group-n 2 (in "a-zA-Z")))))

```
