+++
date = "2022-08-29T06:01:24+09:00"
title = "10.9. easy-hugo"
draft = false
weight = 9
+++

## [eagy-hugo.el] マルチブログ管理
[masasam/emacs-easy-hugo: Emacs major mode for managing hugo.](https://github.com/masasam/emacs-easy-hugo) 

Hugoで作成された複数のブログを管理するための Emacs メジャー モードです。

作者の [@masasam](https://twitter.com/SolistWork) さんが、私の多くの要望を受け入れて完成してくださいました。感謝！ 

静的サイトジェネレータ「Hugo」は、とても簡単に構築できるので、私の場合、公開ページの他にプライベートな書庫代わりとしても使っています。
数えたらなんと９個も…

`minorugh.github.io` をGitHub Pagesで公開しています。

```elisp
(leaf easy-hugo
  :ensure t
  :bind (("C-c C-e" . easy-hugo)
		 (:easy-hugo-mode-map
		  ([tab] . easy-hugo-no-help)
		  ("o" . easy-hugo-open-basedir)
		  ("r" . easy-hugo-rename)
		  ("e" . my:edit-easy-hugo)))
  :config
  ;; Load custom function for evil-mode
  (load-file "~/.emacs.d/template/my:evil-easy-hugo.el")
  :init
  ;; Main blog (=blog1)
  (setq easy-hugo-basedir "~/Dropbox/minorugh.com/snap/")
  (setq easy-hugo-url "https://snap.minorugh.com")
  (setq easy-hugo-sshdomain "xsrv")
  (setq easy-hugo-root "/home/minorugh/minorugh.com/public_html/snap/")
  (setq easy-hugo-previewtime "300")
  (setq easy-hugo-bloglist
		'(;; blog2 setting
		  ((easy-hugo-basedir . "~/src/github.com/minorugh/.emacs.d/hugo/")
		   (easy-hugo-url . "https://minorugh.github.io/.emacs.d")
		   (easy-hugo-postdir . "content/startup")
		   (easy-hugo-preview-url . "http://localhost:1313/.emacs.d/"))
		  ;; blog3 setting
		  ((easy-hugo-basedir . "~/src/github.com/minorugh/minorugh.github.io/")
		   (easy-hugo-url . "https://minorugh.github.io")
		   (easy-hugo-postdir . "content/posts"))
		  ;; blog4 setting
		  ((easy-hugo-basedir . "~/Dropbox/GH/gg/")
		   (easy-hugo-url . "https://gg.gospel-haiku.com")
		   (easy-hugo-sshdomain . "xsrv")
		   (easy-hugo-root . "/home/minorugh/gospel-haiku.com/public_html/gg/"))
		  ;; blog5 setting
		  ((easy-hugo-basedir . "~/Dropbox/GH/blog/")
		   (easy-hugo-url . "https://blog.gospel-haiku.com")
		   (easy-hugo-sshdomain . "xsrv")
		   (easy-hugo-root . "/home/minorugh/gospel-haiku.com/public_html/blog/"))
		  ;; blog6 setting
		  ((easy-hugo-basedir . "~/Dropbox/GH/es/")
		   (easy-hugo-url . "https://es.gospel-haiku.com")
		   (easy-hugo-sshdomain . "xsrv")
		   (easy-hugo-root . "/home/minorugh/gospel-haiku.com/public_html/es/"))
		  ;; blog7 setting
		  ((easy-ugo-basedir . "~/Dropbox/minorugh.com/bible/")
		   (easy-hugo-url . "https://bible.minorugh.com")
		   (easy-hugo-sshdomain . "xsrv")
		   (easy-hugo-root . "/home/minorugh/minorugh.com/public_html/bible/"))
		  ;; blog8 setting
		  ((easy-hugo-basedir . "~/Dropbox/minorugh.com/tube/")
		   (easy-hugo-url . "https://tube.minorugh.com")
		   (easy-hugo-sshdomain . "xsrv")
		   (easy-hugo-root . "/home/minorugh/minorugh.com/public_html/tube/"))
		  ;; blog9 setting
		  ((easy-hugo-basedir . "~/Dropbox/minorugh.com/ryo/")
		   (easy-hugo-url . "https://ryo.minorugh.com")
		   (easy-hugo-sshdomain . "xsrv")
		   (easy-hugo-root . "/home/minorugh/minorugh.com/public_html/ryo/"))))

  ;; Customize for my help menu
  (setq easy-hugo-help-line 5
		easy-hugo-help "
  n .. New blog post    r .. Rename file     p .. Preview          g .. Refresh
  d .. Delete post      a .. Search blog ag  P .. Publish clever   G .. GitHub deploy
  c .. Open config      o .. Open base dir   < .. Previous blog    > .. Next bloge
  , .. Prev postdir     . .. Next postdir    ; .. Select blog      v .. Open view mode
  N .. No help [tab]    s .. Sort time       u .. Sort Publish     e .. Edit easy-hugo
")
  :preface
  (leaf popup :ensure t)
  (leaf request	:ensure t
	:custom (request-storage-directory . "~/.emacs.d/tmp/request"))

  (defun my:edit-easy-hugo ()
	"Edit setting file for 'easy-hugo'."
	(interactive)
	(find-file "~/.emacs.d/inits/60_easy-hugo.el")
	(view-mode -1)
	(forword-line 2)))	
```

## evil-mode対応
`evil-mode` を導入すると何かと衝突するため使いづらい面が出てきます。

### 1. メニュー画面
何もしなければ `evil-normal-stete` で起動し`easy-hugo-mode` のkeybindを奪うので `evil-emacs-state` で起動するよう変更します。下記のEvilの標準設定で解決できます。

```emacs-lisp
(add-to-list 'evil-emacs-state-modes 'easy-hugo-mode)
```

### 2. 新規記事作成
メニュー画面から新規記事作成画を選択したとき `evil-normal-state` で開かれるため、その都度挿入モードに切り替える必要があり面倒です。

そこで新規記事作成時は、`evil-mode` を自動判別して `evil-insert-state` でファイルを開くように改変した関数を上書きロードするようにしました。

```emacs-lisp
;; Load custom function for evil-mode
(load-file "~/.emacs.d/template/my:evil-easy-hugo.el")
```

