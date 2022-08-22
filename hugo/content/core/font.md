+++
title = "2.2. font 設定"
draft = false
+++
* GUI / CUI 共通で `Cica` を使っています。

Cicaフォントは、Hack、DejaVu Sans Mono、Rounded Mgen+、Noto Emoji等のフォントを組み合わせて調整をした、日本語の等幅フォントです。

* [プログラミング用日本語等幅フォント Cica](https://github.com/miiton/Cica)
* Think Pad を2台使っていますので、環境を取得して設定を変えています。

## フォントの設定
* メイン機（Thinkpad E590）とサブ機（Thinkpad X250）とでそれぞれに適した値を決めています。

```elisp
(add-to-list 'default-frame-alist '(font . "Cica-18"))
;; for sub-machine
(when (string-match "x250" (code-command-to-string "uname -n"))
  (add-to-list 'default-frame-alist '(font . "Cica-15")))
```

## Cicaフォントのインストール
* Linux 環境でのインストールの方法です。

* [オフィシャルページ](https://github.com/miiton/Cica/releases/tag/v5.0.3)にある最新の `Cica v5.03` は、
`page-break-lines` で表示が乱れます。

1. [Cica-v5.0.1のダウンロードページ](https://github.com/SSW-SCIENTIFIC/Cica/releases)から、
([Cica-v5.0.1.zip](https://github.com/SSW-SCIENTIFIC/Cica/releases/download/v5.0.1-no-glyph-mod/Cica-v5.0.1.zip)) をダウンロードします。
2. 上記サイトの存続は怪しいので自分のサイトにも置いておきます。 [`Cica-v5.0.1.zip` ](https://minorugh.xsrv.jp/Cica/Cica-v5.0.1.zip)
3. zipファイルを展開します。

```codesesion
$ unzip Cica-v5.0.1.zip
```
4. LICENSE.txtを確認し、ファイルを `/usr/local/share/fonts/` または `~/.fonts/` にコピーします。

```codesession
$ sudo cp Cica-{Bold,BoldItalic,Regular,RegularItalic}.ttf ~/.fonts/
$ sudo fc-cache -vf
$ fc-list | grep Cica
/home/minoru/.fonts/Cica-v5.0.1/Cica-Regular.ttf: Cica:style=Regular
/home/minoru/.fonts/Cica-v5.0.1/noemoji/Cica-Regular.ttf: Cica:style=Regular
/home/minoru/.fonts/Cica-v5.0.1/noemoji/Cica-RegularItalic.ttf: Cica:style=Italic
/home/minoru/.fonts/Cica-v5.0.1/noemoji/Cica-Bold.ttf: Cica:style=Bold
/home/minoru/.fonts/Cica-v5.0.1/Cica-BoldItalic.ttf: Cica:style=Bold Italic
/home/minoru/.fonts/Cica-v5.0.1/Cica-Bold.ttf: Cica:style=Bold
/home/minoru/.fonts/Cica-v5.0.1/noemoji/Cica-BoldItalic.ttf: Cica:style=Bold Italic
/home/minoru/.fonts/Cica-v5.0.1/Cica-RegularItalic.ttf: Cica:style=Italic
```

