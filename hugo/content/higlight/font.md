+++
title = "4.1. font setting"
draft = false
+++
### フォントの設定
メイン機（Thinkpad E590）とサブ機（Thinkpad X250）とでそれぞれに適した値を決めています。

```elisp
(add-to-list 'default-frame-alist '(font . "Cica-18"))
;; for sub-machine
(when (string-match "x250" (code-command-to-string "uname -n"))
  (add-to-list 'default-frame-alist '(font . "Cica-15")))
```

### Cicaフォントを使っています。
Cicaフォントは、Hack、DejaVu Sans Mono、Rounded Mgen+、Noto Emoji等のフォントを組み合わせて調整をした、日本語の等幅フォントです。

* [プログラミング用日本語等幅フォント Cica](https://github.com/miiton/Cica)

### フォントのインストール
Linux 環境でのインストールの方法です。

[オフィシャルページ](https://github.com/miiton/Cica/releases/tag/v5.0.3)にある最新の `Cica v5.03` は、
`page-break-lines` で表示が乱れます。

1. [ダウンロードページ](https://github.com/SSW-SCIENTIFIC/Cica/releases)から、
[Cica-v5.0.1.zip](https://github.com/SSW-SCIENTIFIC/Cica/releases/download/v5.0.1-no-glyph-mod/Cica-v5.0.1.zip) をダウンロードします。
2. zipファイルを展開します。

```codesesion
$ unzip Cica-v5.0.1.zip
```
3. 解凍したファイルを `~/.fonts/` にコピーします。

```codesession
$ sudo cp Cica-{Bold,BoldItalic,Regular,RegularItalic}.ttf ~/.fonts/
$ sudo fc-cache -vf
```
