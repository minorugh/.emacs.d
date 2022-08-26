+++
title = "7.8. company"
draft = false
+++
### [company.el] 入力補完機能を提供
🔗 [company-mode/company.el: Modular completion framework.](https://github.com/company-mode/company-mode/blob/master/company.el) 

キーをタイプした時点で自動的に補完候補が出てきて、ミスタイプを減らして入力効率を上げる優れた補完機能です。
同種のものに日本では `auto-complete.el` が有名ですが、昨今は`company.el` の方が一般化しているようです。

デフォルトで自動的に補完候補がポップアップしますが、煩わしければ、
```elisp
(setq company-idle-delay nil)
```
とし、`company-complete` で手動で発動できます。 

```elisp
(leaf company
  :ensure t
  :hook (after-init-hook . global-company-mode)
  :bind (("C-1" . company-complete)
		 ("C-<tab>" . company-yasnippet)
		 (:company-active-map
		  ("<tab>" . company-complete-common-or-cycle)
		  ("<backtab>" . company-select-previous)
		  ("<muhenkan>" . company-abort)))
  :custom
  `((company-transformers . '(company-sort-by-backend-importance))
	(company-idle-delay . 0)
	(company-require-match . 'never)
	(company-minimum-prefix-length . 2)
	(company-selection-wrap-around . t)
	(completion-ignore-case . t)
	(company-dabbrev-downcase . nil))
  :config
  (defvar company-mode/enable-yas t
	"Enable yasnippet for all backends.")
  (defun company-mode/backend-with-yas (backend)
	(if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
		backend
	  (append (if (consp backend) backend (list backend))
			  '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
```

