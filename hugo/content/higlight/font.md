+++
title = "4.1. font setting"
draft = false
+++
### フォントの設定
メイン機: Thinkpad E590 とサブ機: X250 とでそれぞれに適した値を設定することで設定ファイルを共有しています。

```elisp
(add-to-list 'default-frame-alist '(font . "Cica-18"))
;; for sub-machine
(when (string-match "x250" (code-command-to-string "uname -n"))
  (add-to-list 'default-frame-alist '(font . "Cica-15")))
```

### Cicaフォントとは
Cicaフォントは、Hack、DejaVu Sans Mono、Rounded Mgen+、Noto Emoji等のフォントを組み合わせて調整をした、プログラミング用日本語等幅フォントです。

* [日本語等幅フォント Cica](https://github.com/miiton/Cica)

[オフィシャルページ](https://github.com/miiton/Cica/releases/tag/v5.0.3)にある最新の `Cica v5.03` は、
`page-break-lines` で表示が乱れるようです。


### フォントのインストール
Linux 環境でのインストールの方法です。

1. [ダウンロードページ](https://github.com/SSW-SCIENTIFIC/Cica/releases)から、
[Cica-v5.0.1.zip](https://github.com/SSW-SCIENTIFIC/Cica/releases/download/v5.0.1-no-glyph-mod/Cica-v5.0.1.zip) をダウンロードします。
2. zipファイルを展開します。
3. 解凍したファイルを `~/.fonts/` にコピーします。

```codesession
$ sudo cp Cica-{Bold,BoldItalic,Regular,RegularItalic}.ttf ~/.fonts/
$ sudo fc-cache -vf
```
