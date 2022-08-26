+++
title = "8.2. hydra-make"
draft = false
+++

### hydra-make 
🔗 [自動化のための nmake 入門講座: 石井勝](http://objectclub.jp/community/memorial/homepage3.nifty.com/masarl/article/nmake.html) 

上記記事を読んで自分革命がありました。
1. 同じことは2度しない
2. 必ずしなければならない作業 → 自動化できないか考える

…ということで、私は多くの日常ワークを `make` で自動化しています。目的に応じて選択実行するために `hydra-make` でメニュー化しています。

```elisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make command configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(leaf *user-make-configulation
  :mode (("\\.mak\\'" "makefile\\'") . makefile-mode)
  :hydra
  (hydra-make
   (:hint nil :exit t)
   "
     make:_k_  _u_psftp  _m_ove  _d_raft  _b_klog  _g_it  _s_ort  _c_lean  🐾
"
   ("k" my:make-k)
   ("u" my:make-upsftp)
   ("m" my:make-move)
   ("d" my:make-draft)
   ("b" my:make-bklog)
   ("g" my:make-git)
   ("s" my:make-sort)
   ("c" my:make-clean)
   ("<muhenkan>" nil))
  :init
  (setq compilation-scroll-output t)
  (setq compilation-always-kill t)
  (setq compilation-finish-functions 'compile-autoclose)

  (defun compile-autoclose (buffer string)
	"Automatically close the compilation buffer."
	(cond ((string-match "finished" string)
		   (bury-buffer "*compilation*")
		   (delete-other-windows)
		   (message "Build successful."))
		  (t (message "Compilation exited abnormally: %s" string)))))
```

### make command functions
適宜必要な `make` 実行コマンドを定義しています。

例えば、詳細に `commit message` を残さなくてもいいような Gitリポジトリは、自動コミットです。
`make git` で実行されます。

```makefile
# makefile for auto commit
git:
	git add . && git diff --cached --exit-code --quiet && echo "\nnothing to commit, working tree clean!"|| \
	git commit -a -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`" && \
	git push origin master
```

実行関数は、コマンドを実行しながら、Emacs上で別の作業をさせることができる `compile` を使います。

* 参考: [Emacsからの安全なシェルコマンド実行: @tadsan](https://qiita.com/tadsan/items/17d32514b81f1e8f208a) 

`compile` 実行環境として以下を設定しています。

* コンパイルが進むのに合わせて `*Compile*` バッファーをスクロールさせる
* 正常終了したら確認なしで自動的にコンパイル実行をkillする
* 正常終了したら `*Compiltion*` バッファーを自動で閉じる

```elisp
(setq compilation-scroll-output t)
(setq compilation-always-kill t)
(setq compilation-finish-functions 'compile-autoclose)

(defun compile-autoclose (buffer string)
  "Automatically close the compilation buffer."
  (cond ((string-match "finished" string)
         (bury-buffer "*compilation*")
		 (delete-other-windows)
		 (message "Build successful."))
		 (t (message "Compilation exited abnormally: %s" string))))
```

実行コマンドの一例は以下のとおり。

```elisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My make command functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my:make-k ()
  "Make k."
  (interactive)
  (compile "make -k"))

(defun my:make-draft ()
  "Make kinnei draft."
  (interactive)
  (compile "make df"))

(defun my:make-upsftp ()
  "Make upfstp."
  (interactive)
  (compile "make up"))

(defun my:make-move ()
  "Make move."
  (interactive)
  (compile "make mv"))

(defun my:make-bklog ()
  "Make bklog."
  (interactive)
  (compile "make bk"))

(defun my:make-git ()
  "Make git."
  (interactive)
  (compile "make git"))

(defun my:make-sort ()
  "Make sort for filelist."
  (interactive)
  (compile "make sort")
  (find-file "~/Dropbox/GH/upsftp/filelist.txt")
  (goto-char (point-min)))

(defun my:make-clean ()
  "Make clean."
  (interactive)
  (compile "make clean"))
```
