+++
title = "7.1. markdown-mode"
draft = false
weight = 1
+++
### 5.2. markdownモード
[`markdown-mode.el`](https://github.com/jrblevin/markdown-mode) は、Markdown形式のテキストを編集するための主要なモードです。

```elisp
(leaf markdown-mode
  :ensure t
  :mode ("\\.md\\'")
  :custom
  `((markdown-italic-underscore . t)
    (markdown-asymmetric-header . t)
	(markdown-fontify-code-blocks-natively . t))
```

markdownファイルのプレビューには、[`emacs-livedown`](https://github.com/shime/emacs-livedown) を使っています。
記事を書きながらライブでプレビュー出来るすぐれものです。

[https://github.com/shime/emacs-livedown](https://github.com/shime/emacs-livedown)

npmがインストールされたnodeが入っていことを確認してからlivedownをインストールします。

```session
$ npm install -g livedown
```

次にEmacsの設定を書きます。
MELPAにはないので`el-get` でインストールします。

```elisp
(leaf emacs-livedown
 :el-get shime/emacs-livedown
 :bind (("C-c C-c p" . livedown-preview)
        ("C-c C-c k" . livedown-kill)))
```
