+++
title = "6.12. selected"
draft = false
+++

### [selected.el] リージョン選択時のアクションを制御
🔗 [Kungsgeten/selected.el: Keymap for when region is active.](https://github.com/Kungsgeten/selected.el) 

選択領域に対するスピードコマンドです。

Emacsバッファーで領域を選択した後、バインドしたワンキーを入力するとコマンドが実行されます。

```elisp
(leaf selected
  :ensure t
  :hook (after-init-hook . selected-global-mode)
  :bind (:selected-keymap
		 (";" . comment-dwim)
		 ("c" . clipboard-kill-ring-save)
		 ("s" . swiper-thing-at-point)
		 ("t" . google-translate-auto)
		 ("T" . chromium-translate)
		 ("W" . my:weblio)
		 ("k" . my:koujien)
		 ("e" . my:eijiro)
		 ("g" . my:google)))
```

### browse-urlで検索サイトで開く
検索結果を browse-url で表示させるユーザーコマンドは、検索 urlのフォーマットとさえわかれば、パッケージツールに頼らずともお好みのマイコマンドを作成できます。

```elisp
(defun my:koujien (str)
  (interactive (list (my:get-region nil)))
  (browse-url (format "https://sakura-paris.org/dict/広辞苑/prefix/%s"
                      (upcase (url-hexify-string str)))))

(defun my:weblio (str)
  (interactive (list (my:get-region nil)))
  (browse-url (format "https://www.weblio.jp/content/%s"
	                  (upcase (url-hexify-string str)))))

(defun my:eijiro (str)
  (interactive (list (my:get-region nil)))
  (browse-url (format "https://eow.alc.co.jp/%s/UTF-8/"
                      (upcase (url-hexify-string str)))))

(defun my:google (str)
	(interactive (list (my:get-region nil)))
	(browse-url (format "https://www.google.com/search?hl=ja&q=%s"
						(upcase (url-hexify-string str)))))

(defun my:get-region (r)
	"Get search word from region."
	(buffer-substring-no-properties (region-beginning) (region-end)))
```

### IME のオン・オフを自動制御する
selectedコマンドを選択するときは、IMEをOffにしないといけないのですがこれを自動でさせます。

領域を選択し始める時に IMEをオフにして、コマンド発行後に IMEを元に戻すという例が、
[`@takaxp`](https://qiita.com/takaxp) さんの [`Qiitaの記事`](https://qiita.com/takaxp/items/00245794d46c3a5fcaa8) にあったので、私の環境（emacs-mozc ）にあうように設定したら、すんなり動いてくれました。感謝！

```elisp
(leaf *cus-selected
  :hook ((activate-mark-hook . my:activate-selected)
		 (activate-mark-hook . (lambda () (setq my:ime-flag current-input-method) (my:ime-off)))
		 (deactivate-mark-hook . (lambda () (unless (null my:ime-flag) (my:ime-on)))))
  :init
  ;; Control mozc when seleceted
  (defun my:activate-selected ()
	(selected-global-mode 1)
	(selected--on)
	(remove-hook 'activate-mark-hook #'my:activate-selected))
  (add-hook 'activate-mark-hook #'my:activate-selected)
  (defun my:ime-on ()
	(interactive)
	(when (null current-input-method) (toggle-input-method)))
  (defun my:ime-off ()
	(interactive)
	(inactivate-input-method))

  (defvar my:ime-flag nil)
  (add-hook
   'activate-mark-hook
   #'(lambda ()
	   (setq my:ime-flag current-input-method) (my:ime-off)))
  (add-hook
   'deactivate-mark-hook
   #'(lambda ()
	   (unless (null my:ime-flag) (my:ime-on)))))
```
