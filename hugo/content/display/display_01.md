+++
title = "display_01"
draft = false
+++
## 5. 編集サポート / 入力補助
ファイル編集や入力補助の設定をまとめている。

### 5.1. 矩形編集/連番入力
24.4 からは、`rectangle-mark-mode` が使えるようになり `C-x SPC` を押下すると矩形モードに入り直感的に矩形選択ができる。

標準の `rect.el` に以下の機能が実装されている。

|矩形切り取り|	C-x r k |
|矩形削除	 |  C-x r d |
|矩形貼り付け|	C-x r y |
|矩形先頭に文字を挿入|	C-x r t |
|矩形を空白に変換する|	C-x r c |

### 5.2. markdownモード
[`markdown-mode.el`](https://github.com/jrblevin/markdown-mode) は、Markdown形式のテキストを編集するための主要なモードです。

```emacs-lisp
(leaf markdown-mode
  :ensure t
  :mode ("\\.md\\'")
  :custom `((markdown-italic-underscore . t)
            (markdown-asymmetric-header . t)
	        (markdown-fontify-emacs-lisp-blocks-natively . t))
```

markdownファイルのプレビューには、[`emacs-livedown`](https://github.com/shime/emacs-livedown) を使っています。
記事を書きながらライブでプレビュー出来るすぐれものです。

[https://github.com/shime/emacs-livedown](https://github.com/shime/emacs-livedown)

npmがインストールされたnodeが入っていことを確認してからlivedownをインストールします。
```emacs-lisp
$ npm install -g livedown
```

次にEmacsの設定を書きます。
MELPAにはないので`el-get` でインストールします。

```emacs-lisp
(leaf emacs-livedown
 :el-get shime/emacs-livedown
 :bind (("C-c C-c p" . livedown-preview)
        ("C-c C-c k" . livedown-kill)))
```

### 5.3. viewモード
特定の拡張子に対して常に view モードで開きたいときやgzされた emacs-lisp ソースを見るときに [view-mode](https://www.emacswiki.org/emacs/ViewMode) を使います。

下記の設定では、`my:auto-view-dirs` に追加したディレクトリのファイルを開くと `view-mode` が常に有効になります．

```emacs-lisp
(leaf view
  :hook ((find-file-hook . my:auto-view)
         (server-visit-hook . my:unlock-view-mode))
  :chord ("::" . view-mode)
  :bind (:view-mode-map
		 ("h" . backward-char)
		 ("l" . forward-char)
		 ("a" . beginning-of-buffer)
		 ("e" . end-of-buffer)
		 ("w" . forward-word)
		 ("b" . scroll-down)
		 ("c" . kill-ring-save)
		 ("r" . xref-find-references)
		 ("RET" . xref-find-definitions)
		 ("x" . my:view-del-char)
		 ("y" . my:view-yank)
		 ("d" . my:view-kill-region)
		 ("u" . my:view-undo)
		 ("m" . magit-status)
		 ("g" . my:google)
		 ("s" . swiper-region)
		 ("%" . my:jump-brace)
		 ("@" . counsel-mark-ring)
		 ("n" . my:org-view-next-heading)
		 ("p" . my:org-view-previous-heading)
		 ("o" . other-window-or-split)
		 ("G" . end-of-buffer)
		 ("0" . my:delete-window)
		 ("1" . my:delete-other-windows)
		 ("2" . my:split-window-below)
		 ("+" . text-scale-increase)
		 ("-" . text-scale-decrease)
		 ("/" . (lambda ()(interactive)(text-scale-set 0)))
		 ("_" . kill-other-buffers)
		 (":" . View-exit-and-edit)
		 ("i" . View-exit-and-edit)
		 ("]" . winner-undo)
		 ("[" . winner-redo)
		 ("." . hydra-view/body))
  :init
  ;; Specific extension / directory
  (defvar my:auto-view-regexp "\\.php\\|\\.pl\\|\\.el.gz?\\|\\.tar.gz?\\'")

  ;; Specific directory
  (defvar my:auto-view-dirs nil)
  (add-to-list 'my:auto-view-dirs "~/src/")
  (add-to-list 'my:auto-view-dirs "~/Dropbox/GH/")
  (add-to-list 'my:auto-view-dirs "/scp:xsrv:/home/minorugh/")

  (defun my:auto-view ()
	"Open a file with view mode."
	(when (file-exists-p buffer-file-name)
	  (when (and my:auto-view-regexp
				 (string-match my:auto-view-regexp buffer-file-name))
		(view-mode 1))
	  (dolist (dir my:auto-view-dirs)
		(when (eq 0 (string-match (expand-file-name dir) buffer-file-name))
		  (view-mode 1)))))

  (defun my:unlock-view-mode ()
	"Unlock view mode with git commit."
	(when (string-match "COMMIT_EDITMSG" buffer-file-name)
	  (view-mode 0))))
```
`view-mode` のときにモードラインの色を変えるのは [`viewer.el`]() を使うと設定が簡単です。

```emacs-lisp
;; Change-modeline-color
(leaf viewer
  :ensure t
  :hook (view-mode-hook . viewer-change-modeline-color-setup)
  :custom `((viewer-modeline-color-view . "#852941")
	        (viewer-modeline-color-unwritable . "#2F6828")))
```

`view-mode` からでも簡単な編集ができるように `vim like` なコマンドをいくつか作りました。

```emacs-lisp
(with-eval-after-load 'view
  ;; save-buffer no message
  (defun my:save-buffer ()
	"With clear Wrote message."
	(interactive)
	(save-buffer)
	(message nil))

  ;; Like as 'x' of vim
  (defun my:view-del-char ()
	"Delete charactor in view mode."
	(interactive)
	(view-mode 0)
	(delete-char 1)
	(my:save-buffer)
	(view-mode 1))

  ;; Like as 'dd' of vim
  (defun my:view-kill-region ()
	"If the region is active, to kill region.
If the region is inactive, to kill whole line."
	(interactive)
	(view-mode 0)
	(if (use-region-p)
		(kill-region (region-beginning) (region-end))
	  (kill-whole-line))
	(my:save-buffer)
	(view-mode 1))

  ;; Like as 'u' of vim
  (defun my:view-undo ()
	"Undo in view mode."
	(interactive)
	(view-mode 0)
	(undo)
	(my:save-buffer)
	(view-mode 1))

  ;; Like as 'y' of vim
  (defun my:view-yank ()
	"Yank in view mode."
	(interactive)
	(view-mode 0)
	(yank)
	(my:save-buffer)
	(view-mode 1))

  ;; Like as '%' of vim
  (defun my:jump-brace ()
	"Jump to the corresponding parenthesis."
	(interactive)
	(let ((c (following-char))
		  (p (preceding-char)))
	  (if (eq (char-syntax c) 40) (forward-list)
		(if (eq (char-syntax p) 41) (backward-list)
		  (backward-up-list)))))

  (defun my:org-view-next-heading ()
	"Org-view-next-heading."
	(interactive)
	(if (and (derived-mode-p 'org-mode)
			 (org-at-heading-p))
		(org-next-visible-heading 1)
	  (next-line)))

  (defun my:org-view-previous-heading ()
	"Org-view-previous-heading."
	(interactive)
	(if (and (derived-mode-p 'org-mode)
			 (org-at-heading-p))
		(org-previous-visible-heading 1)
	  (previous-line))))
```

### 5.4. web/htmlモード
HTML編集をするなら[web-mode](https://github.com/fxbois/web-mode) がお勧めなのですが、私の場合あまり使っていません。

出来上がったHTMLの内容を確認したり部分的に変更したり...という程度の使い方です。

```emacs-lisp
(leaf web-mode
  :ensure t
  :mode ("\\.js?\\'" "\\.html?\\'" "\\.php?\\'")
  :custom
  `((web-mode-markup-indent-offset . 2)
	(web-mode-css-indent-offset . 2)
	(web-mode-emacs-lisp-indent-offset . 2)))
```

### 5.5. [darkroom-mode] 執筆モード
[`darkroom.el`](https://github.com/joaotavora/darkroom)  は、画面の余計な項目を最小限にして、文章の執筆に集中できるようにするパッケージです。

[https://github.com/joaotavora/darkroom](https://github.com/joaotavora/darkroom)

[F12] キーで IN/OUT をトグルしています。
`darkroom-mode` から抜けるときは、`revert-buffer` で再読込してもとに戻します。

yes/no確認を聞かれるのが煩わしいので `my:revery-buffer-no-confirm` の関数を作りました。

```emacs-lisp
(leaf darkroom
  :ensure t
  :bind (("<f12>" . my:darkroom-in)
		 (:darkroom-mode-map
		  ("<f12>" . my:darkroom-out)))
  :config
  (defun my:darkroom-in ()
	"Enter to the `darkroom-mode'."
	(interactive)
	(view-mode 0)
	(diff-hl-mode 0)
	(display-line-numbers-mode 0)
	(darkroom-tentative-mode 1)
	(setq-local line-spacing 0.4))

  (defun my:darkroom-out ()
	"Returns from `darkroom-mode' to the previous state."
	(interactive)
	(my:linespacing)
	(darkroom-tentative-mode 0)
	(display-line-numbers-mode 1)
	(my:revert-buffer-no-confirm))

  (defun my:revert-buffer-no-confirm ()
	"Revert buffer without confirmation."
	(interactive)
	(revert-buffer t t)))
```

### 5.6. [yatex] YaTexで LaTex編集
[`yatex.el`](https://github.com/emacsmirror/yatex) は、Emacsの上で動作する LaTeX の入力支援環境です。

ごく一般的な設定例ですが、参考になるとしたら `dviprint-command-format` に `dvpd.sh` というスクリプトを設定して、`YateX.lpr`
コマンドでPDF作成 → プレビューまでの手順を一気に出来るように自動化している点でしょうか。

```emacs-lisp
(leaf yatex
  :ensure t
  :mode ("\\.tex\\'" "\\.sty\\'" "\\.cls\\'")
  :custom `((tex-command . "platex")
			(dviprint-command-format . "dvpd.sh %s")
			(YaTeX-kanji-emacs-lisp . nil)
			(YaTeX-latex-message-emacs-lisp . 'utf-8)
			(YaTeX-default-pop-window-height . 15))
  :config
  (leaf yatexprc
	:bind (("M-c" . YaTeX-typeset-buffer)
		   ("M-v" . YaTeX-lpr))))
```
`YaTeX-lpr` は、`dviprint-command-format` を呼び出すコマンドです。

dviファイルから dvipdfmx で PDF作成したあと、ビューアーを起動させて表示させるところまでをバッチファイルに書き、`chmod +x dvpd.sh ` として実行権限を付与してからPATHの通ったところに置きます。私は、`/usr/loca/bin` に置きました。

[dvpd.sh]
```sh
#!/bin/emacs-lisp
name=$1
dvipdfmx $1 && evince ${name%.*}.pdf
# Delete unnecessary files
rm *.au* *.dv* *.lo*
```
上記の例では、ビューアーに Linux の evince を設定していますが、Mac の場合は、下記のようになるかと思います。

```sh
dvipdfmx $1 && open -a Preview.app ${name%.*}.pdf
```

### 5.7. [yasunippet] Emacs用のテンプレートシステム
テンプレート挿入機能を提供してくれるやつです。
```emacs-lisp
(leaf yasnippet
  :ensure t
  :hook (after-init-hook . yas-global-mode)
  :config
  (leaf yasnippet-snippets :ensure t))
```

以下の設定を追加すると[`company-mode`](https://github.com/company-mode/company-mode) と連携してとても使いやすくなる。
```emacs-lisp
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
	  backend
	(append (if (consp backend) backend (list backend))
    	    '(:with company-yasnippet))))
(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
(bind-key "C-<tab>" 'company-yasunippets)
```

### 5.8. [iedit] 選択領域を別の文字列に置き換える
[`idet.el`](https://github.com/victorhge/iedit) は、バッファー内の複数箇所を同時に編集するツールです。

同じような機能のものは、複数あるようですが、わたしはこれを愛用しています。
* [`multi-cursors.el`](https://github.com/magnars/multiple-cursors.el) 
* [`replace-from-region.el`](https://www.emacswiki.org/emacs/replace-from-region.el) 
* [`anzu.el`](https://github.com/emacsorphanage/anzu) 

MELPAからpackage-installするだけで使えます。

対象範囲を選択して `C-;` を押すとiedit-modeとなり、選択したキーワードが全てハイライト表示され、モードラインに押すとIedit:とキーワードの出現した回数が表示され、ミニバッファにもメッセージが表示されます。

ここで、ハイライトされた部分を編集すると、他のハイライトも同時に編集されるようになります。編集後、もう一度 `C-;` を押すと確定されiedet-modeを抜けます。

かなりの頻度で使うので、Emacsでは使うことのない `<insert>` にキーバインドしています。

```emacs-lisp
(leaf iedit
  :ensure t
  :bind ("<insert>" . iedit-mode))
```

### 5.9. [selected] リージョン選択時のアクションを制御
[`selected.el`](https://github.com/Kungsgeten/selected.el) は、選択領域に対するスピードコマンドです。

Emacsバッファーで領域を選択した後、バインドしたワンキーを入力するとコマンドが実行されます。
コマンドの数が増えてきたら、ヘルプ代わりに使える [`counsel-selected`](https://github.com/takaxp/counsel-selected) も便利そうです。
```emacs-lisp
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

### 5.10. [selected] browse-urlで検索サイトで開く
検索結果を browse-url で表示させるユーザーコマンドは、検索 urlのフォーマットとさえわかれば、パッケージツールに頼らずともお好みのマイコマンドを作成できます。

```emacs-lisp
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

### 5.11. [selected] IME のオン・オフを自動制御する
selectedコマンドを選択するときは、IMEをOffにしないといけないのですがこれを自動でさせます。

領域を選択し始める時に IMEをオフにして、コマンド発行後に IMEを元に戻すという例が、
[`@takaxp`](https://qiita.com/takaxp) さんの [`Qiitaの記事`](https://qiita.com/takaxp/items/00245794d46c3a5fcaa8) にあったので、私の環境（emacs-mozc ）にあうように設定したら、すんなり動いてくれました。感謝！

```emacs-lisp
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

### 5.12. [swiper-migemo] ローマ字入力で日本語を検索
[`avy-migemo-e.g.swiper.el`](https://github.com/momomo5717/avy-migemo) を使って出来ていたのですが、２年ほど前から更新が止まってしまっていて動きません。

つい最近、avy-migemo を使わない [`swiper-migemo`](https://github.com/tam17aki/swiper-migemo)を GitHubで見つけたので試した処、機嫌よく動いてくれています。
MELPAにはアップされていないみたいなので el-get で取得しています。

```emacs-lisp
(leaf swiper-migemo
  :el-get tam17aki/swiper-migemo
  :global-minor-mode t)
```

### 5.13. [smartparent] 対応する括弧の挿入をアシスト
[smartparens.el](https://github.com/Fuco1/smartparens) の設定がいまいちよくわからず、とりあえず次のように設定して今のところ機嫌よく働いている。 

```emacs-lisp
(leaf smartparens
  :ensure t
  :require smartparens-config
  :hook (prog-mode-hook . turn-on-smartparens-mode)
  :config
  (smartparens-global-mode t))
```

### 5.14. [key-chord.el] 同時押しでキーバインド
* 同時押しというキーバインドを提供してくれるやつ
* 同時押し時の許容時間、その前後で別のキーが押されていたら発動しない判断をする、みたいな設定を入れている。

```emacs-lisp
(leaf key-chord
  :ensure t
  :hook (after-init-hook . key-chord-mode)
  :chord (("df" . counsel-descbinds)
		  ("l;" . init-loader-show-log)
		  ("@@" . howm-list-all)
		  ("jk" . open-junk-file))
  :custom
  `((key-chord-two-keys-delay . 0.25)
	(key-chord-safety-interval-backward . 0.1)
	(key-chord-safety-interval-forward  . 0.15)))
```
キーの同時押し判定は 0.15 秒で、それらのキーが押される直前の 0.1 秒以内、または直後の 0.15 秒に押されていたら発動しない、という設定にしている。

改良版の作者の記事だと、直後判定は 0.25 秒で設定されていたが自分は `Hydra` の起動にも使っている上に、よく使うやつは覚えているので表示を待たずに次のキーを押すので 0.25 秒も待っていられないという事情があった。

### 5.15. [fontawesome] fontawesome utility
[`fontawesome.el`](https://github.com/emacsorphanage/fontawesome) は、Emacs での `fontawesome` の入力が簡単に出来るユーティリティです。`helm` や `ivy` とも勝手に連携してくれる。

```emacs-lisp
(leaf FontAwesome
 :ensure t
 :bind ("s-a" . councel-fontawesome))
```
