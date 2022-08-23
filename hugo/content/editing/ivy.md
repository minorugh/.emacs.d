+++
title = "7.6. ivy / counsel"
draft = false
weight = 6
+++

`ivy` は、`helm` と双璧を成す Emacsの補完システムです。

リスト表示された多くの選択肢から、自分が使いたいものを高速に絞り込んで効率良く選び出す。
このシンプルかつ極めて重要なタスクを `ivy` が手助けしてくれます．

```elisp
(leaf counsel
  :ensure t
  :defer-config (ivy-mode)
  :bind (("C-r" . swiper-thing-at-point)
		 ("C-s" . swiper-region)
		 ("C-:" . counsel-switch-buffer)
		 ("s-a" . counsel-ag)
		 ("s-r" . counsel-rg)
		 ("s-f" . counsel-fontawesome)
		 ("M-x" . counsel-M-x)
		 ("M-y" . counsel-yank-pop)
		 ("C-x m" . counsel-mark-ring)
		 ("C-x C-b" . ibuffer)
		 ("C-x C-f" . counsel-find-file)
		 ("C-x C-r" . counsel-recentf))
  :custom `((search-default-mode . nil)
			(ivy-use-virtual-buffers . t)
			(ivy-use-selectable-prompt . t)
			(enable-recursive-minibuffers . t)
			(counsel-find-file-ignore-regexp . (regexp-opt completion-ignored-extensions))
			(ivy-format-functions-alist . '((t . my:ivy-format-function-arrow)))))
```

### 現在の選択候補をわかりやすくする
`ivy-format-functions-alist` にカスタマイズした関数を追加すれば、プロンプトの下部に位置するカーソル行の表示を変更できます。
`all-the-icons` を導入して好みのアイコンでカーソル行のある選択候補を目立たせましょう。

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
```

### ivy-rich
ivy-rich を導入するとアイコンが追加され、さらに追加の情報が空きスペースに記述されるようになります。

```elisp
(leaf ivy-rich
  :ensure t
  :hook (after-init-hook . ivy-rich-mode))
```

### amx
`amx` は、Emacsコマンド `M-x` の代替インターフェイスですが、コマンドの使用履歴を保存・利用してくれる優れものです。
導入することで`counsel-M-x` とも自動的に連携して効率の良い補完システムを提供します。

```elisp
(leaf amx
  :ensure t
  :custom `((amx-save-file . ,"~/.emacs.d/tmp/amx-items")
	        (amx-history-length . 20)))
```

### swiper-region
`swiper-thing-at-point` は賢くて親切なのですが、key-wordを入力して検索したいときには使いづらいです。
自分の使い勝手に合わせてカスタマイズしました。

```elisp
(defun swiper-region ()
  "If region is selected, `swiper-thing-at-point'.
If the region isn't selected, `swiper'."
  (interactive)
  (if (not (use-region-p))
	  (swiper)
    (swiper-thing-at-point)))
```

### 高速全文検索
2文字でも検索が発動するようにカスタマイズしています。`@takaxp` さんのTipsからパクってきました。

```elisp
(with-no-warnings
  (defun ad:counsel-ag (f &optional initial-input initial-directory extra-ag-args ag-prompt caller)
	(apply f (or initial-input
				 (and (not (thing-at-point-looking-at "^\\*+"))
                      (ivy-thing-at-point)))
           (unless current-prefix-arg
			 (or initial-directory default-directory))
           extra-ag-args ag-prompt caller)))

(with-eval-after-load "counsel"
  (require 'thingatpt nil t)
  (advice-add 'counsel-ag :around #'ad:counsel-ag)
  ;; Make search trigger even with 2 characters
  (add-to-list 'ivy-more-chars-alist '(counsel-ag . 2))

  (ivy-add-actions
   'counsel-ag
   '(("r" my:counsel-ag-in-dir "search in directory"))))

(defun my:counsel-ag-in-dir (_arg)
  "Search again with new root directory."
  (let ((current-prefix-arg '(4)))
    (counsel-ag ivy-text nil "")))
```

