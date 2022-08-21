+++
title = "cursor"
draft = false
+++

## 4. カーソル移動
* 文字移動、行移動、スクロールは、素直に上下左右の矢印キーと`PgUp` `PgDn` を使っています。

### 4.1. [sequential-command.el] バッファー内のカーソル移動
* [https://github.com/HKey/sequential-command](https://github.com/HKey/sequential-command)

標準の `C-a` `C-e` を拡張し、バッファーの先頭と最終行への移動を簡単にしてくれます。
* `C-a` を連続で打つことで行頭→ファイルの先頭→元の位置とカーソルが移動
* `C-e` を連続で打つことで行末→ファイルの最終行→元の位置とカーソルが移動

地味ながら一度使うと便利すぎて止められません。

MELPAから Installできますが、私は HKey氏の改良版を `el-get` でインストールしました。

```emacs-lisp
(leaf sequential-command
  :doc "https://bre.is/6Xu4fQs6"
  :el-get HKey/sequential-command
  :config
  (leaf sequential-command-config
	:hook (emacs-startup-hook . sequential-command-setup-keys)))
```

### 4.2. ウインドウ間のカーソル移動
`C-c o` でもいいですが，ワンアクションで移動できるほうが楽なので、次のように双方向で使えるように設定しています．

画面分割されていないときは、左右分割して新しいウインドウに移動します。

```emacs-lisp
(defun other-window-or-split ()
 "With turn on dimmer."
 (interactive)
 (when (one-window-p)
	 (split-window-horizontally)
	 (follow-mode 1)
	 (dimmer-mode 1))
   (other-window 1))
(bind-key "C-q" 'other-window-or-split)
```

### 4.3. 対応する括弧を選択
* `C-M-SPC` (mark-sexp) は，カーソル位置から順方向に選択．
* `C-M-U` (backward-up-list) は，一つ外のカッコの先頭にポイントを移す．

上記標準機能は使いにくいので `my:jump-brace` を定義しました。
括弧の先頭と最後へ交互にポイント移動します。
```emacs-lisp
(defun my:jump-brace ()
 "Jump to the corresponding parenthesis."
 (interactive)
 (let ((c (following-char))
	 (p (preceding-char)))
   (if (eq (char-syntax c) 40) (forward-list)
	 (if (eq (char-syntax p) 41) (backward-list)
       (backward-up-list)))))
(bind-key "C-M-9" 'my:jump-brace)
```

### 4.4. マーク箇所を遡る
`C-u C-SPC` で辿れるようになります。
```emacs-lisp
(setq set-mark-command-repeat-pop t)
(setq mark-ring-max 32)
(setq global-mark-ring-max 64)
```
`C-x C-x` は、直前の編集ポイントと現在のポイントとを行き来できる設定です。

```emacs-lisp
(defun my:exchange-point-and-mark ()
  "No mark active `exchange-point-and-mark'."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark))		 
(bind-key "C-x C-x" 'my:exchange-point-and-mark)
```

### 4.5 [expand-region.el] カーソル位置を起点に選択範囲を賢く広げる
[`expand-region.el`](https://github.com/magnars/expand-region.el) は、カーソル位置を起点として前後に選択範囲を広げてくれます。

2回以上呼ぶとその回数だけ賢く選択範囲が広がりますが、2回目以降は設定したキーバインドの最後の一文字を連打すれば OKです。その場合、選択範囲を狭める時は - を押し， 0 を押せばリセットされます。

```emacs-lisp
(leaf expand-region
  :ensure t
  :bind ("C-@" . er/expand-region))
```
