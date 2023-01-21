+++
date = "2022-08-29T05:53:26+09:00"
title = "6.1. markdown-mode"
draft = false
weight = 1
+++
## [markdown-mode.el] markdownモード編集、入力支援
🔗 [jrblevin/markdown-mode: Emacs Markdown Mode.](https://github.com/jrblevin/markdown-mode) 

Markdown形式のテキストを編集するための主要なモードです。

```elisp
(leaf markdown-mode
  :ensure t
  :mode ("\\.md\\'")
  :chord (:markdown-mode-map
		  (".." . hydra-markdown/body))
  :custom
  `((markdown-command . "pandoc")
	(markdown-command-needs-filename . t)
	(markdown-fontify-code-blocks-natively . t)
	(markdown-content-type . "application/xhtml+xml")
	(markdown-css-paths . '("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"))
	(markdown-xhtml-header-content . "
  <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
  <style>
  body {
    box-sizing: border-box;
    max-width: 740px;
    width: 100%;
    margin: 40px auto;
    padding: 0 10px;
    font-size: large;
  }
  </style>
  <script src='https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/highlight.min.js'></script>
  <script>
  document.addEventListener('DOMContentLoaded', () => {
    document.body.classList.add('markdown-body');
    document.querySelectorAll('pre code').forEach((code) => {
      if (code.className != 'mermaid') {
        hljs.highlightBlock(code);
      }
    });
  });
  </script>
  ")))
```

markdownファイルのプレビューには、`pandoc`を使っています。

CSSフレームワークとしては、`github.min.css` が多く使われていますが、私は好みで `bootstrap.min.css` を使っています。
