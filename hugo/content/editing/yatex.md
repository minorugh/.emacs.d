+++
title = "7.4. yatex"
draft = false
weight = 4
+++

### 5.6. [yatex] YaTexで LaTex編集
[`yatex.el`](https://github.com/emacsmirror/yatex) は、Emacsの上で動作する LaTeX の入力支援環境です。

ごく一般的な設定例ですが、参考になるとしたら `dviprint-command-format` に `dvpd.sh` というスクリプトを設定して、`YateX.lpr`
コマンドでPDF作成 → プレビューまでの手順を一気に出来るように自動化している点でしょうか。

```elisp
(leaf yatex
  :ensure t
  :mode ("\\.tex\\'" "\\.sty\\'" "\\.cls\\'")
  :custom `((tex-command . "platex")
			(dviprint-command-format . "dvpd.sh %s")
			(YaTeX-kanji-code . nil)
			(YaTeX-latex-message-code . 'utf-8)
			(YaTeX-default-pop-window-height . 15))
  :config
  (leaf yatexprc
	:bind (("M-c" . YaTeX-typeset-buffer)
		   ("M-v" . YaTeX-lpr))))
```
`YaTeX-lpr` は、`dviprint-command-format` を呼び出すコマンドです。

dviファイルから dvipdfmx で PDF作成したあと、ビューアーを起動させて表示させるところまでをバッチファイルに書き、`chmod +x dvpd.sh ` として実行権限を付与してからPATHの通ったところに置きます。私は、`/usr/loca/bin` に置きました。

[dvpd.sh]
```shellsession
#!/bin/sh
name=$1
dvipdfmx $1 && evince ${name%.*}.pdf
# Delete unnecessary files
rm *.au* *.dv* *.lo*
```
上記の例では、ビューアーに Linux の evince を設定していますが、Mac の場合は、下記のようになるかと思います。

```shellsession
dvipdfmx $1 && open -a Preview.app ${name%.*}.pdf
```
