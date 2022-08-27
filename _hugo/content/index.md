+++
title = "四時随順"
author = ["minorugh"]
draft = false
+++

<div class="ox-hugo-toc toc">

<div class="heading">Table of Contents</div>

- [Top](#top)
    - [minoru's Emacs Configuration](#_index)
- [起動設定](#起動設定)
    - [起動設定](#_index)
    - [auto-format](#auto-format)
    - [auto-save](#auto-save):replacement:
    - [custom-file](#custom-file)
    - [ddskk](#ddskk)
    - [exec-path](#exec-path)
    - [font-config](#font-config)
    - [load-path](#load-path)
    - [migemo](#migemo)
    - [savehist](#savehist)
    - [server](#server)
    - [ガベージコレクション](#gcmh)
    - [ライブラリの読み込み](#load-libraries)
- [バッファ管理](#バッファ管理)
    - [バッファ管理](#_index)
    - [scratch-log](#scratch-log)
    - [tempbuf](#tempbuf)
- [キーバインド](#キーバインド)
    - [キーバインド](#_index)
    - [key-chord](#key-chord)
    - [sticky-control](#sticky-control)
    - [Google 連携](#google-integration)
    - [グローバルキーバインド](#global-keybinds)
- [ファイル編集/入力補助](#ファイル編集-入力補助)
    - [ファイル編集/入力補助](#_index)
    - [基本設定](#editing-base)
    - [auto-insert](#auto-insert)
    - [company-mode](#company-mode)
    - [emojify](#emojify)
    - [multiple-cursors](#multiple-cursors)
    - [smartparens](#smartparens)
    - [undo-fu](#undo-fu)
    - [view-mode](#view-mode)
    - [whitespace](#whitespace)
    - [yasnippet](#yasnippet)
- [UI](#ui)
    - [UI](#_index)
    - [alert](#alert)
    - [all-the-icons](#all-the-icons)
    - [color-theme-molokai](#color-theme-molokai)
    - [dashboard](#dashboard)
    - [frame-cmds](#frame-cmds)
    - [fullscreen](#fullscreen)
    - [git-gutter-fringe](#git-gutter-fringe):improvement:
    - [highlight-indent-guides](#highlight-indent-guides)
    - [hydra](#hydra)
    - [ido-mode](#ido-mode)
    - [ivy](#ivy)
    - [mode-line](#mode-line)
    - [Neotree](#neotree):replacement:
    - [posframe](#posframe)
    - [show-paren-mode](#show-paren-mode)
    - [toolbar](#toolbar)
    - [uniquify](#uniquify)
    - [yascroll](#yascroll)
    - [zoom](#zoom)
    - [zoom-window](#zoom-window)
- [ナビゲーション](#ナビゲーション)
    - [ナビゲーション](#_index)
    - [ace-window](#ace-window)
    - [avy](#avy)
    - [browse-at-remote](#browse-at-remote)
    - [dumb-jump](#dumb-jump)
    - [projectile](#projectile)
- [プログラミング関係の設定](#プログラミング関係の設定)
    - [プログラミング関係の設定](#_index)
    - [emacs-lisp](#emacs-lisp)
    - [Ember.js](#ember-js)
    - [es6](#es6)
    - [flycheck](#flycheck)
    - [gnuplot-mode](#gnuplot-mode)
    - [lsp-mode](#lsp-mode)
    - [markdown](#markdown)
    - [plantuml-mode](#plantuml-mode)
    - [rails](#rails)
    - [React.js](#react-js)
    - [rspec-mode](#rspec-mode)
    - [ruby](#ruby)
    - [scss](#scss)
    - [TypeScript](#typescript)
    - [Vue.js](#vue-js)
    - [yaml-mode](#yaml-mode)
- [外部連携ツール設定](#外部連携ツール設定)
    - [外部連携ツール設定](#_index)
    - [emacs-w3m](#emacs-w3m)
    - [esa.el](#esa)
    - [forge](#forge)
    - [google-this](#google-this)
    - [google-translate](#google-translate)
    - [magit](#magit)
    - [notify-slack](#notify-slack)
    - [todoist](#todoist)
    - [twmode](#twmode)
    - [wakatime-mode](#wakatime-mode)
    - [ブラウザ設定](#browse-url):unused:
- [org-mode](#org-mode)
    - [org-mode](#_index)
    - [基本設定](#base)
    - [org-babel](#org-babel)
    - [予定のカレンダー表示](#calendar)
    - [Agenda 関係の設定](#agenda)
    - [org-capture](#org-capture)
    - [org-clock](#org-clock)
    - [org-export](#org-export)
    - [org-gcal](#org-gcal):replacement:
    - [org-ql](#org-ql):unused:
    - [org-refile](#org-refile)
    - [org-trello](#org-trello)
    - [ox-hugo](#ox-hugo)
    - [org-mode 用の独自コマンド](#org-commands)
    - [org-mode 関係の keybinds](#org-mode-keybinds)
    - [日報用の設定(旧)](#nippou):unused:
- [テスト用ツール](#テスト用ツール)
    - [テスト用ツール](#_index)
    - [with-simulated-input](#with-simulated-input)
    - [mocker.el](#mocker-el):unused:
- [テストコード](#テストコード)
    - [テストコード](#_index)
    - [実行方法](#execution)
    - [run-tests](#run-tests)
    - [my-org-commands-test](#my-org-commands-test)

</div>
<!--endtoc-->


## Top {#top}


### minoru's Emacs Configuration {#_index}


#### はじめに {#はじめに}

ここは @minorugh のEmacs の設定ファイルの一部を解説しているページです。

<https://github.com/minorugh/.emacs.d/blob/main/init.org> から
ox-hugo を使ってWebサイトに仕立て上げています。


#### 動作確認環境 {#動作確認環境}

以下の環境で使用しています。が、動作を保証するものではありません。

-   Debian 11.4 86_64 GNU/Linux
-   自分でビルドした Emacs 27.2.50


#### デレクトリ構成 {#デレクトリ構成}

設定ファイルの構成は下記のとおりです。

```text
~/.emacs.d
│
├── el-get/
├── elpa/
├── inits/
│   ├── 00_base.el
│   ├── 01_dashboard.el
│   ├── ...
│   ├── 90_eshell.el
│   └── 99_chromium.el
├── snippets/
├── tmp/
├── early-init.el
├── init.el
└── mini-init.el
```


## 起動設定 {#起動設定}


### 起動設定 {#_index}

Emacs の起動設定に関わる部分をまとめています。
Emacs-27導入にあわせて \`early-init.el\` を設定しました。

起動するまでの流れは以下のとおり。

```text
1. early-init.el の読み込み
2. init.el の読み込み
3. inits/ の設定ファイル群の読み込み
```

[eary-init](#eary-init)
: 早期設定ファイルの設定

[auto-format](#auto-format)
: ファイル保存時に自動で整形してくれるやつ

[auto-save](#auto-save)
: 編集中状態の自動保存や編集前の状態のバックアップに関する設定

[custom-file](#custom-file)
: カスタマイズ変数などの保存先を変更している

[ddskk](#ddskk)
: ちょっと変わった日本語入力 SKK の Emacs Lisp 版

[exec-path](#exec-path)
: PATH などの環境変数を shell と合わせる設定

[font-config](#font-config)
: フォントの設定

[load-path](#load-path)
: Emacs Lisp が読み込める path の設定

[migemo](#migemo)
: 日本語入力オフのままローマ字で検索できるようにするやつ

[savehist](#savehist)
: ミニバッファの履歴などを保存してくれる機能

[server](#server)
: 起動した Emacs がサーバとしても動くように設定している

[ガベージコレクション](#gcmh)
: メモリの開放関係の設定

[ライブラリの読み込み](#load-libraries)
: Emacs Lisp を書く上で便利なライブラリの読み込み


#### eary-init {#eary-init}


#### 早期初期化ファイル {#早期初期化ファイル}

🔗 [minorugh/.emacs.d/early-init.el](https://github.com/minorugh/.emacs.d/blob/main/early-init.el)

Emacs27から導入された eary-init.el は、init.el でGUIやパッケージシステムの初期化が実行される前にロードされるので、UI関係や package-enable-at-startup のようなパッケージ初期化プロセスに影響を与える変数を先に書くことで起動を早くすることが出来るようです。


#### GCを減らす {#gcを減らす}

GC の閾値を最大にしておくことで GC を実質止めることができます。とりあえず書いておけば速くなる系なのでおすすめです。

<div class="emacs-lisp">

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

</div>

eary-init.el の先頭に書きます。


### auto-format {#auto-format}


#### 概要 {#概要}

保存時に自動で整形してくれるように
[fork した auto-fix.el](https://github.com/mugijiru/auto-fix.el) を使っている。

これを入れて各 major-mode で設定をするとファイル保存時に自動で整形してくれて便利だったりする


#### インストール {#インストール}

fork しているので自前で recipe も用意している

```emacs-lisp
(:name auto-fix
	   :website "https://github.com/mugijiru/auto-fix.el"
	   :description "Fix current buffer automatically"
	   :type github
	   :branch "accept-multiple-args"
	   :pkgname "mugijiru/auto-fix.el")
```

これを以下のようにして el-get でインスコしている

```emacs-lisp
(el-get-bundle auto-fix)
```


### auto-save <span class="tag"><span class="replacement">replacement</span></span> {#auto-save}


#### 概要 {#概要}

編集中状態の自動保存や、編集前や保存直後の状態のバックアップに関する設定をここでは書いている。

Emacs ではデフォルトでも編集中ファイルの自動保存や、編集前の状態の自動バックアップもしてくれるが開いているファイルとは違う場所に保存したりすることで、より便利になるのでいくつかの設定を入れている。


#### 設定 {#設定}

<!--list-separator-->

-  自動保存設定

    デフォルトだと `#hoge.txt#` みたいなファイル名で作られる、自動保存に関する設定。

    まあこの自動保存されてやつを活用できてる気がしないのでこの自動保存自体不要な気はしているが、とりあえず場所を移動して邪魔にはならないようにはしている。

    <!--list-separator-->

    -  自動保存のタイミング

        自動保存のタイミングは

        -   auto-save-timeout
        -   auto-save-interval

        で制御されている。

        まず auto-save-timeout で設定した秒数が経過すると再度自動保存が実行される。

        これがデフォルトだと 30 秒なのだが、ちょっと長いのでその半分の 15 秒で保存されるように設定を変更している。

        ```emacs-lisp
        (setq auto-save-timeout 15)
        ```

        また auto-save-interval で設定した回数のキーイベントが発生すると再度自動保存を実行する。

        これもデフォルトだと 300 と結構なキーを叩く必要があるので 60 回としている。

        ```emacs-lisp
        (setq auto-save-interval 60)
        ```

    <!--list-separator-->

    -  自動保存先を変更する

        自動保存はそのままだと弄ってるファイルの場所に作られる。が、これは以下のようにすると `~/.emacs.d/backup/` 一応変更可能。

        ```emacs-lisp
        (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
        ```

        ただ、デフォルト値が

        ```emacs-lisp
        (("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/tmp/\\2" t))
        ```

        なので `.*` にしているのは乱暴そうな気がしている。

        というわけで
        <https://masutaka.net/chalow/2014-05-11-1.html>
        に書かれているのを真似して

        ```emacs-lisp
        (("~/\\([^/]*/\\)*\\([^/]*\\)$" "~/.emacs.d/backup/\\2" t))
        ```

        とでもした方が良いかもしれない。

<!--list-separator-->

-  バックアップファイル

    自動保存とは別に、ファイルを開いた時点のバージョンや保存した時点のバージョンを取っておいてくれる自動バックアップ機能もあるのでその設定も弄っている。

    <!--list-separator-->

    -  バックアップ先のフォルダ指定

        デフォルトでは編集しているファイルと同じフォルダにバックアップファイルを作成するようになっている。

        だけど、こいつが結構邪魔なのでバックアップファイルは `~/.emacs.d/backup/` に全部保存するようにしている。

        また、普段 tramp は使っていないが何かの拍子で使った時にバックアップが取られると邪魔そうなのでそれは保存しないようにしている。

        ```emacs-lisp
        (setq backup-directory-alist '((".*" . "~/.emacs.d/backup")
        							   (,tramp-file-name-regexp . nil)))
        ```

    <!--list-separator-->

    -  バージョン管理

        バックアップにはバージョン管理機能もある。が、標準では無効化されている。

        とりあえず古いバージョンを引っ張り出せると便利かもと思って有効化している。

        ```emacs-lisp
        (setq version-control t)
        ```

        が、実際それを使ったことはない。。。

        また、古過ぎるバックアップファイルは要らないので、自動的に消されるように設定している。

        ```emacs-lisp
        (setq delete-old-versions t)
        ```

<!--list-separator-->

-  その他

    Emacs の自動保存などについては
    <http://yohshiy.blog.fc2.com/blog-entry-319.html>
    によくまとめられているので、いずれその内容を設定に反映させたい。

    また [super-save](https://github.com/bbatsov/super-save) というやつを使って実ファイルに自動保存したりしたらこれも不要になると思われる。


### custom-file {#custom-file}


#### 概要 {#概要}

Emacs では customize 機能などで設定したファイルを標準だと init.el の末尾に追記したりするが自動吐き出しされるものがあるとバージョン管理が難しくなるので別ファイルに出力するようにするなどの調整をしている。


#### 出力先の設定 {#出力先の設定}

.emacs.d の中に閉じ込めておく方が管理が楽なので出力先として `~/.emacs.d/custom.el` を指定している。

```emacs-lisp
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
```


#### カスタム設定の読み込み {#カスタム設定の読み込み}

起動時に、設定が入っているファイルが読み込まれないと保存した設定が有効にならないので load を使って読んでいる。

```emacs-lisp
(load custom-file)
```


#### その他 {#その他}

カスタムファイルは終盤で読み込む方がいいかと思って
init-loader では 99 という最後の方で読まれる番号を振っている。

このあたりの設定を個別のパッケージの設定の方に移動したらこのファイルは空にできるんじゃないかなとも思っているが、それはゆっくり対応していくつもり


### ddskk {#ddskk}


#### 概要 {#概要}

[ddskk](http://openlab.ring.gr.jp/skk/ddskk-ja.html) は Emacs Lisp 版の SKK 実装。

一般的な日本語変換ソフトだと文法を自動で認識して変換をしてくれるけど
SKK ではその自動認識がおかしくておかしな変換になるところを、単語の区切りなんかを一切判定せずに人間がそれを教えてあげることで、そういう自動的に変な挙動をしてしまう煩わしさから開放されるようになっている。


#### インストール {#インストール}

いつも通り el-get で入れている。最近は最新版が GitHub で更新されているのでそちらから引っ張られてくる。

```emacs-lisp
(el-get-bundle ddskk)
```


#### 常時有効化 {#常時有効化}

find-file-hooks で有効化することでファイルを開いた時には常に skk が使える状態にしている。また skk-latin-mode にしておくことで、基本は英語入力ですぐに日本語入力に切り替えられる状態にしている。

```emacs-lisp
(defun my/always-enable-skk-latin-mode-hook ()
  (skk-latin-mode 1))

(add-hook 'find-file-hooks 'my/always-enable-skk-latin-mode-hook)
```


#### hook の設定 {#hook-の設定}

ddskk が呼び出された時に色々設定されるようにしている。

もしかしたら customize-variable とかあるかもしれないので今度見直した方が良さそう。

```emacs-lisp
(add-hook 'skk-load-hook
		  (lambda ()
			;; コード中では自動的に英字にする。
			(require 'context-skk)

			(setq skk-comp-mode t) ;; 動的自動補完
			(setq skk-auto-insert-paren t)
			(setq skk-delete-implies-kakutei nil)
			(setq skk-sticky-key ";")
			(setq skk-henkan-strict-okuri-precedence t)
			(setq skk-show-annotation t) ;; 単語の意味をアノテーションとして表示。例) いぜん /以前;previous/依然;still/

			;; ;; 半角で入力したい文字
			;; (setq skk-rom-kana-rule-list
			;;       (nconc skk-rom-kana-rule-list
			;;              '((";" nil nil)
			;;                (":" nil nil)
			;;                ("?" nil nil)
			;;                ("!" nil nil))))
			))
```

skk-comp-mode
: 自動補完関係らしいが、ググっても出て来ないし死んだ設定かもしれない

skk-auto-insert-paren
: カッコを入力するとコッカも入れてくれる便利機能の切替

skk-delete-implies-kakutei
: nil にすると▼モードで &lt;BS&gt; を押した時 に一つ前の候補を表示するようになる

skk-sticky-key
: 設定すると、その指定したキーを押した時に変換開始状態などにする Sticky Shift を提供する

skk-henkan-strict-okuri-precedence
: 正しい送り仮名の変換が優先的に表示されるようにする設定

skk-show-annotation
: 単語の意味をアノテーションとして表示する設定

skk-rom-kana-rules-list
: キー入力時の挙動を指定する。とりあえず自分は : とかが全角になるのが嫌なので半角になるようにしている


#### L 辞書を使うようにする <span class="tag"><span class="improvement">improvement</span></span> {#l-辞書を使うようにする}

Mac では AquaSKK の L 辞書を、
Linux では `/usr/share/skk/SKK-JISYO.L` を読むようにしている。

```emacs-lisp
(let ((l-dict
	   (if (eq window-system 'ns)
		   (expand-file-name "~/Library/Application Support/AquaSKK/SKK-JISYO.L")
		 "/usr/share/skk/SKK-JISYO.L")))
  (if (file-exists-p l-dict)
	  (setq skk-large-jisyo l-dict)))
```

WSL で動かしている Emacs では
CurvusSKK の辞書を見るように設定した方が良さそうな気もするけど
`/usr/share/skk/SKK-JISYO.L` にもあるのでひとまずこれにしておけば良さそう


#### ddskk-posframe {#ddskk-posframe}

[ddskk-posframe](https://github.com/conao3/ddskk-posframe.el/) は ddskk ツールチップを posframe で表示してくれるやつ。便利。

<https://emacs-jp.github.io/packages/ddskk-posframe>
に作った本人が解説記事を日本語で載せてるので詳細はそっちを見てもらう方が早い。

とりあえず以下でインストール、有効化している。

```emacs-lisp
(el-get-bundle ddskk-posframe.el)
(ddskk-posframe-mode 1)
```

なお el-get.lock を使ったバージョン更新確認のためにレシピも必要だったので登録している

```emacs-lisp
(:name ddskk-posframe.el
	   :website "https://github.com/conao3/ddskk-posframe.el"
	   :description "ddskk-posframe.el provides Henkan tooltip for ddskk via posframe."
	   :type github
	   :pkgname "conao3/ddskk-posframe.el")
```


#### その他 {#その他}

漢字の変換すらも機械任せではなく自分で決めるみたいな漢字直接入力という方式もあり、
SKK とそれを組み合わせると入力キーを覚えている漢字は漢直で入力しそうでない漢字は SKK で入力する、といった使い分けができるらしい。

特に同音意義語が多い場合に便利そう。


### exec-path {#exec-path}


#### 概要 {#概要}

Emacs は通常最小限の環境変数しか利用しないようになっている。

が、それだと普段使う上で「ああ、このコマンドが使えなくてもどかしい……!」と感じてしまう。

そこで [exec-path-from-shell](https://github.com/purcell/exec-path-from-shell) というのを使って
Emacs が見える PATH 環境変数をシェルが見てる PATH 環境変数と揃うようにしている。


#### インストール {#インストール}

いつも通り el-get からインストールしている

```emacs-lisp
(el-get-bundle exec-path-from-shell)
```


#### 有効化 <span class="tag"><span class="improvement">improvement</span></span> {#有効化}

理由は忘れたが Mac の環境でのみ有効化している。その内 Linux 環境でも有効化を試みた方が良さそう

```emacs-lisp
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
```

なお、これでシェルと共通の環境変数が使われるようになるのは
[デフォルトでは `PATH` と `MANPATH` のみである](https://github.com/purcell/exec-path-from-shell/blob/bf4bdc8b8911e7a2c04e624b9a343164c3878282/exec-path-from-shell.el#L85-L89)


#### その他 {#その他}

なぜか以下のようなコメントを書いていた。普段使っている zsh で持ってる PATH は使わないのだろうか? :thinking_face:

```emacs-lisp
;; for exec path
;; use .bashrc setted path
```


### font-config {#font-config}


#### 概要 {#概要}

Emacs で利用するフォントの設定。それなりの設定をしないとガタついたりするので通常あまり手を入れないで済ませている。


#### 設定 {#設定}

Mac では 14, それ以外(Linux) では 18 を基準としている。

Mac と Linux で基準のサイズを変えているがなぜかこの方がガタガタもしないし大き過ぎもしないしでいい感じになる。

といいつつ元々 Linux の方は WSL2 環境に合わせて 12 にしていたが
Manjaro 環境に合わせて 18 に変更しているのでまたその内 WSL2 でも Manjaro でもどっちいい感じに使えるように調整するかもしれない

```emacs-lisp
(let* ((size (if (or (eq window-system 'ns) (eq window-system 'mac)) 14 18))
	   (asciifont "Ricty Diminished")      ; ASCII fonts
	   (jpfont "Ricty Diminished")         ; Japanese fonts
	   (h (* size 10))
	   (fontspec (font-spec :family asciifont))
	   (jp-fontspec (font-spec :family jpfont)))
  (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
  (set-fontset-font nil '(#x0080 . #x024F) fontspec)
  (set-fontset-font nil '(#x0370 . #x03FF) fontspec))
```


### load-path {#load-path}


#### 概要 {#概要}

`load-path` は Emacs の設定でも重要な項目でこのリストに追加されている path は `load` または `require` する際に走査される path となっている。

即ち load-path を通しておけば、そこに置いている emacs lisp のファイルは簡単に読み出せるようになる。

なお package-install や el-get を使っておけば基本的に自分で load-path を通す必要はない。


#### 秘匿情報を入れてるフォルダを読み込み可能にする {#秘匿情報を入れてるフォルダを読み込み可能にする}

パスワードなどの秘匿情報を持っている部分は `~/.emacs.d/secret` というフォルダで管理している。そのためここに入ってる emacs lisp のファイルも読み込めるように load-path に追加している。

```emacs-lisp
(add-to-list 'load-path (expand-file-name "~/.emacs.d/secret"))
```


#### my/load-config <span class="tag"><span class="replacement">replacement</span></span> {#my-load-config}

`~/.emacs.d/secret` は個人マシンか会社マシンかによって置いてるデータが異なったりするためもしもファイルがなくてもエラーにならないような方法で load する方法が必要だった。

というわけでファイルがなかったら読み込まずにメッセージを出力して終了するような関数を用意している。

```emacs-lisp
(defun my/load-config (file)
  (condition-case nil
	  (load file)
	(file-missing (message "Load error: %s" file))))
```

ただ、これって結局

```emacs-lisp
(load file nil t)
```

で十分な気もするので、置き換えを検討した方が良さそう。


### migemo {#migemo}


#### 概要 {#概要}

[migemo.el](https://github.com/emacs-jp/migemo) は [cmigemo](https://github.com/koron/cmigemo) などと通信して、日本語入力オフのままローマ字入力をして日本語検索ができるようにするパッケージ。

これとても便利で抜け出せない。


#### インストール {#インストール}

いつも通り el-get でインストール。

```emacs-lisp
(el-get-bundle migemo)
(load "migemo")
```

load はする必要あるのかわからんけど、そういう設定が既に入ってるのでそのままにしている。


#### Mac での辞書の位置の指定 {#mac-での辞書の位置の指定}

Homebrew で cmigemo を入れているのでそれに合わせて辞書の位置を指定している。

```emacs-lisp
;; Mac
(let ((path "/usr/local/share/migemo/utf-8/migemo-dict"))
  (if (file-exists-p path)
	  (setq migemo-dictionary path)))
```


#### Ubuntu での辞書の位置の指定 {#ubuntu-での辞書の位置の指定}

apt で cmigemo を入れているのでそれに合わせて辞書の位置を指定している。

```emacs-lisp
;; Ubuntu
(let ((path "/usr/share/cmigemo/utf-8/migemo-dict"))
  (if (file-exists-p path)
	  (setq migemo-dictionary path)))
```


#### Manjaro での辞書の位置の指定 {#manjaro-での辞書の位置の指定}

yay で cmigemo-git を入れているのでそれに合わせて辞書の位置を指定している。

```emacs-lisp
;; Manjaro
(let ((path "/usr/share/migemo/utf-8/migemo-dict"))
  (if (file-exists-p path)
	  (setq migemo-dictionary path)))
```


#### cmigemo コマンドの PATH 指定 {#cmigemo-コマンドの-path-指定}

環境で PATH が変わるので which コマンドの結果を migemo-command に設定している。

```emacs-lisp
(let ((path (s-chomp (shell-command-to-string "which cmigemo"))))
  (if (s-ends-with? "not found" path)
	  (message "cmigemo not found")
	(setq migemo-command path)))
```


#### オプション設定 {#オプション設定}

裏側で動くのでうるさくならないように `-q` を指定しているのと
Emacs から叩くから `--emacs` を指定しているだけ。

```emacs-lisp
(setq migemo-options '("-q" "--emacs"))
```


#### coding system の指定 {#coding-system-の指定}

Mac と Ubuntu でしか使わないしそれらの環境だと統一で utf-8-unix でいいよねってことでそれを指定している。

```emacs-lisp
(setq migemo-coding-system 'utf-8-unix)
```

今時なら euc とかにする必要もないだろうしね。


#### 初期化 {#初期化}

以上の設定を入れた上で初期化をしている。

```emacs-lisp
(migemo-init)
```


### savehist {#savehist}


#### 概要 {#概要}

Emacs 標準でついている、ミニバッファの履歴などを保存してくれる機能。


#### 有効化 {#有効化}

標準でついているので以下のようにするだけで有効化可能。

```emacs-lisp
(savehist-mode 1)
```


#### 設定 <span class="tag"><span class="improvement">improvement</span></span> {#設定}

標準で保存されるもの以外だと kill-ring だけを保存対象にしている。これで Emacs を終了させても kill-ring は残るようになるはず。だけど最近使えてない気がするな……。検証が必要そう。

```emacs-lisp
(setq savehist-additional-variables '(kill-ring))
```

他にも有効にしたら便利そうなのがあれば追加したい。が、ぱっとは思い付かない。


### server {#server}


#### 概要 {#概要}

Emacs の起動後にサーバとして動くようにしている。

これにより emacsclient コマンドで接続するとサーバとして動いている Emacs に別端末から繋げられたりする。

けど麦汁さんは Firefox から org-capture を動かすためにだけ利用している。


#### 設定 {#設定}

`server.el` を require しておいてサーバとして動いていなかったらサーバとして動くようにしている。多重起動の防止ですね。

```emacs-lisp
(require 'server)
(unless (server-running-p)
  (server-start))
```


#### 関連ツール {#関連ツール}

[org-capture-extension](https://github.com/sprig/org-capture-extension)
: org-capture 連携するための Chrome 及び Firefox の拡張。麦汁さんはこれを Firefox で使ってる。

[org-protocol-capture-html](https://github.com/alphapapa/org-protocol-capture-html)
: HTML コンテンツを org-mode の記述に変換して capture してくれるやつ。Pandoc 利用。


#### その他 {#その他}

起動処理の最後に動けばいいので
init-loader で 99 を割り振っている。

init-loader をやめるなら多分 after-init-hook を使うことになるのかな。


### ガベージコレクション {#gcmh}


#### 概要 {#概要}

ガベージコレクションには gcmh というのを利用してみている。

<https://github.com/emacsmirror/gcmh>

普段は GC を控えめにしながら操作してない間に GC が走るような作りになっている。便利そう。


#### インストール {#インストール}

```emacs-lisp
(el-get-bundle gcmh)
```

これだけで有効化もされる。


#### その他 {#その他}

以前の設定も折り畳んで残しておく

<details>
<summary>使わなくなったコード</summary>
<div class="details">

gcmh を入れる前に設定していたコード。
gcmh を入れたらこれよりもいい感じに対応してくれそうなので入れ替えた。

```emacs-lisp
;; https://gist.github.com/garaemon/8851900ef27d8cb28200ac8d92ebacdf
;; Increase threshold to fire garbage collection
(setq gc-cons-threshold 1073741824)
(setq garbage-collection-messages t)

;; Run GC every 60 seconds if emacs is idle.
(run-with-idle-timer 60.0 t #'garbage-collect)
```
</div>
</details>


### ライブラリの読み込み {#load-libraries}

設定ファイル内で文字列操作をするだろうということで
[s.el](https://github.com/magnars/s.el) を読み込んでいる。

```emacs-lisp
(el-get-bundle s)
(require 's)
```

けど、どういう関数があったか覚えてないぐらいには使ってない……。ま、あると便利なのでそのまま入れておくつもり。


## バッファ管理 {#バッファ管理}


### バッファ管理 {#_index}

ここではバッファ管理関係の設定を記載している

[scratch-log](#scratch-log)
: scratch バッファを自動的に永続化してくれるパッケージ

[tempbuf](#tempbuf)
: 不要になったと思われるバッファを自動的に kill してくれるパッケージ


### scratch-log {#scratch-log}


#### 概要 {#概要}

[scratch-log](https://github.com/mori-dev/scratch-log) は、Emacs でちょっとした Emacs Lisp なんかを試し書きする時に使う `*scratch*` バッファを永続化してくれるパッケージ。

自分なんかは Emacs Lisp だけでなくちょっとメモを置いといたりもするので勝手に永続化してくれるこいつにはとてもお世話になっている。

GitHub の README には作者のブログへのリンクしかないしそのブログは消えてるので一番まともに解説しているのは <http://emacs.rubikitch.com/scratch-log/> だと思う。


#### インストール {#インストール}

el-get から入れるだけ。

```emacs-lisp
(el-get-bundle mori-dev/scratch-log)
```


#### 有効化 {#有効化}

どうも明示的に require しないといけないっぽくて、そうしている。ちょっと本当にそうなのか検証したい気はする。

```emacs-lisp
(require 'scratch-log)
```


#### 類似品など {#類似品など}

[persistent-scratch](https://github.com/Fanael/persistent-scratch)
: これも scratch を永続化させるやつ。カスタマイズ性はこっちがありそう

[unkillable-scratch](https://github.com/EricCrosson/unkillable-scratch)
: scratch バッファを kill させないやつ。同じような機能が scratch-log にもある

[auto-save-buffers-enhanced](https://github.com/kentaro/auto-save-buffers-enhanced)
: 自動保存機能がメインだけど scratch を自動保存する機能もある


### tempbuf {#tempbuf}


#### 概要 {#概要}

[tempbuf-mode](https://www.emacswiki.org/emacs/TempbufMode) は不要になったと思われるバッファを自動的に kill してくれるパッケージ。使っていた時間が長い程、裏に回った時には長い時間保持してくれる。

つまり、一瞬開いただけのファイルは明示的に kill しなくても勝手にやってくれるのでファイルを開いてそのまま放置みたいなことをしがちなズボラな人間には便利なやつ。


#### インストール {#インストール}

いつも通り el-get で入れている。

```emacs-lisp
(el-get-bundle tempbuf-mode)
```


#### 勝手に kill させないファイルの指定 {#勝手に-kill-させないファイルの指定}

org-clock を使うようなファイルは
kill されると org-clock が狂って面倒なことになるのでそれらのファイルは勝手に kill されないように ignore リストに突っ込んでいる

```emacs-lisp
(setq my/tempbuf-ignore-files '("~/Documents/org/tasks/gtd.org"
								"~/Documents/org/tasks/interrupted.org"
								"~/Documents/org/tasks/next-actions.org"
								))
```


#### find-file への hook {#find-file-への-hook}

find-file した時に上でリストアップしたファイルだった場合は kill されないように
tempbuf-mode が自動的に無効になるような hook を用意している。

```emacs-lisp
(defun my/find-file-tempbuf-hook ()
  (let ((ignore-file-names (mapcar 'expand-file-name my/tempbuf-ignore-files)))
	(unless (member (buffer-file-name) ignore-file-names)
	  (turn-on-tempbuf-mode))))
```


#### hook の設定 {#hook-の設定}

find-file では上で作成した hook を使うことで
kill されたくないファイルは kill されないようにしている

```emacs-lisp
(add-hook 'find-file-hook 'my/find-file-tempbuf-hook)
```

また dired buffer も邪魔になりがちだけど、デフォルトだと対象にならないのでこいつらも tempbuf-mode の管理対象となるように tempbuf-mode を有効にしている。

```emacs-lisp
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
```


#### その他 {#その他}

[midnight-mode](https://www.emacswiki.org/emacs/MidnightMode) という、深夜に処理を実行させるようなやつで夜間にバッファをごっそり消すみたいなことをしている人も結構いるっぽい。


## キーバインド {#キーバインド}


### キーバインド {#_index}

ここでは全体に関わるキーバインド系の設定を記載している。

[Google 連携](#google-integration)
: Google 連携する機能のキーバインドをまとめている

[key-chord](#key-chord)
: 同時押しというキーバインドを提供してくれるやつ

[sticky-control](#sticky-control)
: Control の入力を sticky にしてくれるやつ

[グローバルキーバインド](#global-keybinds)
: いつでもどこでも使えるキーバインド周りの設定をここにまとめている


### key-chord {#key-chord}


#### 概要 {#概要}

[key-chord](https://github.com/emacsorphanage/key-chord) はキーを同時に押した時にコマンドを発動させるということができるようにしてくれるパッケージ。

なのですが[本家の方だと誤爆が多い](https://qiita.com/zk_phi/items/e70bc4c69b5a4755edd6)ということなのでそれを改善した [zk-phi/key-chord](https://github.com/zk-phi/key-chord/) の方を利用している。

まあほとんど使えてないので改良版の恩恵をまだ受けてないけど……。


#### インストール {#インストール}

いつも通り el-get でインストールしている。本家の方じゃないので GitHub のリポジトリから突っ込んでいる。

```emacs-lisp
(el-get-bundle zk-phi/key-chord)
```


#### 設定 {#設定}

同時押し時の許容時間、その前後で別のキーが押されていたら発動しない判断をする、みたいな設定を入れている。

```emacs-lisp
(setq key-chord-two-keys-delay           0.25
	  key-chord-safety-interval-backward 0.1
	  key-chord-safety-interval-forward  0.15)
```

キーの同時押し判定は 0.15 秒で、それらのキーが押される直前の 0.1 秒以内、または直後の 0.15 秒に押されていたら発動しない、という設定にしている。

改良版の作者の記事だと、直後判定は 0.25 秒で設定されていたが自分は Hydra の起動に使っている上に Hydra で叩けるやつでよく使うやつは覚えているので表示を待たずに次のキーを押すので 0.25 秒も待っていられないという事情があった。


#### 有効化 {#有効化}

設定を入れた後は有効にするだけである。

```emacs-lisp
(key-chord-mode 1)
```

実際のキーバインド設定は各モードだったりグローバルキーバインドを設定しているファイルだったりで書く感じ。

といいつつ現状では Hydra 起動のやつしか使ってないので、グローバルキーバインド設定でしか書いてない。


#### sticky-shift {#sticky-shift}

<!--list-separator-->

-  セミコロン2つでシフトを押した状態にする

    セミコロンを2回叩くことで shift が押されてるという状態を実現する。

    これにより magit で P などを入力したい時にも `;;p` で入力できるし通常の英字入力時にも大文字にできるので左手小指が痛い時には Shift を使わずに操作ができるようになる。

    ```emacs-lisp
    (key-chord-define-global ";;"
    						 'event-apply-shift-modifier)

    (key-chord-define key-translation-map
    				  ";;"
    				  'event-apply-shift-modifier)
    ```

    `global-key-map` と `key-translation-map` の両方に定義しないと動かないがその原因はよく分かってない。一旦動くから良しとしている。

    ここで使っている `event-apply-shift-modifier` はデフォルトでは `C-x @ S` にバインドされているやつ。お仲間に `event-apply-control-modifier` などの各 modifier キーがいるので
    sticky 的なことをやる上で便利な子達。
    [sticky-control](#sticky-control) の中でも `event-apply-control-modifier` が使われているぞい。

<!--list-separator-->

-  やりたかったけど実現できてないこと

    <!--list-separator-->

    -  セミコロン\*2+数字キー、セミコロン\*2+記号キーの対応

        [sticky.el](https://www.emacswiki.org/emacs/sticky.el) では実現されてそうなことなので、同じことをできるようにしたい


#### その他 {#その他}

[sticky-control](#sticky-control) も control 限定で似たようなことをしているので
key-chord に全部置き換えできるかもしれない。


### sticky-control {#sticky-control}


#### 概要 {#概要}

指定したキーを2回叩いたら
Control が押されてるような状態にしてくれるプラグイン。

その2回の間隔はデフォルトだと 0.5 秒以内となっている。そのため、そのキーを押して 0.5 秒が経過したら、普通にそのキーが押されたことになる

さらに `sticky-control-shortcuts` に指定されてる一部のキーについては
sticky 用のキーを押した直後に shortcuts のキーを押すと
Control を押している状態でそのキーを押したことになる。

例えば私は `,` を sticky 用のキーにしていて
shortcuts に `c` を入れているので
`,c` と素早くタイプをすればそれだけで `C-c` が押された状態になる。


#### インストール {#インストール}

まずは el-get-bundle でインストール。

```emacs-lisp
(el-get-bundle sticky-control)
```

ちなみにレシピは公式ではなかったのでとりあえず自分の環境で使えるように自作レシピを置いている。

```emacs-lisp
(:name sticky-control
	   :description "save your left little finger"
	   :type http
	   :url "https://raw.githubusercontent.com/martialboniou/emacs-revival/master/sticky-control.el"
	   :features "sticky-control")
```

元々は <http://www.cs.toronto.edu/~ryanjohn/sticky-control.el> にあったのだけど最近そこからは取得できなくなったので
<https://github.com/martialboniou/emacs-revival/blob/master/sticky-control.el>
から取得して利用している


#### 設定 {#設定}

まずは「2回叩いたら Control を押している状態になる」キーを指定する。

```emacs-lisp
(sticky-control-set-key 'sticky-control-key ?,)
```

私は `,` を sticky-control のキーにしているのでこの指定。

そして次に `sticky-control-shortuts` の指定。ここに指定しておくと、例えば `,c` と素早くタイプすることで `C-c` が入力された状態とすることができる。

```emacs-lisp
(setq sticky-control-shortcuts
	  '((?c . "\C-c")
		(?g . "\C-g")
		(?k . "\C-k")
		(?a . "\C-a")
		(?e . "\C-e")
		(?n . "\C-n")
		(?o . "\C-o")
		(?p . "\C-p")
		(?j . "\C-j")
		(?f . "\C-f")
		(?b . "\C-b")
		(?x . "\C-x")
		(?r . "\C-r")
		(?s . "\C-s")))
```

結構な数を指定しているけど、普段そんなに使えているわけでもない。まあ、大体 Control を押しながら使いそうなところは押さえてあるので何も考えずとも使えるようにしてある。


#### 有効化 {#有効化}

最後に有効化

```emacs-lisp
(sticky-control-mode)
```


### Google 連携 {#google-integration}


#### 概要 {#概要}

Google と連携するパッケージとして
[google-this](#google-this) と [google-translate](#google-translate) を入れているが、どっちも Google を使うので1つの Hydra にまとめていた方が扱いやすいと思って統合している


#### キーバインド {#キーバインド}

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define google-pretty-hydra
	(:foreign-keys warn :title "Google" :quit-key "q" :color blue :separator "-")
	("Current"
	 (("SPC" google-this-noconfirm "No Confirm")
	  ("RET" google-this           "Auto")
	  ("w"   google-this-word      "Word")
	  ("l"   google-this-line      "Line")
	  ("s"   google-this-symbol    "Symbol")
	  ("r"   google-this-region    "Region")
	  ("e"   google-this-error     "Error"))

	 "Feeling Lucky"
	 (("L" google-this-lucky-search         "Lucky")
	  ("i" google-this-lucky-and-insert-url "Insert URL"))

	 "Translate"
	 (("t" google-translate-at-point         "EN => JP")
	  ("T" google-translate-at-point-reverse "JP => EN"))

	 "Tool"
	 (("W" google-this-forecast "Weather")))))
```

| Key | 効果                                  |
|-----|-------------------------------------|
| SPC | 確認なしで検索                        |
| RET | どの範囲の情報で検索するか自動判定して検索 |
| w   | 近くの単語で検索                      |
| l   | その行の内容で検索。エラーの検索とかに良いかも |
| s   | シンボルで検索。使うのは Emacs Lisp の関数調べる時ぐらいか? |
| r   | リージョンで検索。まあリージョン選択してたら RET とかでいいんだけども |
| e   | コンパイルバッファのエラーで検索するっぽい |
| L   | 1件目を開く                           |
| i   | 1件目の URL を挿入する                |
| t   | 英語→日本語翻訳                      |
| T   | 日本語→英語翻訳                      |
| w   | 天気を調べる                          |


### グローバルキーバインド {#global-keybinds}


#### 概要 {#概要}

Emacs では様々なグローバルマイナーモードが存在したりしていていつでも使えるようなコマンドが多数存在するのでここでまとめて定義している。

が、Hydra 関係もここに書くと項目が大きくなりすぎるので、それはまた別途定義している。


#### Mac での修飾キー変更 {#mac-での修飾キー変更}

```emacs-lisp
(if (eq window-system 'ns)
	(progn
		  (setq ns-alternate-modifier (quote super)) ;; option  => super
		  (setq ns-command-modifier (quote meta))))  ;; command => meta
```


#### C-h を backspace に変更 {#c-h-を-backspace-に変更}

C-h で文字を消せないと不便なのでずっと昔からこの設定は入れている。

```emacs-lisp
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
```


#### M-g rをstring-replaceに割り当て {#m-g-rをstring-replaceに割り当て}

string-replace はよく使うのでそれなりに使いやすいキーにアサインしている

```emacs-lisp
(global-set-key (kbd "M-g r") 'replace-string)
```

replace-regexp もまあまあ使うけどそれはキーを当ててないのでどこかでなんとかしたい。
Hydra 使う?


#### C-\\ で SKK が有効になるようにする {#c-で-skk-が有効になるようにする}

C-\\ で skk-mode を起動できるようにしている。
C-x C-j の方も設定は生きているが使ってない。っていうか忘れてた。

```emacs-lisp
(global-set-key (kbd "C-\\") 'skk-mode)
```

余談だけど org-mode とか commit message 書く時とかは自動で有効になるようにしたい気はする。


#### C-s を swiper に置き換え {#c-s-を-swiper-に置き換え}

デフォルトだと C-s でインクリメンタルサーチが起動するが
swiper の方が絞り込みができて便利だしカッチョいいのでそっちを使うようにしている

```emacs-lisp
(global-set-key (kbd "C-s") 'swiper)
```


#### window 間の移動 {#window-間の移動}

<!--list-separator-->

-  C-x o を ace-window に置き換え

    C-x o はデフォルトだと順番に window を移動するコマンドだが
    ace-window を使えばたくさん画面分割している時の移動が楽だし
    2分割の時は元の挙動と同様に2つの window を行き来する感じになので完全に置き換えても大丈夫と判断して、置き換えている。

    ```emacs-lisp
    (global-set-key (kbd "C-x o") 'ace-window)
    ```

    ace-window は他にもコマンドがあって
    Hydra の方で ace-swap-window は使えるようにしている

<!--list-separator-->

-  Shift+カーソルキーで window 移動

    シフトキーを押しながらカーソルキーを押すことでも
    window を移動できるようにしている

    ```emacs-lisp
    (windmove-default-keybindings)
    ```

    ただし org-mode のキーバインドとぶつかるので実はあまり使ってないしそろそろ無効にしてもいいんじゃないかなという気もしている


#### undo/redo {#undo-redo}

undo  と redo には undo-fu を使っている

```emacs-lisp
(global-set-key (kbd "C-/") 'undo-fu-only-undo)
(global-set-key (kbd "C-M-/") 'undo-fu-only-redo)
```


#### \\ を入力した時に円マークにならないようにする設定 {#を入力した時に円マークにならないようにする設定}

Mac だとデフォルト状態だと \\ を入れると円マークになるのだがプログラムを書く上ではバックスラッシュであってほしいので円マークが入力された時はバックスラッシュが入力されたように扱われるようにしている。

```emacs-lisp
(define-key global-map [?¥] [?\\])
(define-key global-map [?\C-¥] [?\C-\\])
(define-key global-map [?\M-¥] [?\M-\\])
(define-key global-map [?\C-\M-¥] [?\C-\M-\\])
```

ただ、たまに円マークを出したくなる時があるのでその時はどうすべきかという課題がある。


#### multiple-cursors {#multiple-cursors}

カーソルを複数表示できる [multiple-cursors](https://github.com/magnars/multiple-cursors.el) 用のキーバインド。基本的には公式 README に従って設定している。

```emacs-lisp
;; multiple-cursors
(global-set-key (kbd "C-:") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
```

Ladicle さんの <https://ladicle.com/post/config/#multiple-cursor> の設定が便利そうだなって思って気になってるけどまだ試してない。


#### Ivy {#ivy}

Helm から乗り換えて今はこちらをメインで使っている。基本的には既存のキーバインドの持っていた機能が強化されるようなコマンドを代わりに割り当てている。デフォルトより良い感じで良い。

```emacs-lisp
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
```

| Key     | 効果                                                           |
|---------|--------------------------------------------------------------|
| M-x     | コマンド実行。絞り込みができるのでコマンド名がうろ覚えでも実行できて便利 |
| M-y     | kill-ring の候補表示。適当に複数 kill-ring に入れておいてこれを起動して絞り込んで貼り付けとかできて便利 |
| C-x b   | バッファ切替。これも適当にバッファを絞り込めて便利             |
| C-x C-f | find-file の置き換え。ido より便利な感じの絞り込み選択ができる。 |


#### zoom-window <span class="tag"><span class="unused">unused</span></span> {#zoom-window}

[zoom-window](https://github.com/emacsorphanage/zoom-window) は tmux の zoom 機能のように選択している window だけを表示したり戻したりができるパッケージ。

```emacs-lisp
(global-set-key (kbd "C-x 1") 'zoom-window-zoom)
```

実は戻すことがあんまりないので、このキーバインドは戻してもいいかもしれないなと思っていたりする。


#### neotree <span class="tag"><span class="unused">unused</span></span> {#neotree}

[Neotree](https://github.com/jaypei/emacs-neotree) は IDE みたいにファイルツリーを表示を表示するパッケージ。有効にしているとちょっぴりモダンな雰囲気になるぞい。

```emacs-lisp
(global-set-key [f8] 'neotree-toggle)
```

f8 にバインドしているけど
Helm でも起動できるようにしているので、こっちの設定は外してもいいかもなとか思っている。


#### org-mode <span class="tag"><span class="unused">unused</span></span> {#org-mode}

みんな大好き org-mode 用にもキーバインドを設定している。

```emacs-lisp
(setq my/org-mode-prefix-key "C-c o ")
(global-set-key (kbd (concat my/org-mode-prefix-key "a")) 'org-agenda)
(global-set-key (kbd (concat my/org-mode-prefix-key "c")) 'org-capture)
(global-set-key (kbd (concat my/org-mode-prefix-key "l")) 'org-store-link)
```

けど org-mode 用の Hydra も用意しているのでこれもそろそろ削除かな……


#### keychord {#keychord}

keycohrd は2つのキーを同時押しというキーバインドを実現するパッケージ。麦汁は <https://github.com/zk-phi/key-chord/> のバージョンを利用している。

とりあえず jk を入力するとグローバルに使いたいコマンドを載せた Hydra が起動するようにしている。めっちゃ使ってる。便利。

```emacs-lisp
(key-chord-define-global "jk" 'pretty-hydra-usefull-commands/body)
```


#### yes or no ではなく y or n で質問する {#yes-or-no-ではなく-y-or-n-で質問する}

何か質問された時に yes とか入力するのがだるいので
y だけで済ませられるようにしている。

```emacs-lisp
;; Don't ask yes or no.
(defalias 'yes-or-no-p 'y-or-n-p)
```

一応 Emacs 的には重要なのは yes/no で回答するようになっていたはずなのでより安全に使いたい人はこの設定は入れない方が良いはず。


## ファイル編集/入力補助 {#ファイル編集-入力補助}


### ファイル編集/入力補助 {#_index}

ここにはファイル編集や入力補助の設定をまとめている

[基本設定](#editing-base)
: 編集周りの基本的な設定

[auto-insert](#auto-insert)
: ファイル新規作成時にテンプレートを挿入する機能

[company-mode](#company-mode)
: プラグイン拡張方式を採用した、入力補完インターフェースを提供してくれるやつ

[emojify](#emojify)
: Slack や GitHub みたいに `:smile:` とか入れると笑顔の絵文字を表示する、みたいなやつ

[multiple-cursors](#multiple-cursors)
: カーソルを増やして複数箇所を同時に編集できるようになるやつ

[smartparens](#smartparens)
: カッコや引用符などのペアになるやつの入力補助をしてくれるやつ

[undo-fu](#undo-fu)
: シンプルな undo/redo の機能を提供してくれるやつ

[view-mode](#view-mode)
: Emacs に組込まれてる閲覧専用のモード。コードリーディングの時に有効にすると便利

[whitespace](#whitespace)
: 空白文字を可視化したり自動的に消したりする便利なやつ

[yasnippet](#yasnippet)
: テンプレート挿入機能を提供してくれるやつ


### 基本設定 {#editing-base}


#### 概要 {#概要}

なんか編集周りの基本的な設定としてまとめられていたのでここに置いとく


#### インデントにタブを使わないようにする {#インデントにタブを使わないようにする}

最近の開発スタイルではインデントにタブを混ぜないスタイルなのでそのように設定している。

```emacs-lisp
(setq indent-tabs-mode nil)
```


#### 以前に開いていた位置を保存/復元する {#以前に開いていた位置を保存-復元する}

save-place-mode を有効にしていると以前に開いたことのあるファイルの、開いていた場所を覚えておいてくれる。

一度閉じてまた開いた時なんかに再度移動しないで済んで地味に便利なやつ

```emacs-lisp
(save-place-mode 1)
```


### auto-insert {#auto-insert}


#### 概要 {#概要}

auto-insert はファイルを新規作成した時にファイル名に応じたテンプレートを挿入する機能。

Emacs が標準で持ってるライブラリなのでインストールは不要


#### 設定 {#設定}

Emacs の設定は .emacs.d の中に閉じ込めたいので
auto-insert のテンプレートも `~/.emacs.d/insert` に閉じ込める設定にしている。

```emacs-lisp
(custom-set-variables '(auto-insert-directory "~/.emacs.d/insert/"))
```


#### 有効化 {#有効化}

あとは単に有効化している。

```emacs-lisp
(auto-insert-mode 1)
```


#### 他の設定 {#他の設定}

ファイル名を正規表現でマッチさせてテンプレートが選択されるので各言語やフレームワーク毎に設定を入れることにしている。

実際は今のところ inits/41-vue.el でのみ追加設定を入れている。


### company-mode {#company-mode}


#### 概要 {#概要}

[company-mode](https://github.com/company-mode/company-mode) は Emacs での補完機能を提供してくれるパッケージです。プラグイン式に拡張しやすいのが特徴っぽい。


#### インストール {#インストール}

いつも透り el-get から入れている

```emacs-lisp
(el-get-bundle company-mode)
```


#### 設定 {#設定}

ほとんど設定は入れていない。有効な時に `C-s` を入力すると検索ができる程度。

というのも最近の更新で、デフォルトが結構好みのキーバインドになったのでキーバインドはこだわる必要がなくなったのと、ついでに色もそこで好みな感じになってくれた。

というわけで設定は以下のようにとてもシンプル。

```emacs-lisp
(with-eval-after-load 'company
  ;; active
  (define-key company-active-map (kbd "C-s") 'company-search-candidates))
```

それと最近追加された company-show-quick-access を有効にしている。

```emacs-lisp
(custom-set-variables '(company-show-quick-access t))
```

これを有効にしていると補完候補の末尾に quick access key が表示されて例えば4行目なら 4 とか表示されるのでそこで M-4 とか入力すると4行目が選択されて便利


#### その他 {#その他}

グローバルでは有効にしていなくて各モードで有効にするような hook を入れている。

グローバルで有効でもいい気がしている。


### emojify {#emojify}


#### 概要 {#概要}

[emojify](https://github.com/iqbalansari/emacs-emojify) は `:smile:` のような入力を笑顔の絵文字が表示されたりするようにするパッケージ。

文書を書く時に emojify で絵文字に置き換わるような文字列を入れておくと文書が華やかになって良いぞ!


#### インストール <span class="tag"><span class="improvement">improvement</span></span> {#インストール}

いつも通り el-get で入れている。何か依存でもあるのが別途 dash.el も読み込んでる。

```emacs-lisp
(el-get-bundle emojify)
(el-get-bundle dash)
```

dash.el は他でも使うので、ライブラリの読み込みのところで対応した方が良さそうだな。今度対応しよう。


#### 有効化 {#有効化}

emojify がグローバルに有効になるようにしている。

mode-line でも有効になるようにしているので
mode-line のカスタマイズ時に emojify で装飾することもできる。今そんなことやってないけど。

```emacs-lisp
(global-emojify-mode 1)
(global-emojify-mode-line-mode 1)
```


### multiple-cursors {#multiple-cursors}


#### 概要 {#概要}

[multiple-cursors](https://github.com/magnars/multiple-cursors.el) はカーソルを増やせるやつ。複数箇所を同時に編集できるようになって便利。


#### インストール {#インストール}

el-get からインストールしている

```emacs-lisp
(el-get-bundle multiple-cursors)
```


#### キーバインド {#キーバインド}

キーバインドは別途定義している。もうちょっと真面目に定義したい


### smartparens {#smartparens}


#### 概要 {#概要}

[smartparens](https://github.com/Fuco1/smartparens) はカッコとかクォートとかのペアになるようなものの入力補助をしてくれるやつ。

strict モードだとペアが崩れないように強制するので雑に C-k で行削除しててもペアが維持されて便利。


#### インストール {#インストール}

いつも透り el-get で導入している

```emacs-lisp
(el-get-bundle smartparens)
```


#### 設定 {#設定}

実は導入して間もないので、提供されてるオススメ設定のみ突っ込んでいる。オススメ設定は別途 reqiure したら良いという作りなので、以下のようにして突っ込んでいる。

```emacs-lisp
(require 'smartparens-config)
```


#### その他 {#その他}

各言語の hook で `smartparens-strict-mode` を有効にしている。なんか常に有効だと困りそうな気がしたので。


### undo-fu {#undo-fu}


#### 概要 {#概要}

[undo-fu](https://github.com/emacsmirror/undo-fu) はシンプルな undo/redo 機能を提供してくれるやつ。

昔はもっと色々できる [undo-tree](https://www.emacswiki.org/emacs/UndoTree) を使っていたけどそっちにバグがあるっぽいので乗り換えた。


#### インストール {#インストール}

```emacs-lisp
(el-get-bundle undo-fu)
```


#### キーバインド {#キーバインド}

別の場所で定義しているけど、以下のキーバインドにしている。

| Key   | 効果 |
|-------|----|
| C-/   | undo |
| C-M-/ | redo |


### view-mode {#view-mode}


#### 概要 {#概要}

[view-mode](https://www.emacswiki.org/emacs/ViewMode) は Emacs に標準で組込まれているモードで、バッファを閲覧専用にする機能を提供してくれるやつ。コードを眺めたい時などに使っている。


#### キーバインド {#キーバインド}

view-mode の時は文字入力をする必要がないので通常のモードの時とは違うキーバインドが使えるようにしている。

```emacs-lisp
(defun my/setup-view-mode-keymap ()
	(let ((keymap view-mode-map))
	  (define-key keymap (kbd "h") 'backward-char)
	  (define-key keymap (kbd "j") 'next-line)
	  (define-key keymap (kbd "k") 'previous-line)
	  (define-key keymap (kbd "l") 'forward-char)

	  (define-key keymap (kbd "e") 'forward-word)

	  (define-key keymap (kbd "b")   'scroll-down)
	  (define-key keymap (kbd "SPC") 'scroll-up)

	  (define-key keymap (kbd "g") 'beginning-of-buffer)
	  (define-key keymap (kbd "G") 'end-of-buffer)
	  (define-key keymap (kbd "<") 'beginning-of-buffer)
	  (define-key keymap (kbd ">") 'end-of-buffer)))
```

| Key     | 効果       |
|---------|----------|
| h       | 1文字戻る  |
| j       | 1行下がる  |
| k       | 1行上がる  |
| l       | 1文字進む  |
| e       | 単語の直後に移動 |
| b       | 1スクロール戻る |
| SPC     | 1スクロール進む |
| g, &lt; | バッファの先頭に移動 |
| G, &gt; | バッファの末尾に移動 |

適当だけど Vim の通常モードの時みたいな操作ができるようにしている。

これで不要に左手小指を痛める可能性が下がるであろう。


#### hook {#hook}

上でキーバインドを設定できる関数を用意してあるので
view-mode が有効になる時にそれを hook して設定されるようにしている。

が、 hook する必要あるのか疑問ではあるな。ま、動いているからとりあえずいいけど。

```emacs-lisp
(defun my/view-mode-hook ()
  (my/setup-view-mode-keymap))

(add-hook 'view-mode-hook 'my/view-mode-hook)
```


#### Toggle するコマンド {#toggle-するコマンド}

view-mode にしたり戻したりするコマンドを用意している。

view-mode を有効にする時には hl-line-mode も有効にしているのでその時眺めている行がハイライトされるようになっている。普段はそれがあるかどうかでどっちもモードかざっくり判断している。

他にも mode-line の色を変更するなどの技があるようだがひとまず今の設定でそう困ってないのでいいかな。

```emacs-lisp
(defun my/toggle-view-mode ()
  "view-mode と通常モードの切り替えコマンド"
  (interactive)
  (cond (view-mode
		 (hl-line-mode -1)
		 (view-mode -1))
		(t
		 (hl-line-mode 1)
		 (view-mode 1))))
```


### whitespace {#whitespace}


#### 概要 {#概要}

whitespace-mode は Emacs に標準添付されている、空白文字を可視化したりするためのモード。

全角空白を可視化したり、行末の空白を可視化したりしておくと便利なので入れている。


#### 設定 {#設定}

```emacs-lisp
(require 'whitespace)
```


#### 可視化対象 {#可視化対象}

可視化対象の空白について設定している。

```emacs-lisp
(setq whitespace-style '(face
						 trailing
						 tabs
						 spaces
						 empty
						 space-mark
						 tab-mark))
```

| 値         | 意味                                        |
|-----------|-------------------------------------------|
| face       | face による可視化を有効にする。これがないと \*-mark 以外が有効にならない |
| trailing   | 行末の空白を可視化する                      |
| tabs       | タブ文字の可視化                            |
| spaces     | 空白の可視化。ただし後の設定で全角のみを可視化するようにている |
| empty      | バッファの前後に空行があれば可視化          |
| space-mark | 空白文字を別の文字に置き換える設定。置き換え文字は後述 |
| tab-mark   | タブ文字を別の文字に置き換える設定。置き換え文字は後述 |

他にも lines, lines-tail, indentation, big-indent, newline-mark などがある

lines-tail あたりを使うと1行80文字制限でコーディングする時などに便利かもしれないなって思ってる。設定したことがないからわからんが……。


#### 置き換え表示用の文字の設定 {#置き換え表示用の文字の設定}

```emacs-lisp
(setq whitespace-display-mappings
	  '((space-mark ?\u3000 [?\u25a1])
		;; WARNING: the mapping below has a problem.
		;; When a TAB occupies exactly one column, it will display the
		;; character ?\xBB at that column followed by a TAB which goes to
		;; the next TAB column.
		;; If this is a problem for you, please, comment the line below.
		(tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
```

| 置き換え元 | 置き換え先                                 |
|-------|---------------------------------------|
| 空白文字 | 　                                         |
| タブ文字 | » + TAB を表示する。もしそれが表示できない時は \\ + TAB で代替する |

どこかからコピペしてきたやつなので英語のコメントもあるが「なんかうまく動かなかったらコメントアウトしてくれよな」って感じ。ま、うまく動いてそうなのでヨシッ!


#### スペースは全角のみを可視化 {#スペースは全角のみを可視化}

半角スペースまでいちいち可視化されてたら邪魔だし気付きたいのは全角スペースが紛れてるかどうかなので、空白文字ではそれだけを可視化するようにしている。

```emacs-lisp
(setq whitespace-space-regexp "\\(\u3000+\\)")
```


#### 行末の空白も表示 {#行末の空白も表示}

通常の半角空白と No Break Space(`&nbsp;` で表示されるやつ) を行末での可視化対象としている。

```emacs-lisp
(setq whitespace-trailing-regexp  "\\([ \u00A0]+\\)$")
```

タブも入れてもまあいいんだろうけど、別途可視化しているからわざわざ入れなくても良いということでこうしている気がする。


#### 保存前に自動でクリーンアップ {#保存前に自動でクリーンアップ}

保存時なんかに自動的に余計な空白を消すような設定。保存する時に、バッファ前後の無駄な空白や末尾の空白なんかを取り除いてくれる。

```emacs-lisp
(setq whitespace-action '(auto-cleanup))
```

実はスペースとタブが混ざってる時などもいい感じに対応してくれそうな雰囲気があるけどそもそもスペースとタブが混ざるような設定にしてないのでそれは観測できてない。


#### Emacs 全体で有効化 {#emacs-全体で有効化}

とまあ、上で設定してきたように、色々可視化されたり余計な空白を処理してくれたりで便利なやつなので、
Emacs 全体で有効にしている。

```emacs-lisp
(global-whitespace-mode 1)
```


### yasnippet {#yasnippet}


#### 概要 {#概要}

[yasnippet](https://github.com/joaotavora/yasnippet) はテンプレートを挿入する機能を持ったパッケージ。
Emacs でそこそこ何かを書いている人なら大体知ってるような有名なやつだと思う。


#### インストール {#インストール}

いつも通り el-get でインストール

```emacs-lisp
(el-get-bundle yasnippet)
```


#### 有効化 {#有効化}

どこでも使いたいぐらい便利なやつなので global に有効化している

```emacs-lisp
(yas-global-mode 1)
```


#### キーバインド {#キーバインド}

基本的に覚えられないので Hydra を使って定義している

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define
	yasnippet-hydra (:separator "-" :title "Yasnippet" :foreign-key warn :quit-key "q" :exit t)
	("Edit"
	 (("n" yas-new-snippet        "New")
	  ("v" yas-visit-snippet-file "Visit"))

	 "Other"
	 (("i" yas-insert-snippet  "Insert")
	  ("l" yas-describe-tables "List")
	  ("r" yas-reload-all      "Reload all")))))
```

| Key | 効果                           |
|-----|------------------------------|
| n   | 現在のメジャーモード用に新しい snippet を作る |
| v   | 現在のメジャーモードの登録済 snippet ファイルを開く |
| i   | snippet の挿入。選択は ivy で行われる。 |
| l   | 現在のメジャーモードの登録済 snippet の一覧表示 |
| r   | snippet を全部 load し直す     |


#### その他 {#その他}

実は、どういう snippet があれば便利なのかよくわかってなくて
snippet をほとんど登録してない。

[yasnippet-snippets](https://github.com/AndreaCrotti/yasnippet-snippets) などのよくある snippet 集は、そんなの省略形をまず覚えられないだろと思っている。
ivy で選択可能なので省略形は長くていいので中身がわかりやすい方が良い。

また導入はしてないが [ivy-yasnippet](https://github.com/mkcms/ivy-yasnippet) を入れるとさらにそのあたりがやりやすくなるんじゃないかと思う。

それから company-yasnippet で補完できるようにしているとより良いかもれない。

とはいえ snippet を充実させてない今だとどうにもイマイチそのあたりを充実させる気力がない


## UI {#ui}


### UI {#_index}

ここでは Emacs の UI を変更するようなものを載せている

[alert](#alert)
: 共通インターフェースで色々な通知機能と連携して通知するやつ

[all-the-icons](#all-the-icons)
: Emacs で様々なアイコンを表示できるようにするやつ

[color-theme-molokai](#color-theme-molokai)
: ダークグレーベースのカラーテーマ

[dashboard](#dashboard)
: Emacs 起動時の表示を便利にしてくれるパッケージ

[frame-cmds](#frame-cmds)
: フレーム移動や拡縮などの操作をするコマンド群

[fullscreen](#fullscreen)
: 起動時のフルスクリーン設定

[git-gutter-fringe](#git-gutter-fringe)
: 最後のコミットからどう弄ったかを fringe 領域に表示してくれるやつ

[highlight-indent-guides](#highlight-indent-guides)
: インデント毎にラインを引いたりして見易くしてくれるやつ

[hydra](#hydra)
: サブコマンドをビジュアル的に表示してくれるメニューを提供してくれるやつ

[ido-mode](#ido-mode)
: Emacs 標準添付の補完インターフェース

[ivy](#ivy)
: 絞り込みインターフェーズを提供してくれるやつ。

[mode-line](#mode-line)
: モードラインに関する設定をここにまとめている

[Neotree](#neotree)
: フォルダ構造を IDE みたいにツリー表示するやつ

[posframe](#posframe)
: いい感じの位置に child frame を表示する機能を提供するやつ

[show-paren-mode](#show-paren-mode)
: 対応するカッコとコッカをハイライトしてくれたりするやつ

[toolbar](#toolbar)
: Emacs 標準のボタンなどの UI 部分の設定

[uniquify](#uniquify)
: 同名ファイルを開いている時にどこのファイルかまで表示してくれるやつ

[yascroll](#yascroll)
: 主張の大人しいスクロールバーを表示してくれるやつ

[zoom](#zoom)
: フォーカスが当たってるウインドウを大きく表示してくれるやつ

[zoom-window](#zoom-window)
: 見ている window を最大化したり戻したりしてくれるやつ


### alert {#alert}


#### 概要 {#概要}

[alert](https://github.com/jwiegley/alert) は色々な通知システムに対応した通知を飛ばせるパッケージ。
Mac だと Growl だったり terminal-notifier だったり
Win だと toast だったり
Linux だと libnotify だったりを使ってその環境での標準的な通知機能を使って通知ができるやつ。


#### インストール {#インストール}

いつも通りに el-get でインストール。

```emacs-lisp
(el-get-bundle alert)
```


#### 設定 {#設定}

業務では Mac を使ってるので terminal-notifier を設定している。他の環境では libnotify にしている。

```emacs-lisp
(if (or (eq window-system 'ns) (eq window-system 'mac))
	(setq alert-default-style 'notifier) ;; use terminal-notifier
  (setq alert-default-style 'libnotify))
```

「他の環境」が WSL 上の Emacs と Manjaro 上の Emacs なのだけども、後者は最近使ってないので無視して libnotify で通知するように設定を変えた。

本当は WSL2 でもいい感じに通知されるようにしたいが
[WSLで通知を出すメモ - cobodoのブログ](https://cobodo.hateblo.jp/entry/2018/03/08/160247)
とかを見てるとちょっと面倒そう。


### all-the-icons {#all-the-icons}


#### 概要 {#概要}

[all-the-icons](https://github.com/domtronn/all-the-icons.el) は Emacs で様々なアイコンを表示できるようにして華やかにしてくれるパッケージです。
[Neotree](#neotree) などでも対応していてアイコンでファイルの種類が表示されるようになってモダンな雰囲気が出ます。


#### インストール <span class="tag"><span class="improvement">improvement</span></span> {#インストール}

いつも通り el-get-bundle で入れている。明示的に require している理由は忘れました。

```emacs-lisp
(el-get-bundle all-the-icons)
(require 'all-the-icons)
```


#### フォントのインストール {#フォントのインストール}

以下のコマンドを叩くことでフォントをインストールすることができる。
all-the-icons のインストール直後に叩いておいたら普段は叩かなくて良いはず。

```emacs-lisp
(all-the-icons-install-fonts)
```

all-the-icons の更新後は叩いた方がいいかもしれない


#### キーバインド <span class="tag"><span class="improvement">improvement</span></span> {#キーバインド}

キーバインドは覚えられないし、使えるキーも大分埋まってるので、
pretty-hydra を使って all-the-icons 用の Hydra を用意している。

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define all-the-icons-hydra (:separator "-" :title "All the icons" :exit t :quit-key "q")
	("Insert"
	 (("a" all-the-icons-insert-alltheicon "All the icons")
	  ("f" all-the-icons-insert-fileicon   "File icons")
	  ("F" all-the-icons-insert-faicons    "FontAwesome")
	  ("m" all-the-icons-insert-material   "Material")
	  ("o" all-the-icons-insert-octicon    "Octicon")
	  ("w" all-the-icons-insert-wicon      "Weather")
	  ("*" all-the-icons-insert            "All")))))
```

| Key | 効果                             |
|-----|--------------------------------|
| a   | all-the-icons で追加されてるアイコンを検索して挿入 |
| f   | ファイルアイコンを検索して挿入   |
| F   | FontAwesome アイコンを検索して挿入 |
| m   | Material アイコンを検索して挿入  |
| o   | Octicon のアイコンを検索して挿入 |
| w   | 天気アイコンを検索して挿入       |
| \*  | 全てのアイコンを検索して挿入     |

フォントのインストールコマンドもここに収めてしまうのが良さそうな気がする


### color-theme-molokai {#color-theme-molokai}


#### 概要 {#概要}

[color-theme-molokai](https://github.com/sonatard/color-theme-molokai) は多分 vim の molokai をベースにしたテーマ。更に元はどうも TextMate っぽい。

ダークグレイ背景をベースにしたテーマでもう何年もこのテーマを使っている。


#### インストール {#インストール}

いつも通り el-get で入れている。
MELPA に登録されてないのかわからんけど直接 GitHub から入れている。

```emacs-lisp
(el-get-bundle alloy-d/color-theme-molokai)
```


#### テーマへの PATH を通す {#テーマへの-path-を通す}

インストールしただけでは custom-theme-load-path には追加されないので自分で add-to-list を使って PATH を通している。

```emacs-lisp
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/el-get/color-theme-molokai"))
```


#### テーマの読み込み {#テーマの読み込み}

最後に load-theme で molokai を読み込んでいる。

```emacs-lisp
(load-theme 'molokai t)
```


#### その他 {#その他}

もう長年これを使っているが、近年ではもっと良いテーマも出ているかもしれないのでそのうち乗り換えるかも。

なんだけど、テーマ乗り換えるのちょっとだるいのよね〜。


### dashboard {#dashboard}


#### 概要 {#概要}

[emacs-dashboard](https://github.com/emacs-dashboard/emacs-dashboard) は
Emacs の起動時に色々な情報を表示してくれるパッケージ。


#### インストール {#インストール}

いつも通り el-get で入れている

```emacs-lisp
(el-get-bundle dashboard)
```


#### 表示するアイコンをロゴに変更 {#表示するアイコンをロゴに変更}

ロゴ、画像にした方がカッコいいよねってことで logo に変更している

```emacs-lisp
(setq dashboard-startup-banner 'logo)
```

なお CUI で起動すると自動でテキストでの表示になる


#### 表示する情報の設定 {#表示する情報の設定}

dashboard-items を弄ることで表示する情報を設定している

```emacs-lisp
(setq dashboard-items '((recents  . 5)
						;; (bookmarks . 5) ;; bookmarks は使ってない
						(projects . 5)
						(agenda . 5)
						;; (registers . 5) ;; registers は使ってない
						))
```

Emacs の bookmarks と register は使ってない(使えてない)のでコメントアウトしている。

あとは最近開いたファイルとプロジェクトとagendaを表示するようにしているがイマイチ活用できてないので色々設定を詰める必要がありそう


#### 各セクションのタイトル部の先頭にアイコンを表示 {#各セクションのタイトル部の先頭にアイコンを表示}

これは見た目をちょっとだけカッコよくするために all-the-icons で装飾するための設定

```emacs-lisp
(setq dashboard-set-heading-icons t)
```


#### 各ファイルの先頭にアイコンを表示 {#各ファイルの先頭にアイコンを表示}

これも見た目をちょっとだエカッコよくするために all-the-icons で装飾するための設定。だけどファイルの種類がアイコンでわかるので便利。

```emacs-lisp
(setq dashboard-set-file-icons t)
```


#### 最後に設定を反映 {#最後に設定を反映}

多分設定を反映するための関数だと思ってる。

```emacs-lisp
(dashboard-setup-startup-hook)
```


#### その他 {#その他}

agenda などは表示する内容を絞ったりした方が dashboard として使い勝手が良さそう。今日の会議何があるとかが出ると便利かもね。


### frame-cmds {#frame-cmds}


#### 概要 {#概要}

[frame-cmds](https://www.emacswiki.org/emacs/frame-cmds.el) は Emacs のフレーム操作に関するコマンド集。上下左右に移動したり広げたりといったことができる。いや、他にもできそうなんだけど、私がそれを把握してない。


#### インストール {#インストール}

el-get で以下のように書くと emacswiki からインストールされる。

```emacs-lisp
(el-get-bundle frame-cmds)
```


#### キーバインド {#キーバインド}

無論キーバインドは覚えられないので以下のように Hydra で定義している

```emacs-lisp
(pretty-hydra-define window-control-hydra (:separator "-" :title "Window Control" :exit nil :quit-key "q")
  ("Move"
   (("h" move-frame-left  "Left")
	("j" move-frame-down  "Down")
	("k" move-frame-up    "Up")
	("l" move-frame-right "Right"))

   "Resize"
   (("H" shrink-frame-horizontally "H-")
	("J" enlarge-frame "V+")
	("K" shrink-frame "V-")
	("L" enlarge-frame-horizontally "H+"))))
```

| Key | 効果     |
|-----|--------|
| h   | 左に移動 |
| j   | 下に移動 |
| k   | 上に移動 |
| l   | 右いん移動 |
| H   | 左右方向に縮める |
| J   | 上下方向に広げる |
| K   | 上下方向に縮める |
| L   | 左右方向に広げる |


### fullscreen {#fullscreen}


#### 概要 {#概要}

起動時にフルスクリーンにする設定はここにまとめている


#### Mac の設定 {#mac-の設定}

Mac の場合にフルスクリーンにする設定を入れていた。けど 2020-01-08 に yabai WM を導入したことにより起動時はフルスクリーンじゃない方がよくなったので以下の処理は今は使ってない。

```emacs-lisp
(if (or (eq window-system 'ns) (eq window-system 'mac))
	(add-hook 'window-setup-hook
			  (lambda ()
				(set-frame-parameter nil 'fullscreen 'fullboth))))
```


#### WSL の設定 {#wsl-の設定}

X Window system の場合かつ WSLENV という環境変数が設定されている場合にはフルスクリーンにする。新しく Linux マシンを導入したらこれの影響を受けていたので後から WSLENV による判定を追加した次第。

```emacs-lisp
(if (and (eq window-system 'x) (getenv "WSLENV"))
	(add-hook 'window-setup-hook
			  (lambda ()
				(set-frame-parameter nil 'fullscreen 'fullboth)
				(set-frame-position nil 0 0))))
```

微妙に画面の下の方がちゃんとフルになってくれてないけどそこは今は我慢して使っている。ちなみにその病はどうやら WSLg になっても残りそう。
<https://w.atwiki.jp/ntemacs/pages/69.html>


### git-gutter-fringe <span class="tag"><span class="improvement">improvement</span></span> {#git-gutter-fringe}


#### 概要 {#概要}

[git-gutter-fringe](https://github.com/emacsorphanage/git-gutter-fringe) は [git-gutter](https://github.com/emacsorphanage/git-gutter) の派生版。最後のコミットからどの行を弄ったかを fringe 領域に表示してくれる。

他にも hunk の操作をできる機能とかあるみたいだけどそのあたりは使ったことがない……。

派生元の git-gutter は linum-mode と同じ領域を使って描画をしているようで併用ができなかったので git-gutter-fringe を利用している。

が、Emacs 26 から display-line-numbers-mode が搭載されて linum-mode が不要になったので
git-gutter に乗り換えても良さそう


#### インストール {#インストール}

いつも通り el-get でインストールしている

```emacs-lisp
(el-get-bundle git-gutter-fringe)
```


#### 有効化 {#有効化}

Git 管理しているやつは全部差分情報が表示されて欲しいのでグローバルマイナーモードを有効にしている。

```emacs-lisp
(global-git-gutter-mode t)
```


#### その他 {#その他}

git-gutter ほどではないけど多少のカスタマイズはできるはずだがデフォルト設定で特に不満はないので何もしてない


### highlight-indent-guides {#highlight-indent-guides}


#### 概要 {#概要}

[highlight-indent-guides](https://github.com/DarthFennec/highlight-indent-guides) はインデント毎にラインを引いたりして見易くしてくれるパッケージ。通常のプログラムを書く時にも便利だけど、
YAML などのインデントがそのまま構造になるような言語を弄る時にとても便利。


#### インストール {#インストール}

これもいつも通り el-get でインストールしている。
GitHub にあるのでそこを直接指定してインストールもできるのだけど
el-get.lock からアップデートをチェックする都合上、レシピを用意してそれを使ってインストールしている

```emacs-lisp
(:name highlight-indent-guides
	   :website "https://github.com/DarthFennec/highlight-indent-guides"
	   :description "This minor mode highlights indentation levels via font-lock"
	   :type github
	   :pkgname "DarthFennec/highlight-indent-guides")
```

```emacs-lisp
(el-get-bundle highlight-indent-guides)
```


#### 設定 <span class="tag"><span class="improvement">improvement</span></span> {#設定}

今いる行がどのインデントにいるのかをわかりやすくするために
responsive モードを有効にしている。

```emacs-lisp
(setq highlight-indent-guides-responsive "stack")
```

defcustom で定義されてる変数なので
custom-set-variables で設定した方がいいかもしれない。


### hydra {#hydra}


#### 概要 {#概要}

[Hydra](https://github.com/abo-abo/hydra) は Emacs の貴重なキーバインドを節約できる便利なパッケージ。

自分で定義した各 Hydra コマンドを実行するとそれに紐付くサブコマンドとそれらのキーバインド一覧を表示させることができるというやつ。


#### インストール {#インストール}

Hydra 本体と関連パッケージをここでインスコしている

<!--list-separator-->

-  Hydra 本体のインストール

    Hydra 本体は el-get で普通に入れている

    ```emacs-lisp
    (el-get-bundle hydra)
    ```

<!--list-separator-->

-  hydra-posframe のインストール

    Hydra は通常だと minibuffer あたりに表示されるけど画面の真ん中に表示される方が視線移動が少なくて便利なので
    hydra-posframe を使って画面中央に表示されるようにしている。

    インストールはいつも通り el-get で行っている。

    ```emacs-lisp
    (el-get-bundle hydra-posframe)
    ```

    そして Emacs の初期化処理が完了したタイミングでそれが使われるように after-init-hook で hydra-posframe を有効化している

    ```emacs-lisp
    (add-hook 'after-init-hook 'hydra-posframe-enable)
    ```

<!--list-separator-->

-  WebDAV Sync download の設定

    作業管理用の org-mode のドキュメントは WebDAV サーバにも上げて
    beorg でも使えるようにしているがそれを拾って来るためのコマンドを用意している。

    ```emacs-lisp
    (defun my/download-from-beorg ()
      (interactive)
      (async-shell-command "java -jar ~/bin/webdav_sync1_1_9.jar -c ~/.config/webdav-sync/download.xml && notify-send 'WebDAV Sync' 'Downloaded from WebDAV'"))
    ```

    簡単に `async-shell-command` を使って済ませている

<!--list-separator-->

-  major-mode-hydra のインストール

    自分以外で使っている人を見たことはないけど麦汁さんは [major-mode-hydra](https://github.com/jerrypnz/major-mode-hydra.el) というものを利用している。

    これは major mode 用に簡単に Hydra の設定ができるというやつ。なので emacs-lisp-mode 用の Hydra とか
    js2-mode 用の Hydra などを定義できて便利。

    どちらの場合も `M-x major-mode-hydra` で起動するので迷わないで済むのも良い。

    内部では同じリポジトリにある pretty-hydra というのを利用していてそいつが UI の定義をせずともそれなりの感じに Hydra のメニューを構築してくれるようになっている。これもズボラな麦汁さんは気に入っている。導入していても表示にこだわりたい場合は直接 `defhydra` したらいいだけだしね。

    ってことでそれを el-get を使って GitHub からインストールしている。

    ```emacs-lisp
    (el-get-bundle major-mode-hydra.el)
    ```

    なおレシピは自前で用意している

    ```emacs-lisp
    (:name major-mode-hydra.el
    	   :website "https://github.com/jerrypnz/major-mode-hydra.el"
    	   :description "this package offers an alternative way to manage your major mode specific key bindings."
    	   :type github
    	   :pkgname "jerrypnz/major-mode-hydra.el")
    ```

<!--list-separator-->

-  pretty-hydra の関数上書き

    Hydra の表示には hydra-posframe を使っているが
    hydra-posframe は最初に空行があると最後の行を表示しないようなので一時的に pretty-hydra--maybe-add-title を上書きして使ってみている。

    ```emacs-lisp
    (with-eval-after-load 'pretty-hydra
      (defun pretty-hydra--maybe-add-title (title docstring)
      "Add TITLE to the DOCSTRING if it's not nil, other return DOCSTRING unchanged."
      (if (null title)
    	  docstring
    	(format "%s\n%s"
    			(cond
    			 ((char-or-string-p title) title)
    			 ((symbolp title)          (format "%%s`%s" title))
    			 ((listp title)            (format "%%s%s" (prin1-to-string title)))
    			 (t                        ""))
    			docstring))))
    ```

    今のところ快適に使えているが
    posframe か hydra-posframe か pretty-hydra のどれかの修正で実はもう不要になっている可能性もある。


#### キーバインド {#キーバインド}

Hydra でいくつかのキーバインドを設定していて他の機能に属さないものはここでまとめてキーバインドを定義している。

<!--list-separator-->

-  el-get

    他の機能に属さないものは、と書いたな? ありゃ嘘だ。
    el-get の Hydra はここで定義してしまっている。その内 el-get 用の設定ファイルにでも移動したい気がする。

    ```emacs-lisp
    (pretty-hydra-define el-get-hydra (:separator "-" :title "el-get" :foreign-key warn :quit-key "q" :exit t)
      ("Install"
       (("i" el-get-install   "Install")
    	("I" el-get-reinstall "Re-install")
    	("D" el-get-remove    "Uninstall"))

       "Update"
       (("s" el-get-self-update  "Self Update")
    	("u" el-get-update       "Update")
    	("A" el-get-update-all   "Update All")
    	("r" el-get-reload       "Reload"))

       "Recipe"
       (("f" el-get-find-recipe-file  "Find recipe"))

       "Lock"
       (("C" el-get-lock-checkout  "Checkout")
    	("U" el-get-lock-unlock    "Unlock"))))
    ```

    | Key | 効果                                        |
    |-----|-------------------------------------------|
    | i   | パッケージの新規インストール。正直このキー叩いた記憶がない |
    | I   | パッケージの再インストール                  |
    | D   | パッケージの削除                            |
    | s   | el-get 自身のアップデート                   |
    | u   | 指定パッケージのアップデート                |
    | A   | 全パッケージのアップデート                  |
    | r   | パッケージの読み直し                        |
    | f   | パッケージのインストール用レシピファイルを開く |
    | C   | 指定したパッケージを el-get-lock でロックされたバージョンをチェックアウト |
    | U   | 指定したパッケージの el-get-lock のロックを解除 |

<!--list-separator-->

-  Toggle Switches

    ここでは ON/OFF を切り替えるような機能のコントロールを行っている。

    ```emacs-lisp
    (pretty-hydra-define
      toggle-hydra
      (:separator "-"
    			  :title (concat (all-the-icons-faicon "toggle-on") " Toggle Switches")
    			  :foreign-key warn
    			  :quit-key "q"
    			  :exit t)
      ("View"
       (("z" zoom-mode                 "zoom-mode"      :toggle zoom-mode)
    	("Z" toggle-frame-fullscreen   "Fullscreen"     :toggle (frame-parameter nil 'fullscreen))
    	("e" emojify-mode              "Emojify"        :toggle emojify-mode)
    	("b" display-battery-mode      "Battery"        :toggle display-battery-mode)
    	("L" display-line-numbers-mode "Line Number"    :toggle display-line-numbers-mode)
    	("N" neotree-toggle            "Neotree"        :toggle (if (fboundp 'neo-global--window-exists-p) (neo-global--window-exists-p) nil)))

       "Behavior"
       (("S" my/notify-slack-toggle    "Notify Slack"   :toggle my/notify-slack-enable-p)
    	("v" my/toggle-view-mode       "Readonly"       :toggle view-mode)
    	("A" auto-fix-mode             "Auto fix"       :toggle auto-fix-mode)
    	("E" toggle-debug-on-error     "Debug on error" :toggle debug-on-error))))
    ```

    | Key | 効果                                                                   |
    |-----|----------------------------------------------------------------------|
    | z   | [zoom-mode](#zoom) のON/OFF切替。狭いディスプレイの時は ON にするが、大きいディスプレイだと OFF にしている |
    | Z   | フルスクリーンの切替。狭いディスプレイの時は ON にするが、大きいディスプレイだと OFF にしている |
    | b   | バッテリー表示モードの切替。OFF にしたことないな……                   |
    | L   | 行番号表示の切替。邪魔になる時もあるので ON/OFF 切り替えている         |
    | N   | [Neotree](#neotree) の表示切替。普段は邪魔なので OFF にしている        |
    | S   | Slack 通知の切替。org-clock-in とかのタイミングで Slack に通知を飛ばしているが切る時もある |
    | v   | view-mode にしたり戻したり。コードを眺めたい時などに ON にする         |
    | E   | エラー時のデバッグモードの切替。設定を弄ってる時はバックトレースある方が嬉しいよね |

<!--list-separator-->

-  Sub Tools

    最初に起動した Hydra からは外してるけど、そこそこ使うコマンド群を適当に詰めてるやつ。

    ```emacs-lisp
    (pretty-hydra-define
      subtools-hydra
      (:separator "-"
    			  :color teal
    			  :foreign-key warn
    			  :title (concat (all-the-icons-material "build") " Sub tools")
    			  :quit-key "q"
    			  :exit t)
      ("Describe"
       (("b" counsel-descbinds "Keybind")
    	("f" counsel-describe-function "Function")
    	("v" counsel-describe-variable "Variable")
    	("m" describe-minor-mode "Minor mode"))

       ;; ("P"   my/open-review-requested-pr "Open Requested PR")
       "Other"
       (("@" all-the-icons-hydra/body "List icons")
    	("D" my/download-from-beorg))))
    ```

    | Key | 効果                             |
    |-----|--------------------------------|
    | b   | キーバインドを調べる             |
    | f   | Emacs Lisp の関数を調べる        |
    | v   | Emacs Lisp の変数を調べる        |
    | m   | minor-mode を調べる              |
    | @   | All the icons の Hydra を起動    |
    | D   | beorg 連携に使ってる WebDAV サーバからダウンロード |

<!--list-separator-->

-  Text Scale

    文字サイズの切替用。たまに字を大きくしたりしたいので。

    ```emacs-lisp
    (pretty-hydra-define text-scale-hydra (:separator "-" :title (concat (all-the-icons-material "text_fields") " Text Scale") :exit nil :quit-key "q")
      ("Scale"
       (("+" text-scale-increase "Increase")
    	("-" text-scale-decrease "Decrease")
    	("0" text-scale-adjust   "Adjust"))))
    ```

    | Key | 効果        |
    |-----|-----------|
    | +   | 文字サイズを大きくする |
    | -   | 文字サイズを小さくする |
    | 0   | 文字サイズを元に戻す |

<!--list-separator-->

-  Main

    よく使うコマンドをまとめたやつ。
    [key-chord](#key-chord) を使って `jk` 同時押しで起動できるようにしている。

    ```emacs-lisp
    (pretty-hydra-define pretty-hydra-usefull-commands (:separator "-" :color teal :foreign-key warn :title (concat (all-the-icons-material "build") " Usefull commands") :quit-key "q")
      ("File"
       (("p" projectile-hydra/body "Projectile")
    	("f" counsel-find-file     "Find File")
    	("d" counsel-find-dir      "Find Dir")
    	("r" counsel-recentf       "Recentf")
    	("l" counsel-locate        "Locate")
    	("A" counsel-osx-app       "macOS App"))

       "Edit"
       (("a" align-regexp "Align Regexp")
    	(";" comment-dwim "Comment"))

       "Code"
       (("G" counsel-projectile-ag       "Grep")
    	("j" dumb-jump-pretty-hydra/body "Dumb jump")
    	("g" avy-hydra/body              "Avy")
    	("i" counsel-imenu               "imenu")
    	("y" yasnippet-hydra/body        "Yasnippet")
    	("B" browse-at-remote            "Browse")
    	("m" magit-status                "Magit"))

       "View"
       (("D" delete-other-windows      "Only This Win")
    	("W" window-control-hydra/body "Window Control")
    	("+" text-scale-hydra/body     "Text Scale")
    	("w" ace-swap-window           "Swap Window"))

       "Tool"
       (("SPC" major-mode-hydra         "Hydra(Major)")
    	("s"   toggle-hydra/body        "Toggle switches")
    	("c"   counsel-org-capture      "Capture")
    	("o"   global-org-hydra/body    "Org")
    	("e"   el-get-hydra/body        "el-get")
    	("/"   google-pretty-hydra/body "Google")
    	("t"   subtools-hydra/body      "Sub Tools"))))
    ```

    | Key | 効果                                                                    |
    |-----|-----------------------------------------------------------------------|
    | p   | [Projectile](#projectile) 用の Hydra 起動                               |
    | f   | counsel でファイルを開く                                                |
    | d   | counsel でフォルダ開く                                                  |
    | r   | counsel で最近使ったファイルを開く                                      |
    | l   | counsel で locate する。Mac だと mdfind だけど                          |
    | A   | counsel で macOS の Application を開く                                  |
    | a   | 正規表現に基いて整形                                                    |
    | ;   | コメント挿入。 M-; を使ってるから要らないかも                           |
    | G   | projectile 内の検索。関係ないのがかかる時もあるので調整必要             |
    | j   | [dumb-jump](#dumb-jump) 用の Hydra 起動                                 |
    | g   | 画面上の好きな位置にジャンプする [avy](#avy) の起動                     |
    | i   | counsel-imenu 起動。使ってない気がする                                  |
    | y   | [yasnippet](#yasnippet) 用の Hydra 起動                                 |
    | B   | [browse-at-remote](#browse-at-remote) で GitHub などのコード位置を開く  |
    | m   | [magit](#magit) を起動                                                  |
    | D   | 他の Window を消す                                                      |
    | W   | フレームサイズや位置を弄るための Hydra を起動。ほぼ使ってない           |
    | +   | [文字サイズ変更用 Hydra](#text-scale) の起動                            |
    | w   | Window の入替                                                           |
    | SPC | [major-mode-hydra](https://github.com/jerrypnz/major-mode-hydra.el) の起動 |
    | s   | [ON/OFF 切替系の Hydra](#toggle-switches) を起動する                    |
    | c   | counsel-org-capture を呼び出す                                          |
    | o   | org-mode 用の Hydra を起動する                                          |
    | e   | el-get 用の Hydra を起動する                                            |
    | t   | [第一階層には入れてないけどまあまあ便利なコマンドを詰めた Hydra](#sub-tools) を起動する |


### ido-mode {#ido-mode}


#### 概要 {#概要}

Emacs に標準添付の補完インターフェース。
ivy 使ってるからこれ有効化している意味がない気はする。

拡張入れてない段階でもこいつを有効にしていると
find-file とかが楽になって良い。


#### 有効化 {#有効化}

とりあえず昔からずっと有効化している

```emacs-lisp
(ido-mode 1)
```


#### 設定 {#設定}

ファイル名の補完とかを曖昧一致を有効にするっぽいい。

```emacs-lisp
(setq ido-enable-flex-matching t)
```


#### その他 {#その他}

<https://qiita.com/tadsan/items/33ebb8db2271897a462b> に書いていることだけど

-   ido-everywhere を有効にするとファイル名とバッファ切替以外にも使えるようになるらしい
-   smex 入れると M-x が強化される
-   ido-ubiquitous を入れると ido-everywhere よりもさらに色々な他に使えるらしい
-   ido-vertical-mode を入れたら候補が縦並びになって便利っぽい


### ivy {#ivy}


#### 概要 {#概要}


#### インストール {#インストール}

el-get を使って GitHub のリポジトリから直で入れている。

```emacs-lisp
(el-get-bundle abo-abo/swiper) ;; ivy, swiper, counsel が同時に入って来る
```

MELPA 経由だと org-mode 関係のパッケージ周りでハマったことがあるので
GitHub から直で入れる運用にしている。

が、やっぱり MELPA とかに寄せるべきかなって気になってきているところだったりもする。


#### なんか設定 {#なんか設定}

便利に使えるようにするための設定を書いている。が、何を設定しているのかよく覚えてないので今度調べておこう……

```emacs-lisp
(when (require 'ivy nil t)
  ;; M-o を ivy-dispatching-done-hydra に割り当てる．
  (require 'ivy-hydra)

  ;; `ivy-switch-buffer' (C-x b) のリストに recent files と bookmark を含める．
  (setq ivy-use-virtual-buffers t)

  ;; ミニバッファでコマンド発行を認める
  (when (setq enable-recursive-minibuffers t)
	(minibuffer-depth-indicate-mode 1)) ;; 何回層入ったかプロンプトに表示．

  ;; ESC連打でミニバッファを閉じる
  (define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)

  ;; (index/総数) 表示で何番目の候補かわかりやすくする
  (setq ivy-count-format "(%d/%d) ")

  ;; アクティベート
  (ivy-mode 1))
```


#### counsel の有効化 {#counsel-の有効化}

counsel は ivy で提供されているやつで、既存の Emacs のコマンドを置き換えてくれるやつ。

とても便利なので当然有効にしている。

```emacs-lisp
(counsel-mode 1)
```


#### ivy-posframe {#ivy-posframe}

ivy-posframe は ivy を posframe で表示してくれるようにするやつ。
posframe 表示だと Emacs の中央に表示できるので視線移動が少なく済んで便利。

```emacs-lisp
(el-get-bundle ivy-posframe)
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
(ivy-posframe-mode 1)
```


#### ivy-rich {#ivy-rich}

ivy-rich は ivy の見た目をよりモダンにしてくれるやつ。なんだけど、オフにした時の表示どんな感じだったか忘れたな……。

<!--list-separator-->

-  インストール

    ```emacs-lisp
    (el-get-bundle ivy-rich)
    ```

<!--list-separator-->

-  アイコン設定

    いい感じにアイコンが表示されるように
    <https://ladicle.com/post/config/#ivy> に書かれている関数を丸コピしてきた

    ```emacs-lisp
    (defun ivy-rich-file-icon (candidate)
      "Display file icons in `ivy-rich'."
      (when (display-graphic-p)
    	(let ((icon (if (file-directory-p candidate)
    					(cond
    					 ((and (fboundp 'tramp-tramp-file-p)
    						   (tramp-tramp-file-p default-directory))
    					  (all-the-icons-octicon "file-directory"))
    					 ((file-symlink-p candidate)
    					  (all-the-icons-octicon "file-symlink-directory"))
    					 ((all-the-icons-dir-is-submodule candidate)
    					  (all-the-icons-octicon "file-submodule"))
    					 ((file-exists-p (format "%s/.git" candidate))
    					  (all-the-icons-octicon "repo"))
    					 (t (let ((matcher (all-the-icons-match-to-alist candidate all-the-icons-dir-icon-alist)))
    						  (apply (car matcher) (list (cadr matcher))))))
    				  (all-the-icons-icon-for-file candidate))))
    	  (unless (symbolp icon)
    		(propertize icon
    					'face `(
    							:height 1.1
    							:family ,(all-the-icons-icon-family icon)
    							))))))
    ```

<!--list-separator-->

-  switch-buffer でのアイコン表示

    公式に書かれてるように設定することでバッファを切り替える時もアイコンが表示されるようにしている。
    <https://github.com/Yevgnen/ivy-rich#how-i-can-add-icons-for-ivy-switch-buffer>

    ```emacs-lisp
    (defun ivy-rich-switch-buffer-icon (candidate)
      (with-current-buffer
    	  (get-buffer candidate)
    	(let ((icon (all-the-icons-icon-for-mode major-mode)))
    	  (if (symbolp icon)
    		  (all-the-icons-icon-for-mode 'fundamental-mode)
    		icon))))
    ```

<!--list-separator-->

-  yank-pop の区切り設定

    yank-pop の区切りをちょっと長めにしている。長い方が区切りだってわかりやすいので。

    ```emacs-lisp
    (setq counsel-yank-pop-separator "\n--------------------\n")
    ```

<!--list-separator-->

-  ivy-rich の表示設定

    それぞれのカラムがどのぐらいの幅、みたいな設定をコマンド毎に設定できるようになっている。

    ```emacs-lisp
    (setq ivy-rich-display-transformers-list
    	  '(ivy-switch-buffer
    		(:columns
    		 ((ivy-rich-switch-buffer-icon :width 2)
    		  (ivy-rich-candidate (:width 30))
    		  (ivy-rich-switch-buffer-size (:width 7))
    		  (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
    		  (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
    		  (ivy-rich-switch-buffer-project (:width 15 :face success))
    		  (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
    		 :predicate
    		 (lambda (cand) (get-buffer cand)))
    		counsel-M-x
    		(:columns
    		 ((counsel-M-x-transformer (:width 40))  ; thr original transformer
    		  (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))  ; return the docstring of the command
    		counsel-find-file
    		(:columns
    		 ((ivy-rich-file-icon)
    		  (ivy-rich-candidate)))
    		counsel-recentf
    		(:columns
    		 ((ivy-rich-file-icon)
    		  (ivy-rich-candidate (:width 110))))
    		))
    ```

    <!--list-separator-->

    -  switch-buffer

        以下のような構成になっている。

        | 列名    | 幅 | 内容                           |
        |-------|---|------------------------------|
        | アイコン | 2  | all-the-icons のアイコン表示幅の設定 |
        | 候補名  | 30 | 選択候補名。バッファ名が表示される。 |
        | バッファサイズ | 7  | 容量を示す。120.3k みたいな表示になる |
        | インジケータ | 4  | 保存されてるかなどの表示。正直マーク何が何かわかってない |
        | メジャーモード | 12 | そのバッファのメジャーモード。Org とか表示されたりする |
        | プロジェクト名 | 15 | プロジェクト名の表示。.git があるフォルダ名が大体出てる |
        | ファイルパス | 可変 | プロジェクト内でのファイル位置の表示 |

        正直ファイル名以外あんまり気にしたことがない……。

    <!--list-separator-->

    -  M-x

        コマンド選択時のやつは以下の構成になっている。

        | 列名  | 幅   | 内容                             |
        |-----|-----|--------------------------------|
        | コマンド名 | 40   | 候補となるコマンド名の表示       |
        | 概要  | 制限なし | コマンドの概要。docstring の1行目が表示されてるっぽい |

    <!--list-separator-->

    -  find-file

        | 列名  | 幅  | 内容                        |
        |-----|----|---------------------------|
        | アイコン | 未設定 | all-the-icons のアイコン表示 |
        | ファイル名 | 未設定 | カレントディレクトリ内のファイルが候補として表示される |

    <!--list-separator-->

    -  recentf

        | 列名  | 幅  | 内容                  |
        |-----|----|---------------------|
        | アイコン | 未設定 | all-the-icons のアイコン表示 |
        | ファイル名 | 110 | 最近使われたファイルが候補として表示される |

        もうちょっと追加で情報表示できると便利かも。

<!--list-separator-->

-  ivy-rich-mode の有効化

    ```emacs-lisp
    (ivy-rich-mode 1)
    ```

<!--list-separator-->

-  C-s で migemo れるように ivy-migemo を導入・設定

    swiper は標準だと migemo れないのだが

    <https://github.com/ROCKTAKEY/ivy-migemo>

    でそれをできるようにした。

    <!--list-separator-->

    -  インストール

        ```emacs-lisp
        (:name ivy-migemo
        	   :website "https://github.com/ROCKTAKEY/ivy-migemo"
        	   :description "Use migemo on ivy."
        	   :type github
        	   :pkgname "ROCKTAKEY/ivy-migemo")
        ```

        でレシピを用意して

        ```emacs-lisp
        (el-get-bundle ivy-migemo)
        ```

        で入れている。

    <!--list-separator-->

    -  キーバインドの設定

        以下を入れておくと migemo を使ったり fuzzy を使ったりを切り替えられるようなのでとりあえず設定している。

        ```emacs-lisp
        (define-key ivy-minibuffer-map (kbd "M-f") #'ivy-migemo-toggle-fuzzy)
        (define-key ivy-minibuffer-map (kbd "M-m") #'ivy-migemo-toggle-migemo)
        ```

        なおこれは公式に記載されている設定である。

    <!--list-separator-->

    -  デフォルトで migemo を有効にする

        swiper を使う時はデフォで有効になっててほしいのでその設定も入れている。なおこれも公式ページに記述されている設定である。

        ```emacs-lisp
        (setq ivy-re-builders-alist '((t . ivy--regex-plus)
        							  (swiper . ivy-migemo--regex-plus)
        							  (counsel-find-file . ivy-migemo--regex-plus)))
        ```

        また fuzzy matchi を有効にする設定も記載されているがそちらは自分は設定していない。なんとなく。


#### counsel-osx-app. <span class="tag"><span class="improvement">improvement</span></span> {#counsel-osx-app-dot}

Mac で Emacs を使ってる時に ivy でアプリケーションを起動するためのパッケージ。

```emacs-lisp
(el-get-bundle counsel-osx-app)
```

Mac を使ってる時は Emacs がランチャー代わりになるので便利。

WSL 使ってる時に同じようなことをしてみたいんだけどどうしたらいいんだろう。まあできなくてもいいんだけど、このパッケージは Mac でだけ読むようにしたら良いよねって感じではある。


#### ivy-migemo {#ivy-migemo}

Kibela の記事を ivy で絞り込んで Emacs から開けるようにするために
[ivy-kibela](https://github.com/mugijiru/ivy-kibela) という自作ツールを使っている

<!--list-separator-->

-  インストール

    以下のレシピを用意して

    ```emacs-lisp
    (:name ivy-kibela
    	   :website "https://github.com/mugijiru/ivy-kibela"
    	   :description "Ivy interface to kibela."
    	   :type github
    	   :pkgname "mugijiru/ivy-kibela")
    ```

    ```emacs-lisp
    (el-get-bundle ivy-kibela)
    ```

    を設定ファイルに書いておけば OK

<!--list-separator-->

-  有効化

    今のところ明示的に require しないといけない。
    ivy が読まれてから読まれて欲しいので、以下のように設定している。

    ```emacs-lisp
    (with-eval-after-load 'ivy
      (require 'ivy-kibela))
    ```

<!--list-separator-->

-  設定

    README に従い `ivy-kibela-team` と `ivy-kibela-access-token` を設定してあげれば OK。自分は authinfo を使ってるのでそれ経由で値を取得している。

    ```emacs-lisp
    (custom-set-variables
     '(ivy-kibela-team (plist-get (nth 0 (auth-source-search :host "kibe.la")) :team))
     '(ivy-kibela-access-token (funcall (plist-get (nth 0 (auth-source-search :host "kibe.la" :max 1)) :secret))))
    ```

<!--list-separator-->

-  ivy-migemo の有効化

    ivy-kibela でも migemo りたかったので、以下のようにして migemo でも使えるようにしている

    ```emacs-lisp
    (with-eval-after-load 'ivy-kibela
      (add-to-list 'ivy-re-builders-alist '(ivy-kibela . ivy-migemo--regex-plus) t))
    ```


#### prescient.el {#prescient-dot-el}

[prescient.el](https://github.com/raxod502/prescient.el) は強力なソート・フィルタ機能を提供してくれるパッケージ。
ivy などの絞り込み系ツールと組み合わせて使う。

とりあえずいつも通り el-get でインストールしている。

```emacs-lisp
(el-get-bundle prescient.el)
```

レシピは自前で追加している

```emacs-lisp
(:name raxod502/prescient.el
	   :website "https://github.com/raxod502/prescient.el"
	   :description "simple but effective sorting and filtering for Emacs."
	   :type github
	   :pkgname "raxod502/prescient.el")
```

そんで ivy でそれが使われるように ivy-prescient-mode を有効にしている。

```emacs-lisp
(ivy-prescient-mode 1)
```

ただ候補文字列の長さで sort されるのはどうも微妙さを感じるので無効にしている。

```emacs-lisp
(setq prescient-sort-length-enable nil)
```

どうやら company-mode でも使えるらしいので設定は別のところに分離した方がいいかもしれない。


### mode-line {#mode-line}


#### 概要 {#概要}

Emacs のバッファ下部に表示されるモードライン関連の設定をここにまとめている。このメニューの並びとかはどこかで直した方が良さそう。


#### hide-mode-line {#hide-mode-line}

[hide-mode-line](https://github.com/hlissner/emacs-hide-mode-line) は mode-line を隠してくれるパッケージ。ここでは neotree-mode-hook で引っ掛けて Neotree では mode-line を隠すように設定している

```emacs-lisp
(el-get-bundle hlissner/emacs-hide-mode-line)
(add-hook 'neotree-mode-hook #'hide-mode-line-mode)
```

他にも mode-line の表示が不要なモードとかってありそうだけど特に思い付かないから今のところ Neotree 専用になっている。


#### 日時を mode-line で表示する {#日時を-mode-line-で表示する}

mode-line に日時も表示されてる方が便利な気がしてとりあえず表示している。表示形式は24時間表記。「午前」とか「午後」とかの表示邪魔だしね。

```emacs-lisp
(custom-set-variables '(display-time-24hr-format t))
(display-time-mode 1)
```


#### smart-mode-line 関連の設定 <span class="tag"><span class="unused">unused</span></span> {#smart-mode-line-関連の設定}

[smart-mode-line](https://github.com/Malabarba/smart-mode-line) は mode-line をセクシーな感じにしてくれるパッケージ。というわけで昔入れていたけどもう使ってない。一応コードの残骸があったから一旦残しておく。

多分アイコン表示周りをゴリゴリ設定するのがだるくなって doom-modeline に乗り換えたんだと思う。

```emacs-lisp
;; (el-get-bundle smart-mode-line)
;; (defvar sml/no-confirm-load-theme t)
;; (defvar sml/theme 'dark)
;; (sml/setup)

;; major-mode
;; (add-hook 'emacs-lisp-mode-hook (lambda () (setq mode-name (all-the-icons-fileicon "elisp"))))
;; (add-hook 'enh-ruby-mode-hook (lambda () (setq mode-name (concat "e" (all-the-icons-alltheicon "ruby-alt")))))
;; (add-hook 'ruby-mode-hook (lambda () (setq mode-name (all-the-icons-alltheicon "ruby-alt"))))
;; (add-hook 'vue-mode-hook (lambda ()
;;                            (make-local-variable 'mmm-submode-mode-line-format)
;;                            (setq mmm-submode-mode-line-format "~M:~m")
;;                            (make-local-variable 'mmm-buffer-mode-display-name)
;;                            (setq mmm-buffer-mode-display-name "V")))
;; (add-hook 'js-mode-hook (lambda () (setq mode-name "")))
;; (add-hook 'pug-mode-hook (lambda () (setq mode-name (all-the-icons-fileicon "pug"))))
;; (add-hook 'css-mode-hook (lambda () (setq mode-name (all-the-icons-faicon "css3"))))
;; (add-hook 'twittering-mode-hook (lambda () (setq mode-name (all-the-icons-faicon "twitter-square"))))
;; (add-hook 'org-mode-hook (lambda () (setq mode-name (all-the-icons-fileicon "org"))))
```


#### diminish {#diminish}

[diminish](https://github.com/emacsmirror/diminish) は minor-mode の表示をカスタマイズするためのモード。

これも昔使ってたけど今は使ってない。というか最近はマイナーモードを mode-line で表示してない。表示しなくなったから要らなくなった感じ。

<!--list-separator-->

-  インストール・有効化

    el-get-bundle で入れて require したら有効になる

    ```emacs-lisp
    (el-get-bundle diminish)
    (require 'diminish)
    ```

<!--list-separator-->

-  マクロ定義

    各パッケージが読まれた後に指定した表示が設定されるようにするマクロを書いている。

    ```emacs-lisp
    (defmacro my/diminish (file mode &optional new-name)
      "https://github.com/larstvei/dot-emacs/blob/master/init.org"
      `(with-eval-after-load ,file
    	 (diminish ,mode ,new-name)))
    ```

    <https://github.com/larstvei/dot-emacs/blob/master/init.org>
    に書かれているのを流用しただけであるはずだが、リンク先にその記述が見当たらないな……。

<!--list-separator-->

-  マイナーモード毎の表示指定

    上で用意したマクロを用いて各マイナーモード毎の設定を行っていた。今は使ってないので全部コメントアウトしている

    ```emacs-lisp
    ;; (my/diminish "git-gutter" 'git-gutter-mode (all-the-icons-octicon "git-compare"))
    ;; (my/diminish "yasnippet" 'yas-minor-mode " Ys")
    ;; (my/diminish "whitespace" 'whitespace-mode "◽")
    ;; (my/diminish "whitespace" 'global-whitespace-mode "◽")
    ;; (my/diminish "tempbuf" 'tempbuf-mode "")
    ;; (my/diminish "flycheck" 'flycheck-mode "")
    ;; (my/diminish "zoom" 'zoom-mode "")
    ;; (my/diminish "rainbow" 'rainbow-mode "🌈")
    ;; (my/diminish "projectile-rails" 'projectile-rails-mode "🛤")
    ;; (my/diminish "company" 'company-mode "")
    ;; (my/diminish "ElDoc" 'eldoc-mode "")
    ```

    結構頑張ったけど絵文字周りで思うような表示にならなかったりして最終的にはマイナーモードを mode-line に表示しないようになっている。

    使ってる minor-mode どうやって把握したりしたらいいんだろうね。ま、表示されなくてもなんとなくで把握しているから、困ってはいないんだけど。


#### doom-modeline {#doom-modeline}

[doom-modeline](https://github.com/seagle0128/doom-modeline) は Emacs の mode-line を装飾するパッケージの1つ。結構スッキリした見た目になるので気に入ってる。

<!--list-separator-->

-  インストール

    いつも通り el-get で入れてるだけ

    ```emacs-lisp
    (el-get-bundle doom-modeline)
    ```

<!--list-separator-->

-  有効化

    ```emacs-lisp
    (doom-modeline-mode 1)
    ```

<!--list-separator-->

-  VCS 用表示の長さ変更

    デフォルトだと 12 なんだけどそれだと短かくて何のブランチかよくわからんので
    30 まえのばしている。

    ```emacs-lisp
    (setq doom-modeline-vcs-max-length 30)
    ```

<!--list-separator-->

-  バッテリー残量表示

    これは doom-modeline 専用の設定ではないけど
    doom-modeline で見た目をカッコよくしているのでこっちに設定を書いている。

    ```emacs-lisp
    (display-battery-mode 1)
    ```

<!--list-separator-->

-  その他

    `doom-modeline-github` を t にしたら GitHub の通知数も表示されるらしいがちょっと試しに t にしているけどどうも表示されない。

    あとはメジャーモード名はアイコンの方があるから消したいな。
    `doom-modeline-def-modeline` で自分用に作れば良さそうな雰囲気はある


#### その他 {#その他}

多分 mode-line 周りはもうちょっと整理した方が設定は読み易いんだろうなという気がしている


### Neotree <span class="tag"><span class="replacement">replacement</span></span> {#neotree}


#### 概要 {#概要}

[Neotree](https://github.com/jaypei/emacs-neotree) は Emacs でフォルダのツリー表示ができるやつ。メンテは活発じゃないようなので、その内乗り換えたい。


#### レシピ {#レシピ}

Neotree でメンテされているのは dev ブランチだけど
el-get の公式のレシピでは master ブランチを見ているので自前で recipe を用意してそれを使っている。

```emacs-lisp
(:name emacs-neotree-dev
	   :website "https://github.com/jaypei/emacs-neotree"
	   :description "An Emacs tree plugin like NerdTree for Vim."
	   :type github
	   :branch "dev"
	   :pkgname "jaypei/emacs-neotree")
```


#### インストール {#インストール}

上に書いたレシピを使ってインストールしている。

```emacs-lisp
(el-get-bundle emacs-neotree-dev)
```


#### 使わなくなったコード {#使わなくなったコード}

元々設定していたが、
counsel-projectile を使ってると
projectile-switch-project-action を設定していても反映されず意味がないのに気付いたので使わなくなった

<https://github.com/mugijiru/.emacs.d/pull/183/files#r541843206>

```emacs-lisp
(setq projectile-switch-project-action 'neotree-projectile-action)
```


#### テーマの設定 {#テーマの設定}

GUI で起動している時はアイコン表示しそうでない場合は ▾ とかで表示する

```emacs-lisp
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
```

のだけど、実際に今使ってるやつだともっとグラフィカルな表示なので
all-the-icons の設定で上書きしている気がするので要確認


#### major-mode-hydra {#major-mode-hydra}

いちいちキーバインドを覚えてられないので
[major-mode-hydra](https://github.com/jerrypnz/major-mode-hydra.el) を使って主要なキーバインドは [hydra](https://github.com/abo-abo/hydra) で使えるようにしている。

とはいえ、この文書を書く前日ぐらいに設定しているのでまだ使い慣れてないというか、ほとんど使えてない。

```emacs-lisp
(with-eval-after-load 'major-mode-hydra
  (major-mode-hydra-define neotree-mode (:separator "-" :quit-key "q" :title (concat (all-the-icons-octicon "list-unordered") " Neotree"))
	("Nav"
	 (("u"   neotree-select-up-node   "Up")
	  ("g"   neotree-refresh          "Refresh")
	  ("Q"   neotree-hide             "Hide"))

	 "File"
	 (("a"   neo-open-file-ace-window "Ace")
	  ("N"   neotree-create-node      "Create")
	  ("R"   neotree-rename-node      "Rename")
	  ("C"   neotree-copy-node        "Copy")
	  ("D"   neotree-delete-node      "Delete")
	  ("SPC" neotree-quick-look       "Look")
	  ;; ("d" neo-open-dired "Dired")
	  ;; ("O" neo-open-dir-recursive   "Recursive")
	  )
	 "Toggle"
	 (("z" neotree-stretch-toggle     "Size"        :toggle (not (neo-window--minimize-p)))
	  ("h" neotree-hidden-file-toggle "Hidden file" :toggle neo-buffer--show-hidden-file-p)))))
```

<!--list-separator-->

-  キーバインド

    <!--list-separator-->

    -  ナビゲーション

        | Key | 効果        |
        |-----|-----------|
        | u   | 上のノードに移動 |
        | g   | 再描画      |
        | Q   | Neotree を隠す |

    <!--list-separator-->

    -  ファイル操作

        | Key | 効果                                     |
        |-----|----------------------------------------|
        | a   | ファイルを開く。その際に ace-window で開く window を指定する |
        | N   | 新しいノードを作る                       |
        | R   | ノードの名前を変える                     |
        | C   | ノードのコピー                           |
        | D   | ノードの削除                             |
        | SPC | クイックルック                           |

    <!--list-separator-->

    -  Toggle

        | Key | 効果                      |
        |-----|-------------------------|
        | z   | Neotree のサイズを大きくしたり小さくしたり |
        | h   | 隠しファイルを表示したり隠したり |


### posframe {#posframe}


#### 概要 {#概要}

[posframe](https://github.com/tumashu/posframe) は child frame を表示させるためのパッケージ。
Emacs のど真ん中に表示したり、今あるカーソル位置のすぐそばに出したりできる。

ivy なんかを使う時に [ivy-posframe](https://github.com/tumashu/ivy-posframe) ど真ん中に出すと、いつもそこに表示されるし真ん中なの視線移動が少なくて済むし
[ddskk-posframe](https://github.com/conao3/ddskk-posframe.el) なんかで変換候補をカーソル位置のそばに出て来るので一般的な日本語変換ソフトと同様にこれまた視線移動が少なくて便利。

という感じで色々なものの拡張として使わているやつ。


#### インストール {#インストール}

いつも通り el-get で入れているだけ。

```emacs-lisp
(el-get-bundle posframe)
```

こいつ自体には特に設定を入れてない。というか設定項目自体2個しか存在していない。

ま、こいつ単体で使うものでもないしね。


### show-paren-mode {#show-paren-mode}


#### 概要 {#概要}

[show-paren-mode](https://www.emacswiki.org/emacs/ShowParenMode) は Emacs に標準で入っているやつで開き括弧と閉じ括弧の対応を示してくれたり括弧の中身を強調表示したりする機能を提供してくれるやつ。


#### 有効化 {#有効化}

デフォで入ってるので以下のようにするだけで有効化される。

```emacs-lisp
(show-paren-mode 1)
```

デフォ設定だと対応する括弧を強調表示するだけだけどまあそれで悪くないと思ってるので今のところデフォルト設定のままである。


#### その他 {#その他}

<http://syohex.hatenablog.com/entry/20110331/1301584188>

の記事へのリンクを設定ファイルの中に残していたけど設定は特に弄ってないのでまたその記事読んだりで設定弄ってみてもいいかもしれない。

また smartparens.el にも似た機能はあるようだけど
Emacs 標準機能の方が軽そうなのでとりあえずこのままにするつもり。


### toolbar {#toolbar}


#### 概要 {#概要}

Emacs 標準の toolbar の設定。麦汁さんは使わないし幅を取るので隠す派。


#### 設定 {#設定}

単に無効にして隠している

```emacs-lisp
(tool-bar-mode -1)
```


### uniquify {#uniquify}


#### 概要 {#概要}

同じ名前のファイルを開いている時に祖先のディレクトリ名を表示してくれてどこのファイルかわかりやすくしてくれるやつ。

すぐ親とかも同名でも、名前が違うところまで遡って表示してくれる。


#### 有効化 {#有効化}

Emacs に標準で入ってるので require するだけで有効にできる

```emacs-lisp
(require 'uniquify)
```


#### 設定 {#設定}

自分は `ファイル名<フォルダ名>` みたいな表示になる形式にしている。その方がファイル名が主という感じになって使いやすそうだなって。

そういう意味では `post-foward` の方が幅を使わない分良いかもしれない。いつか検討しても良いかもしれない。

```emacs-lisp
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
```


### yascroll {#yascroll}


#### 概要 {#概要}

[yascroll](https://github.com/emacsorphanage/yascroll) は標準のスクロールバーとは異なるスクロールバーを表示するやつ。

デフォルトだと右側の fringe 領域に表示するのであまり邪魔にならないし表示領域を必要以上に狭めないので気に入っている。

最初に作られたっぽい記事は
[主張しないスクロールバーモード、yascroll.elをリリースしました - Functional Emacser](https://m2ym.hatenadiary.org/entry/20110401/1301617991)
にある。タイトル通り、あまり主張しない感じで良い。


#### インストール {#インストール}

いつも通り el-get でインストールしている

```emacs-lisp
(el-get-bundle yascroll)
```

これだけで大体いい感じに表示されるので便利。たまに表示されなくなることもあるが、まあそこまで重要なやつでもないのであまり気にしていない


### zoom {#zoom}


#### 概要 {#概要}

[zoom](https://github.com/cyrus-and/zoom) はフォーカスが当たっている Window が大きく表示されるようにするやつ。最近流行りのビデオチャットツールではない。

どこにフォーカスが当たっているかわかりやすくなるし、狭い画面でも見たい部分を広げて表示できるので便利。


#### インストール {#インストール}

いつも通り el-get から入れる。
GitHub から直接取得するように設定している。

```emacs-lisp
(el-get-bundle cyrus-and/zoom)
```


#### 設定 {#設定}

起動時に有効化
: 1画面しか使えない時は必須なので

比率を黄金比に変更
: この方が使いやすいっぽい。

という設定をしている。

```emacs-lisp
(custom-set-variables
 '(zoom-mode t)
 '(zoom-size '(0.618 . 0.618)))
```


### zoom-window {#zoom-window}


#### 概要 {#概要}

[zoom-window](https://github.com/emacsorphanage/zoom-window) は tmux の prefix z のような動きをするやつ。表示している window をフレーム全体に広げたり戻したりすることができる。


#### インストール {#インストール}

いつも通り el-get から入れている

```emacs-lisp
(el-get-bundle zoom-window)
```


#### その他 <span class="tag"><span class="improvement">improvement</span></span> {#その他}

キーバインドは 80-global-keybinds に書いたけど
`C-x 1` に割り当てている。

ただそれだと tmux と使い勝手が違うなって感じているのでそのうち hydra の中の z にでもアサインしようかと思う。

あと、その window を最大化して戻すことよりも単に他の window が邪魔なことの方が多い気もしている。。。


## ナビゲーション {#ナビゲーション}


### ナビゲーション {#_index}

ここではカーソル移動やファイル移動などのナビゲーション系の設定を記載していく

[ace-window](#ace-window)
: 3つ以上にウインドウを分割している際のウインドウ切替を楽にしてくれるパッケージ

[avy](#avy)
: 表示されてるところの好きな場所にさくっとジャンプするためのパッケージ

[browse-at-remote](#browse-at-remote)
: 表示している行の GitHub などのサービス上の位置でブラウザで開いてくれるパッケージ

[dumb-jump](#dumb-jump)
: カーソル下の関数とかの定義場所にジャンプしてくれるパッケージ

[projectile](#projectile)
: プロジェクト内のファイルなどを開いたりするのに便利なパッケージ


### ace-window {#ace-window}


#### 概要 {#概要}

Window 間の移動を ace-jump や avy のように表示されてる文字の Window に移動するやつ。

Window が2分割の時は文字も出ないで別の Window に移動してくれる。

`C-x o` にデフォルトで設定されている `other-window` は別の window に順番に移動するコマンドなので大量に分割していると移動がしんどいのだが
ace-window を使うと起動して 1 ストロークで移動できるので
`C-x o` をデフォルトの `other-window` から `ace-window` そのまま置き換えても便利に使える。


#### インストール {#インストール}

いつも通り el-get でインストールしている。

```emacs-lisp
(el-get-bundle ace-window)
```


#### 設定 {#設定}

キーバインドは別の箇所で定義しているが
`C-x o` で ace-window が起動するようにしている。

また Hydra からは ace-swap-window が起動できるようにしている。

ace-window には色々な機能があるからそれ用の Hydra を別途定義してもいいかもしれない。


### avy {#avy}


#### 概要 {#概要}

[avy](https://github.com/abo-abo/avy) は好きな文字とか単語など、表示されてる場所にさくっとジャンプするためのパッケージ。
Vimium の f とかに似てる。


#### インストール {#インストール}

el-get で普通にインストールしている

```emacs-lisp
(el-get-bundle avy)
```


#### 設定 {#設定}

文字の上に重なると元の文字列がよくわからなくなるので、移動先の文字の前に表示するようにしている

```emacs-lisp
(setq avy-style 'pre)
```


#### キーバインド {#キーバインド}

グローバルなキーバインドを汚染したくなかったのでひとまず Hydra を定義している。

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define avy-hydra
	(:separator "-" :title "avy" :foreign-key warn :quit-key "q" :exit t)
	("Char"
	 (("c" avy-goto-char       "Char")
	  ("C" avy-goto-char-2     "Char 2")
	  ("x" avy-goto-char-timer "Char Timer"))

	 "Word"
	 (("w" avy-goto-word-1 "Word")
	  ("W" avy-goto-word-0 "Word 0"))

	 "Line"
	 (("l" avy-goto-line "Line"))

	 "Other"
	 (("r" avy-resume "Resume")))))
```

| Key | 効果            |
|-----|---------------|
| c   | 1文字からの絞り込み |
| C   | 2文字から絞り込み |
| x   | 任意の文字列からの絞り込み |
| w   | 1文字絞り込んで単語先頭に移動 |
| W   | 絞り込みなしの単語移動 |
| l   | 列移動          |
| r   | 繰り返し同じコマンドを実行 |


### browse-at-remote {#browse-at-remote}


#### 概要 {#概要}

[browse-at-remote](https://github.com/rmuslimov/browse-at-remote) は Emacs で見ているファイルについて
GitHub や GitLab などのサービス上での該当ブランチ、該当ファイル、該当行を開いてくれる便利なやつ。

業務だとレビュー中に「ここにこういう関数あるよ」みたいに示すことがあるけどその時に Emacs 内で関数を探して browse-at-remote で GitHub 上の位置を開くことでそこへのリンクを拾いやすく便利。


#### インストール {#インストール}

いつも透り el-get で入れている。

```emacs-lisp
(el-get-bundle browse-at-remote)
```


#### 使い方 {#使い方}

ブラウザで見たい行の上で `M-x browse-at-remote` を実行する。

または Region を選択している状態で実行すると、その範囲を選択している状態で開いてくれる。便利。


#### その他 {#その他}

Hydra でいつでも使えるようにキーバインドを割り当てている。


### dumb-jump {#dumb-jump}


#### 概要 {#概要}

[dumb-jump](https://github.com/jacktasia/dumb-jump) は関数とかの定義されてる場所にお手軽にジャンプできるようにするパッケージ。めっちゃ色々な言語をサポートしている。


#### インストール {#インストール}

いつも通り el-get でインストールしている。

```emacs-lisp
(el-get-bundle dumb-jump)
```


#### 設定 {#設定}

<!--list-separator-->

-  デフォルトプロジェクトの変更

    デフォルトだと `~/` がデフォルトプロジェクトらしいがそんなに上の階層から調べられてもしょうがない気がするのでソースコードを置いているフォルダを指定している。

    ```emacs-lisp
    (setq dumb-jump-default-project "~/projects")
    ```

<!--list-separator-->

-  複数マッチした時に使う絞り込み

    最近はできるだけ ivy を使うようにしているので
    dumb-jump でも ivy を使うように指定している。

    ```emacs-lisp
    (setq dumb-jump-selector 'ivy)
    ```


#### キーバインド {#キーバインド}

README に書いている hydra の設定をほぼパクってるけど
pretty-hydra を使ってキーを定義している

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define dumb-jump-pretty-hydra
	(:foreign-keys warn :title "Dumb jump" :quit-key "q" :color blue :separator "-")
	("Go"
	 (("j" dumb-jump-go "Jump")
	  ("o" dumb-jump-go-other-window "Other window"))

	 "External"
	 (("e" dumb-jump-go-prefer-external "Go external")
	  ("x" dumb-jump-go-prefer-external-other-window "Go external other window"))

	 "Lock"
	 (("l" dumb-jump-quick-look "Quick look"))

	 "Other"
	 (("b" dumb-jump-back "Back")))))
```

| Key | 効果                                        |
|-----|-------------------------------------------|
| j   | 定義場所にジャンプ                          |
| o   | 定義場所を別 window で開く                  |
| e   | 定義場所にジャンプ。ただし同じファイルより外部ファイルとのマッチを優先 |
| x   | 定義場所を別 window で開く。ただし同じファイルより外部ファイルとのマッチを優先 |
| l   | クイックルック。定義をツールチップ表示する  |
| b   | 最後にジャンプされた場所に戻る。今は既に obsolute 扱い |


### projectile {#projectile}


#### 概要 {#概要}

[projectile](https://github.com/bbatsov/projectile) はプロジェクト内のファイルを検索したりするのに便利なパッケージ


#### インストール {#インストール}

いつも通り el-get からインストールする

```emacs-lisp
(el-get-bundle projectile)
```


#### 有効化 {#有効化}

このあたりで有効化しておいている。この順序に意味があったかは忘れた……。

```emacs-lisp
(projectile-mode)
```


#### 無視リスト {#無視リスト}

普段 Rails ばっかりやってるのでそれ関係のものを無視リストに入れている。けどあんまりメンテしてない。

<!--list-separator-->

-  無視するディレクトリ

    ```emacs-lisp
    (add-to-list 'projectile-globally-ignored-directories "tmp")
    (add-to-list 'projectile-globally-ignored-directories ".tmp")
    (add-to-list 'projectile-globally-ignored-directories "vendor")
    (add-to-list 'projectile-globally-ignored-directories ".sass-cache")
    (add-to-list 'projectile-globally-ignored-directories "coverage")
    (add-to-list 'projectile-globally-ignored-directories "cache")
    (add-to-list 'projectile-globally-ignored-directories "log")
    ```

    node_modules もここに突っ込んでも良いかもしれない。

<!--list-separator-->

-  無視するファイル

    ```emacs-lisp
    (add-to-list 'projectile-globally-ignored-files "gems.tags")
    (add-to-list 'projectile-globally-ignored-files "project.tags")
    (add-to-list 'projectile-globally-ignored-files "manifest.json")
    ```

    tags ファイルは昔は使っていたけど、最近は dumb-jump が優秀なのと、面倒で使ってないのでそろそろ gems.tags と project.tags は不要かもしれない。


#### ivy/counsel との連携 {#ivy-counsel-との連携}

上の方で helm との連携処理を入れていたが今は大体 ivy に乗り換えているので ivy 連携もしている。

```emacs-lisp
(setq projectile-completion-system 'ivy)
(el-get-bundle counsel-projectile)
```

counsel-projectile はいくつかの絞り込み処理を提供してくれて便利。それでも足りなかったら自前で何か作ることになるのかなと思っている。


#### キーバインド {#キーバインド}

デフォルトでいくつかのキーバインドが用意されてるようだけどそんなものさっぱり覚えられないのでとりあえずいくつかを Hydra で叩けるようにしている

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define
	projectile-hydra (:separator "-" :title "Projectile" :foreign-key warn :quit-key "q" :exit t)
	("File"
	 (("f" counsel-projectile-find-file "Find File")
	  ("d" counsel-projectile-find-dir "Find Dir")
	  ("r" projectile-recentf "Recentf"))

	 "Other"
	 (("p" (counsel-projectile-switch-project 'neotree-dir) "Switch Project")))))
```

| Key | 効果                    |
|-----|-----------------------|
| f   | プロジェクト内のファイルを検索 |
| d   | プロジェクト内のフォルダを検索 |
| r   | プロジェクト内で最近触ったファイルのリスト表示 |
| p   | 別のプロジェクトに切り替え |

-   `projectile-find-implementation-or-test`
-   `projectile-replace`
-   `projectile-replace-regxp`

あたりも使えるようにするともしかしたら便利かもしれない。あとは `counsel-projectile-grep` とかの類か。


#### その他 {#その他}

基本的に Rails のプロジェクトをやっているので
projectile-rails をベースにいつも触ってるので projectile そのものはあまり弄ってないのであった


## プログラミング関係の設定 {#プログラミング関係の設定}


### プログラミング関係の設定 {#_index}

ここでは各言語やフレームワーク毎の設定をまとめている。
markdown-mode とか yaml-mode なんかはプログラム言語ではないけど面倒なので一旦ここにまとめている。

[emacs-lisp](#emacs-lisp)
: Emacs Lisp を書くための設定

[Ember.js](#ember-js)
: Web フロントエンド MVC フレームワークである Ember.js 用の設定を書いている

[es6](#es6)
: ES2015 以降の JS に関する設定。es6 としているのは過去の経緯のため。

[flycheck](#flycheck)
: Flycheck の設定について書いている

[gnuplot-mode](#gnuplot-mode)
: グラフ作成ソフト gnuplot を使うための設定

[lsp-mode](#lsp-mode)
: Emacs の LSP クライアントの一種である lsp-mode に関する設定

[markdown](#markdown)
: Markdown を書く時の設定

[plantuml-mode](#plantuml-mode)
: PlantUML を書く時のメジャーモードの設定

[rails](#rails)
: Rails 開発をする上での設定

[React.js](#react-js)
: React.js アプリを開発するための設定

[rspec-mode](#rspec-mode)
: Ruby のテストフレームワーク RSpec を書いたりするのに便利なモード

[ruby](#ruby)
: Ruby を書く上での設定

[scss](#scss)
: SCSS を書く上での設定

[TypeScript](#typescript)
: TypeScript を書く上での設定

[Vue.js](#vue-js)
: Vue.js を書く上での設定

[yaml-mode](#yaml-mode)
: YAML を書く時のメジャーモードの設定


### emacs-lisp {#emacs-lisp}


#### 概要 {#概要}

Emacs Lisp を書くための設定。まあそんなにしっかり書いてないので、あんまり設定は入ってない


#### Hook {#hook}

Hook 用の関数を定義してその中に色々書いている。

-   とりあえず行数表示が欲しいので display-line-numbers-mode を有効化
-   当然補完もしたいので company-mode を有効にしている
-   カッコの対応などもいい感じに動いて欲しいので smartparens-mode とその strict-mode を有効にしている

<!--listend-->

```emacs-lisp
(defun my/emacs-lisp-mode-hook ()
  (display-line-numbers-mode 1)
  (company-mode 1)
  (smartparens-mode 1)
  (turn-on-smartparens-strict-mode))
```

そんで最後にその関数を hook に突っ込んでる。

```emacs-lisp
(add-hook 'emacs-lisp-mode-hook 'my/emacs-lisp-mode-hook)
```


#### アイコン挿入コマンドの用意 {#アイコン挿入コマンドの用意}

時々 UI 設定目的で絵文字を使うことがあるので挿入できるコマンドを用意している。最近使った記憶ないけど。

```emacs-lisp
(defun my/insert-all-the-icons-code (family)
  (interactive)
  (let* ((candidates (all-the-icons--read-candidates-for-family family))
		 (prompt     (format "%s Icon: " (funcall (all-the-icons--family-name family))))
		 (selection  (completing-read prompt candidates nil t)))
	(insert "(all-the-icons-" (symbol-name family) " \"" selection "\")")))
```


#### キーバインド {#キーバインド}

emacs-lisp-mode 用に major-mode-hydra を設定している。けどそんなにしっかり Emacs Lisp を書いてるわけではないのがバレバレな感じである。

```emacs-lisp
(with-eval-after-load 'major-mode-hydra
  (major-mode-hydra-define emacs-lisp-mode (:separator "-" :quit-key "q" :title (concat (all-the-icons-fileicon "elisp") " Emacs Lisp"))
	("Describe"
	 (("F" counsel-describe-function "Function")
	  ("V" counsel-describe-variable "Variable"))

	 "Insert Icon Code"
	 (("@a" (my/insert-all-the-icons-code 'alltheicon) "All the icons")
	  ("@f" (my/insert-all-the-icons-code 'fileicon)   "File icons")
	  ("@F" (my/insert-all-the-icons-code 'faicon)     "FontAwesome")
	  ("@m" (my/insert-all-the-icons-code 'material)   "Material")
	  ("@o" (my/insert-all-the-icons-code 'octicon)    "Octicon")
	  ("@w" (my/insert-all-the-icons-code 'wicon)      "Weather")))))
```

| Key | 効果                    |
|-----|-----------------------|
| F   | 関数を調べる            |
| V   | 変数を調べる            |
| @a  | all-the-icon のアイコンを挿入 |
| @f  | fileicon のアイコンを挿入 |
| @F  | FontAwesome のアイコンを挿入 |
| @m  | Material Icons のアイコンを挿入 |
| @o  | Octicons のアイコンを挿入 |
| @w  | 天気アイコンを挿入      |


### Ember.js {#ember-js}


#### 概要 {#概要}

Ember.js 用の Emacs の拡張としては
`ember-mode` と `handlebars-mode` が存在する


#### ember-mode <span class="tag"><span class="unused">unused</span></span> {#ember-mode}

[ember-mode](https://github.com/madnificent/ember-mode) は
Ember.js アプリケーションのファイルナビゲーションや生成を行ってくれるモード。実は麦汁さんは使えてない。

インストールするだけではダメで、
ember-mode を明示的に起動しないといけない。

そのためには dir-locals を使うとか
projectile なんかがやってるようにフォルダ構成から判定させるみたいなことが必要そう。だるい。

というわけで死蔵中。

ついでにいうとキーバインドもだるい系なので使う時は Hydra を用意した方が良さそう

インストールは GitHub からできるが
el-get.lock を用いたバージョン更新確認スクリプトのためレシピを追加している

```emacs-lisp
(:name madnificent/ember-mode
	   :website "https://github.com/madnificent/ember-mode"
	   :description "Ember-mode speeds up navigation in EmberJS projects."
	   :type github
	   :pkgname "madnificent/ember-mode")
```

このレシピを用意した上で以下でインストール

```emacs-lisp
(el-get-bundle ember-mode)
```


#### handlebars-mode <span class="tag"><span class="improvement">improvement</span></span> {#handlebars-mode}

[handlebars-mode](https://github.com/danielevans/handlebars-mode) は Ember.js のテンプレートエンジンとして採用されている
Handlebars を書くためのモード。

syntax highlight と、いくつかの編集機能を備えている。が、今のところ麦汁さんは syntax highlight しか使えてない。

編集コマンドは [major-mode-hydra](https://github.com/jerrypnz/major-mode-hydra.el) で使えるようにしてあげれば良さそう

```emacs-lisp
(el-get-bundle handlebars-mode)
```


### es6 {#es6}


#### 概要 {#概要}

ES5 以前ではない JS を書くための設定。
es6 といいつつ ES2016(ES7) などもこの設定のまま書いている。

[sprockets-es6](https://github.com/TannerRogalsky/sprockets-es6) を使って ES6 対応をしていた時に
es6 という拡張子を使っていたのでこのファイル名になっている。


#### インストール {#インストール}

es6 はつまり JS なのでとりあえず el-get で js2-mode を入れている。

```emacs-lisp
(el-get-bundle js2-mode)
```


#### Hook {#hook}

-   flycheck を有効にしてリアルタイムに文法チェックをしている
    -   また `javascript-eslint` を使いたいので他2つは disable にしている
-   company-mode で補完できるようにしている
-   smartparens-strict-mode でカッコなどの入力補助をしている
-   インデントは空白2文字としている

<!--listend-->

```emacs-lisp
(defun my/js2-mode-hook ()
  (flycheck-mode 1)
  (setq flycheck-disabled-checkers '(javascript-standard javascript-jshint))

  (company-mode 1)
  (turn-on-smartparens-strict-mode)

  (setq js2-basic-offset 2))
```

という Hook 用関数を用意しておいて

```emacs-lisp
(add-hook 'js2-mode-hook 'my/js2-mode-hook)
```

という感じで js2-mode-hook に追加している。

Lambda で一括でやる方法もあるけども、関数名つけて分離しておくと中身を簡単に入れ替えられて便利。


#### es6 を js2-mode で扱うようにする {#es6-を-js2-mode-で扱うようにする}

```emacs-lisp
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
```


#### 他に気になるツール {#他に気になるツール}

<!--list-separator-->

-  xref-js2

    <https://github.com/js-emacs/xref-js2>

    コード間の移動が楽になるかもしれない。けど dumb-jump があるから別に要らない気もする

<!--list-separator-->

-  js2-refactor

    <https://github.com/js-emacs/js2-refactor.el>

    リファクタリングツール。キーバインドは覚えるのつらそうだから Hydra を用意する必要がありそう。

<!--list-separator-->

-  skewer-mode

    <https://github.com/skeeto/skewer-mode>

    Web ブラウザと連携して JS の評価をしたりとかしてくれたり一部の変更を反映してくれたりするらしい。

    保存したら自動リロードされる環境はともかくそうじゃない環境だと楽かもしねあい。

<!--list-separator-->

-  js-import

    <https://github.com/jakoblind/js-import>

    import を書くのを楽にしてくれるっぽい。

<!--list-separator-->

-  indium

    <https://github.com/NicolasPetton/indium>

    Node.js と連携してステップ実行とかができるようになるらしい。便利そう。


### flycheck {#flycheck}


#### 概要 {#概要}

[flycheck](https://www.flycheck.org/en/latest/) はリアルタイムで文法チェックなんかをするのに便利なモード。
flymake よりモダンなやつだったんだけど最近は flymake に戻る人もいるっぽいのでどっちが良いかよくわかってない

<!--list-separator-->

-  インストール

    flycheck と同時にカーソルのそばに pos-tip で通知内容を表示してくれる [flycheck-pos-tip](https://github.com/flycheck/flycheck-pos-tip) をインストールしている

    ```emacs-lisp
    (el-get-bundle flycheck)
    (el-get-bundle flycheck-pos-tip)
    ```

<!--list-separator-->

-  設定

    flycheck を読んだ後で flycheck-pos-tip-mode が有効になるようにしている。これは公式に書かれているやりかたに則っている
    <https://github.com/flycheck/flycheck-pos-tip#installation>

    また web-mode はデフォルトでは flycheck が使えないので
    flycheck-add-mode を使って web-mode でも flycheck が使えるようにしている

    ```emacs-lisp
    (with-eval-after-load 'flycheck
      (flycheck-pos-tip-mode)
      (flycheck-add-mode 'javascript-eslint 'web-mode))
    ```

<!--list-separator-->

-  その他

    <!--list-separator-->

    -  flycheck-posframe

        flycheck-pos-tip は flycheck 公式のプラグインなので採用しているけど同じことを posframe でやってくれる [flycheck-posframe](https://github.com/alexmurray/flycheck-posframe) に置き換えた方が見た目麗しくなりそうな気がしている。

    <!--list-separator-->

    -  言語毎の設定

        各言語向けの設定もあるけどそれは各言語の設定ファイル内に書いているのでここでは書いてない

        [プログラミング関係の設定 &gt; ruby](#ruby) とか [プログラミング関係の設定 &gt; scss](#scss) とかに書いているはず


### gnuplot-mode {#gnuplot-mode}


#### 概要 {#概要}

[gnuplot-mode](https://github.com/emacsorphanage/gnuplot) はグラフ作成ソフトである [gnuplot](http://www.gnuplot.info/) を Emacs で使うためのパッケージ。
Syntax Highlight や 補完機能 などを提供する。

まあほとんど使ってないんだけど。


#### インストール {#インストール}

いつも通り el-get で入れている

```emacs-lisp
(el-get-bundle gnuplot-mode)
```


#### その他 {#その他}

org-mode から使ってた記憶があるのでそっちの方で何か設定があるかもしれない


### lsp-mode {#lsp-mode}


#### 概要 {#概要}

[lsp-mode](https://github.com/emacs-lsp/lsp-mode) は Emacs で Language server protocol が使えるようにするパッケージ。

より軽そうなやつに [eglot](https://github.com/joaotavora/eglot) というのもあるがこっちは試したことがない。


#### インストール {#インストール}

lsp-mode 本体と
UI 周りを担当する lsp-ui-mode の両方をインストールしている。また lsp-mode が有効になる際に lsp-ui-mode も同時に有効になるようにしている。

```emacs-lisp
(el-get-bundle lsp-mode)
(el-get-bundle lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
```


#### 設定 {#設定}

lsp-ui-doc はカーソル位置にある変数や関数などの説明を child frame で表示してくれるやつ。

これがデフォルトではフレーム基準で右上に表示するのだが大きめの画面を分割して使っていると大分遠くに表示されてしまうので
window 基準で表示するように設定を変更している

```emacs-lisp
(setq lsp-ui-doc-alignment 'window)
```


### markdown {#markdown}


#### 概要 {#概要}

Markdown を書くための設定。といいつつ markdown-mode を入れてるだけだけども。

手元でテキストドキュメントを弄るのは org-mode が多いからなあ……


#### インストール {#インストール}

いつも通り el-get で入れている。

```emacs-lisp
(el-get-bundle markdown-mode)
```


### plantuml-mode {#plantuml-mode}


#### 概要 {#概要}

[plantuml-mode](https://github.com/skuro/plantuml-mode) は [PlantUML](https://plantuml.com/ja/) という、テキストだけで UML 図などが描けるツール用のモード。


#### インストール {#インストール}

いつも通り el-get で入れてる

```emacs-lisp
(el-get-bundle plantuml-mode)
```


#### 設定 {#設定}

実行モードは `'jar` を指定している。デフォルトは `'server` なんだけどオフラインの時も使いたいししね。

```emacs-lisp
(setq plantuml-default-exec-mode 'jar)
```

el-get でインスコすると jar ファイルも自動で拾って来て
plantuml-mode と同じディレクトリに設置して
`plantuml-jar-path` も通してくれるからそっち使う方が便利だしね。


#### その他 {#その他}

最新の develop ブランチだとインデントを調整できる機能が入っているので乗り換えたいけどそのためには el-get のレシピを書いてあげる必要がありそうで放置している。


### rails {#rails}


#### 概要 {#概要}

Rails 開発関係だけど Ruby 開発とはちょっと違う設定をここに書いている。


#### 関連パッケージのインストール {#関連パッケージのインストール}

テンプレートエンジンには haml を使っているので [haml-mode](https://github.com/nex3/haml-mode) を入れていてファイルナビゲーションには [projectile](#projectile) の拡張である [projectile-rails](https://github.com/asok/projectile-rails) を利用している。

```emacs-lisp
(el-get-bundle haml-mode)
(el-get-bundle projectile-rails)
(projectile-rails-global-mode 1)
```


#### projectile-rails 用のコマンド追加 {#projectile-rails-用のコマンド追加}

自身のプロジェクトだと少しナビゲーション用のコマンドが不足していたので
projectile-rails の実装を参考にコマンドを追加している

<!--list-separator-->

-  Uploader Finder

    `app/uploaders` に格納している upload に関連するファイルを検索するコマンド

    ```emacs-lisp
    (defun my/projectile-rails-find-uploader ()
      "Find a Uploader."
      (interactive)
      (projectile-rails-find-resource
       "uploader: "
       '(("app/uploaders/" "\\(.+\\)\\.rb$"))
       "app/uploaders/${filename}.rb"))
    ```

<!--list-separator-->

-  Admin Finder

    Active Admin 用のファイルを検索するためのコマンド

    ```emacs-lisp
    (defun my/projectile-rails-find-admin ()
      "Find a ActiveAdmin file."
      (interactive)
      (projectile-rails-find-resource
       "admin: "
       '(("app/admin/" "\\(.+\\)\\.rb$"))
       "app/admin/${filename}.rb"))
    ```

<!--list-separator-->

-  Form Object Finder

    Form Object を探すためのコマンド

    ```emacs-lisp
    (defun my/projectile-rails-find-form-object ()
      "Find a Form Object."
      (interactive)
      (projectile-rails-find-resource
       "form object: "
       '(("app/models/forms/" "\\(.+\\)\\.rb$"))
       "app/models/forms/${filename}.rb"))
    ```

<!--list-separator-->

-  Vue Finder

    Vue.js の単一ファイルコンポーネントを探すためのコマンド

    ```emacs-lisp
    (defun my/projectile-rails-find-vue ()
      "Find a Vue."
      (interactive)
      (projectile-rails-find-resource
       "vue: "
       '(("app/javascript/" "\\(.+\\)\\.vue$"))
       "app/javascript/${filename}.vue"))
    ```

<!--list-separator-->

-  Webpacker 管理の JS 検索コマンド

    Webpacker で JS を管理していたりもするので必要だった

    ```emacs-lisp
    (defun my/projectile-rails-find-webpack-js ()
      "Find a Webpack js."
      (interactive)
      (projectile-rails-find-resource
       "webpack js: "
       '(("app/javascript/" "\\(.+\\)\\.js$"))
       "app/javascript/${filename}.js"))
    ```


#### キーバインド {#キーバインド}

もちろん基本的にコマンドなんて覚えられないのでいつも通り Hydra を定義して大体キーバインドは忘れている。

なおこの Hydra は Rails のファイルを開いている時には `C-c r` で起動するようにしている。これは通常のセットアップで prefix としてこう設定するといいよ、みたいに書かれているのを流用している。
<https://github.com/asok/projectile-rails#keymap-prefix>

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define pretty-hydra-projectile-rails-find (:separator "-" :color blue :foreign-keys warn :title "Projectile Rails" :quit-key "q")
	("Current"
	 (("M" projectile-rails-find-current-model      "Current model")
	  ("V" projectile-rails-find-current-view       "Current view")
	  ("C" projectile-rails-find-current-controller "Current controller")
	  ("H" projectile-rails-find-current-helper     "Current helper")
	  ("P" projectile-rails-find-current-spec       "Current spec")
	  ("Z" projectile-rails-find-current-serializer "Current serializer"))

	 "App"
	 (("m" projectile-rails-find-model           "Model")
	  ("v" projectile-rails-find-view            "View")
	  ("c" projectile-rails-find-controller      "Controller")
	  ("h" projectile-rails-find-helper          "Helper")
	  ("a" my/projectile-rails-find-admin        "ActiveAdmin")
	  ("f" my/projectile-rails-find-form-object  "Form object")
	  ("@" projectile-rails-find-mailer          "Mailer")
	  ("V" my/projectile-rails-find-vue          "Vue")
	  ("J" my/projectile-rails-find-webpack-js   "Webpack js")
	  ("u" my/projectile-rails-find-uploader     "Controller")
	  ("!" projectile-rails-find-validator       "Validator")
	  ;; ("y" projectile-rails-find-layout       "Layout")
	  ("z" projectile-rails-find-serializer      "Serializer"))

	 "Assets"
	 (("j" projectile-rails-find-javascript  "Javascript")
	  ;; ("w" projectile-rails-find-component)
	  ("s" projectile-rails-find-stylesheet  "CSS"))

	 "Other"
	 (("n" projectile-rails-find-migration    "Migration")
	  ("r" projectile-rails-find-rake-task    "Rake task")
	  ("i" projectile-rails-find-initializer  "Initializer")
	  ("l" projectile-rails-find-lib          "Lib")
	  ("p" projectile-rails-find-spec         "Spec")
	  ("t" projectile-rails-find-locale       "Translation"))

	 "Single Files"
	 (("R" projectile-rails-goto-routes   "routes.rb")
	  ("G" projectile-rails-goto-gemfile  "Gemfile")
	  ("D" projectile-rails-goto-schema   "schema.rb"))))
  (define-key projectile-rails-mode-map (kbd "C-c r") 'pretty-hydra-projectile-rails-find/body))
```

| Key | 効果                             | 備考                                                                                          |
|-----|--------------------------------|---------------------------------------------------------------------------------------------|
| M   | 現在のファイルに関連する Model を開く |                                                                                               |
| V   | 現在のファイルに関連する View を開く | キーが Vue ファイル検索とかぶってしまっていて現在使えない                                     |
| C   | 現在のファイルに関連する Controller を開く |                                                                                               |
| H   | 現在のファイルに関連する Helper を開く |                                                                                               |
| P   | 現在のファイルに関連する Spec を開く |                                                                                               |
| Z   | 現在のファイルに関連する Serializer を開く | [ActiveModelSerializer](https://github.com/rails-api/active_model_serializers) を使ってるプロジェクトがある |
| m   | Model ファイルを検索する         |                                                                                               |
| v   | View ファイルを検索する          |                                                                                               |
| c   | Controller ファイルを検索する    |                                                                                               |
| h   | Helper ファイルを検索する        |                                                                                               |
| a   | ActiveAdmin のファイルを検索する |                                                                                               |
| f   | Form Object ファイルを検索する   |                                                                                               |
| @   | ActionMailer ファイルを検索する  |                                                                                               |
| V   | Vue の単一ファイルコンポーネントファイルを検索する |                                                                                               |
| J   | Webpacker 管理の JS ファイルを検索する |                                                                                               |
| u   | Uploader ファイルを検索する      |                                                                                               |
| !   | Validator ファイルを検索する     |                                                                                               |
| z   | Serializer ファイルを検索する    |                                                                                               |
| j   | assets 配架の JS ファイルを検索する |                                                                                               |
| s   | SCSS ファイルを検索する          |                                                                                               |
| n   | migration ファイルを検索する     |                                                                                               |
| r   | rake ファイルを検索する          |                                                                                               |
| i   | config/initializers 以下のファイルを検索する |                                                                                               |
| l   | lib 以下のファイルを検索する     |                                                                                               |
| p   | rspec ファイルを検索する         |                                                                                               |
| t   | I18n の翻訳ファイルを検索する    |                                                                                               |
| R   | routes.rb を開く                 |                                                                                               |
| G   | Gemfile を開く                   |                                                                                               |
| D   | Schema.rb を開く                 |                                                                                               |


### React.js {#react-js}


#### 概要 {#概要}

React.js を書くための設定をここにまとめている


#### dap-mode {#dap-mode}

Debug Adapter Protocol をサポートするモード。入れておいた方がきっとデバッグしやすいんだろうということで入れている。

lsp-mode の仲間なので、本当はそっち側で入れるようにした方が良さそうだけどひとまず React のために入れているので React 用の設定ファイルに書いている。

```emacs-lisp
(el-get-bundle dap-mode)
```

同時に treemacs や lsp-treemacs も入ってくる罠がある。
Neotree 使ってるからちょっとアレだなあ。いずれ乗り換えようとはしていたけども。


#### web-mode {#web-mode}

とりあえず tsx を弄る上では web-mode が良いという話もあるので入れておく。

```emacs-lisp
(el-get-bundle web-mode)
```


#### メジャーモードの紐付け {#メジャーモードの紐付け}

jsx/tsx ファイルを開いた時には web-mode で動いてほしいので
auto-mode-alist で関連付けをする

```emacs-lisp
(add-to-list 'auto-mode-alist '("\\.[jt]sx" . web-mode))
```


#### lsp-mode などの有効化 {#lsp-mode-などの有効化}

jsx/tsx ファイルを開く時に web-mode が有効になるようにしているのでその web-mode の hook で

-   display-line-numbers-mode
-   lsp
-   lsp-ui-mode
-   company-mode
-   flycheck

を有効にしている。

flycheck では lsp と eslint を使いたいのでそれ以外の JS の checker は disable にしている

また web-mode の設定も少し弄っていて
indent は2桁スペースになるようにしているが自動インデントだとそれが反映されないっぽいので自動インデントはオフにしている。

```emacs-lisp
(defun my/web-mode-tsx-hook ()
  (let ((ext (file-name-extension buffer-file-name)))
	(when (or (string-equal "jsx" ext) (string-equal "tsx" ext))
	  (setq web-mode-markup-indent-offset 2)
	  (setq web-mode-code-indent-offset 2)
	  (setq web-mode-enable-auto-indentation nil)
	  (company-mode 1)
	  (turn-on-smartparens-mode)
	  (display-line-numbers-mode t)
	  (lsp)
	  (lsp-ui-mode 1)
	  (flycheck-mode 1)
	  (setq flycheck-disabled-checkers '(javascript-standard javascript-jshint))
	  (flycheck-add-next-checker 'lsp '(warning . javascript-eslint)))))

(add-hook 'web-mode-hook 'my/web-mode-tsx-hook)
```


### rspec-mode {#rspec-mode}


#### 概要 {#概要}

[rspec-mode](https://github.com/pezra/rspec-mode) は Emacs で RSpec を実行したりする時に便利なパッケージ。といいつつ麦汁さんはちゃんと使いこなしていない……


#### インストール {#インストール}

```emacs-lisp
(el-get-bundle rspec-mode)
```


#### 有効化 {#有効化}

rspec 実行バッファで byebug などで止まった際に C-x C-q したら inf-ruby が動くようにしている。

```emacs-lisp
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
```

binding.pry は何故かまともに動かないので byebug か binding.irb 推奨。麦汁さんはいつも `debugger` とコードに入れて使っている。


#### キーバインド {#キーバインド}

C-c C-c で開いている rspec ファイルのカーソルがある行のテストを実行できるようにしている。

```emacs-lisp
(define-key rspec-mode-map (kbd "C-c C-c") 'rspec-verify-single)
```

他にも色々な機能があるのだけどキーバインド未設定なのでこれだけしか使ってない。


### ruby {#ruby}


#### 概要 {#概要}

Ruby のコードを編集する上での設定をここには書いている。別の箇所で [rspec-mode](#rspec-mode) などの設定も書いているのでいつか記述場所を統合した方が良さそうな気もする


#### rbenv.el {#rbenv-dot-el}

Ruby のバージョンを切り替えられる [rbenv](https://github.com/rbenv/rbenv) を使ってるので
Emacs 上でもそれが使えるように [rbenv.el](https://github.com/senny/rbenv.el) を導入している。

<!--list-separator-->

-  インストール

    インストールはいつも通り el-get でやっている

    ```emacs-lisp
    (el-get-bundle rbenv)
    ```

<!--list-separator-->

-  有効化

    そして global に有効化している。というか global じゃない有効化ってあるのかなってのと、あるとしても意味があるのかな的な。

    ```emacs-lisp
    (global-rbenv-mode)
    ```


#### enh-ruby-mode {#enh-ruby-mode}

メジャーモードは [enhanced-ruby-mode](https://github.com/zenspider/enhanced-ruby-mode) を利用している。が、最近は ruby-mode の方がやっぱり良いみたいな話もどこかで見た気がするので戻ってみるのも手かもしれないと思っている。

<!--list-separator-->

-  インストール

    いつも通り el-get で入れている。

    ```emacs-lisp
    (el-get-bundle enh-ruby-mode)
    ```

<!--list-separator-->

-  カスタム設定

    enh-ruby-mode が読み込まれた後に setq で以下のように設定されている

    ```emacs-lisp
    (with-eval-after-load 'enh-ruby-mode
      (setq enh-ruby-add-encoding-comment-on-save nil)
      (setq enh-ruby-deep-indent-paren nil)
      (setq enh-ruby-bounce-deep-indent t))
    ```

    <!--list-separator-->

    -  encoding のマジックコメントが入らないようにする

        `enh-ruby-add-encoding-comment-on-save` を nil にすることで
        encoding 設定のマジックコメントが入らないようにしている。

        これは昔は有効にしておいた方が良かったけど最近の Ruby では設定しなくても UTF-8 が前提になるからむしろ無い方が良いというお話だったはず。

        そういう状況に変わったのも大分前なので詳細は忘れた。

        ただとりあえず [最新の enhanced-ruby-mode](https://github.com/zenspider/enhanced-ruby-mode/blob/e960bf941d9fa9d92eabf7c03a8bbb51ba1ac453/enh-ruby-mode.el#L74) を見るとデフォルトが nil なのでわざわざ設定しなくて良さそう。

    <!--list-separator-->

    -  インデントの調整

        `enh-ruby-deep-indent-paren` が t の場合

        ```ruby
        hoge = {
        		 foo: 1
        	   }
        ```

        みたいな深いインデントになるけど

        ```ruby
        hoge = {
          foo: 1
        }
        ```

        というようにしたいので nil に設定している。

    <!--list-separator-->

    -  インデントの切替

        インデントを深くしたくないといいつつ、全然それができないのも困りそうなので
        `enh-ruby-bounce-deep-indent` を t に設定してタブを押すごとに切り替わるようにしている。

        ところでデフォルトで深い方になってるような気がするので今度設定の見直しした方が良さそう。

<!--list-separator-->

-  hook

    hook 用の関数で補完などの機能を有効にしている

    ```emacs-lisp
    (defun my/enh-ruby-mode-hook ()
      (company-mode 1)
      (lsp)
      (lsp-ui-mode 1)
      (turn-on-smartparens-strict-mode)
      (display-line-numbers-mode 1))
    ```

    -   補完用に company-mode を有効化
    -   [solargraph](https://github.com/castwide/solargraph) を使ってるので lsp-mode を有効にしている
        -   lsp-ui-mode も有効にして色々な情報を表示している
    -   開きカッコと閉じカッコの組み合わせがズレないように smartparens-strict-mode を有効にしている
    -   行番号も表示されている方が便利なので display-line-numbers-mode を有効にしている

    それらを設定する関数を enh-ruby-mode-hook に突っ込んでいる

    ```emacs-lisp
    (add-hook 'enh-ruby-mode-hook 'my/enh-ruby-mode-hook)
    ```

<!--list-separator-->

-  SKK の調整

    `enh-ruby-mode` を `context-skk-programming-mode` に追加することで
    Ruby を使ってる時にコメント部分はクォートの外以外では自動的に日本語入力がオフになるようにしている

    ```emacs-lisp
    (add-to-list 'context-skk-programming-mode 'enh-ruby-mode)
    ```

<!--list-separator-->

-  キーバインド

    キーバインドは覚えられないので
    [major-mode-hydra](#major-mode-hydra) でキーを定義している

    ```emacs-lisp
    (with-eval-after-load 'major-mode-hydra
      (major-mode-hydra-define enh-ruby-mode (:quit-key "q" :title (concat (all-the-icons-alltheicon "ruby-alt") " Ruby commands"))
    	("Enh Ruby"
    	 (("{" enh-ruby-toggle-block "Toggle block")
    	  ("e" enh-ruby-insert-end "Insert end"))

    	 "LSP"
    	 (("i" lsp-ui-imenu "Imenu")
    	  ("f" lsp-ui-flycheck-list "Flycheck list"))

    	 "RSpec"
    	 (("s" rspec-verify "Run associated spec")
    	  ("m" rspec-verify-method "Run method spec")
    	  ("r" rspec-rerun "Rerun")
    	  ("l" rspec-run-last-failed "Run last failed"))

    	 "REPL"
    	 (("I" inf-ruby "inf-ruby"))

    	 "Other"
    	 (("j" dumb-jump-go "Dumb Jump")))))
    ```

    | Key | 効果                                                |
    |-----|---------------------------------------------------|
    | {   | do 〜 end と { 〜 } を切り替える                    |
    | e   | end を挿入する。使ったことない気がする              |
    | i   | lsp-ui-imenu の表示                                 |
    | f   | Flycheck の通知されるエラーのリスト表示             |
    | s   | 関連するテストまたは特定のテストの実行              |
    | m   | カーソル位置のコードのテストを探して実行する        |
    | r   | 最後に実行したテストを再実行                        |
    | l   | 最後に失敗したテストの再実行                        |
    | I   | REPL バッファで Ruby を実行する                     |
    | j   | dumb-jump で関数定義にジャンプ。dumb-jump 用の hydra があるから要らなさそう |


### scss {#scss}


#### 概要 {#概要}

scss を使う上での設定をここではまとめている。長いこと手を入れてないので今はより良い設定がありそうな気がする。


#### rainbow-mode {#rainbow-mode}

[rainbow-mode](https://elpa.gnu.org/packages/rainbow-mode.html) はカラーコードを入力した際に、そのカラーコード部分の背景色をカラーコードの色に変化させるパッケージ。ぱっと見で大体どんな色かわかって便利なやつ

<!--list-separator-->

-  インストール

    自分はel-get で入れている。

    ```emacs-lisp
    (el-get-bundle rainbow-mode)
    ```

    ELPA に登録されているので package-install でもいける


#### scss-mode {#scss-mode}

scss-mode は Emacs 組込みの css-mode の中で定義されているメジャーモード。なのでインストール不要で使えるし
`.scss` という拡張子なら自動的に scss-mode で開いてくれるようになっている。

<!--list-separator-->

-  設定 <span class="tag"><span class="improvement">improvement</span></span>

    インデントはデフォルトだと半角空白 4 つとなっているが麦汁さん的には 2 の方が良いのでそのように変更している。

    ```emacs-lisp
    (with-eval-after-load 'scss-mode
      (setq css-indent-offset 2))
    ```

    `with-eval-after-load` を使っているが
    `css-indent-offset` は `defcustom` で定義されているので
    `custom-set-variables` を使うように修正した方が良さそう


#### hook <span class="tag"><span class="improvement">improvement</span></span> {#hook}

scss を使う上で hook を使って色々有効化したりしている。

```emacs-lisp
(defun my/scss-mode-hook ()
  (flycheck-mode 1)

  (setq-local lsp-prefer-flymake nil)
  (lsp)
  (lsp-ui-mode -1)

  (smartparens-strict-mode 1)

  ;; lsp-ui とかより後に設定しないと上書きされるのでここに移動した
  (setq-local flycheck-checker 'scss-stylelint)
  (setq-local flycheck-check-syntax-automatically '(save new-line idle-change))

  (company-mode 1)
  (display-line-numbers-mode 1)

  (rainbow-mode))
(add-hook 'scss-mode-hook 'my/scss-mode-hook)
```

-   flycheck-mode の有効化
    -   これによりリアルタイムに lint 結果が分かって便利になる
-   lsp-prefer-flymake の無効化
    -   flycheck が有効にならない問題を防いでいる。どうも自分の設定の書き方が悪い気もするが……。
-   lsp-mode を有効化しつつ lsp-ui は無効にしている
    -   lsp-ui が有効だと画面上でガチャガチャ height とかのプロパティの説明をしてうざいので
-   smartparens-strict-mode を入れることで {} のペアが維持されるようにしている
-   flycheck-checker, flycheck-check-syntax-automatically の設定
    -   lsp-ui とかより後に設定しないと上書きされるので、それらより後に設定している
    -   設定の書き方の悪さのせいな気もする
-   company-mode の有効化。これがないと補完できなくて厳しいよね
-   display-line-numbers-mode の有効化。行数表示も欲しいよね。巨大ファイルだと邪魔だけど巨大にしなきゃいい
-   [rainbow-mode](#rainbow-mode) の有効化


#### カラーコード→ CSS Variable の置き換え {#カラーコード-css-variable-の置き換え}

外部コマンドで fetch-color-var というのを定義してそいつにカラーコードを渡すとプロジェクトで使ってる CSS Variable を返してくるようにしている。

で、それを Emacs から叩いて使えるようにしているのが以下のコマンド

```emacs-lisp
(defun my/replace-var (point mark)
  (interactive "r")
  (let* ((str (buffer-substring point mark))
		 (cmd (concat "fetch-color-var '" str "'"))
		 (response (shell-command-to-string cmd)))
	(delete-region point mark)
	(insert response)))
```


#### キーバインド {#キーバインド}

設定しているけど使ってないなあ……。

```emacs-lisp
(with-eval-after-load 'major-mode-hydra
  (major-mode-hydra-define scss-mode (:quit-key "q" :title (concat (all-the-icons-alltheicon "css3") " CSS"))
	("Edit"
	 (("v" my/replace-var "replace-var")))))
```

| Key | 効果                                      |
|-----|-----------------------------------------|
| v   | リージョンの値で CSS 変数を検索して置き換えるやつ。自作コマンドを利用している |


### TypeScript {#typescript}


#### 概要 {#概要}

TypeScript ファイル(.ts) を使う上での設定を書いている。とりあえず簡単な設定だけ。


#### typescript-mode {#typescript-mode}

[typescript-mode](https://github.com/emacs-typescript/typescript.el) は TypeScript 向けの Syntax Highlight とかを提供してくれるメジャーモード。

<!--list-separator-->

-  インストール

    自分はいつも通り el-get で入れている

    ```emacs-lisp
    (el-get-bundle typescript-mode)
    ```

<!--list-separator-->

-  カスタム変数

    indent は2文字がいいのでデフォルトから変更している

    ```emacs-lisp
    (custom-set-variables
     '(typescript-indent-level 2))
    ```

<!--list-separator-->

-  auto-fix の hook 関数

    保存した時に自動で整形してほしいなと思ったので
    auto-fix.el で自動で保存されるように hook 関数を用意している

    ```emacs-lisp
    (defun my/auto-fix-mode-hook-for-ts ()
      (add-hook 'before-save-hook 'auto-fix-before-save))

    (add-hook 'auto-fix-mode-hook 'my/auto-fix-mode-hook-for-ts)
    ```

<!--list-separator-->

-  hook

    -   company-mode
    -   smartparens-strict-mode
    -   lsp/lsp-ui
    -   flycheck

    などのプログラミングで便利な各種のモードを
    hook を使って有効化している

    auto-fix はここでもなんか設定しているのでなんか設定まとめたいなあって感じはある。

    ```emacs-lisp
    (defun my/ts-mode-hook ()
      (company-mode 1)
      (turn-on-smartparens-strict-mode)
      (display-line-numbers-mode t)
      (lsp)
      (lsp-ui-mode 1)
      (flycheck-mode 1)
      (setq flycheck-disabled-checkers '(javascript-standard javascript-jshint))
      (flycheck-add-next-checker 'lsp '(warning . javascript-eslint))

      (let* ((args (list "run" "eslint" "--fix"))
    		 (args-string (mapconcat #'shell-quote-argument args " ")))
    	(setq-local auto-fix-option args-string))
      (setq-local auto-fix-options '("run" "eslint" "--fix"))
      (setq-local auto-fix-command "yarn"))
    ```

    この関数を

    ```emacs-lisp
    (add-hook 'typescript-mode-hook 'my/ts-mode-hook)
    ```

    として hook に追加している。

    直接 lambda で add-hook に書くという手もあるが関数を分離しておくと修正の反映が用意なのでこのようにしている。

    なお auto-fix については自社環境で弊害も大きかったので有効化はせずに設定だけ入れている。そろそろフォーマットするかって時だけ有効にするぐらいが良さそう。
    toggle できるようにしているしね

<!--list-separator-->

-  拡張子による有効化

    .ts ファイルであれば typescript-mode で動いてほしいので
    auto-mode-alist に突っ込んでいる

    ```emacs-lisp
    (add-to-list 'auto-mode-alist '("\\.ts" . typescript-mode))
    ```


### Vue.js {#vue-js}


#### 概要 {#概要}

ここでは Vue.js アプリケーションを書く上での設定を書いている。


#### auto-insert の設定 {#auto-insert-の設定}

Vue.js のコンポーネントファイルを新規作成する時にテンプレートが自動挿入できるようにしている

<!--list-separator-->

-  テンプレート

    Vue.js の単一ファイルコンポーネントなので template, script, style を出力している。

    template には [pug](https://pugjs.org/api/getting-started.html) を、CSS には scss を使っている。

    ```html
    <template lang='pug'>
    </template>

    <script>
    export default {

    };
    </script>

    <style lang='scss' scoped>
    </style>
    ```

<!--list-separator-->

-  テンプレートを適用可能にする

    `.vue` という拡張子のファイルを新規作成する時には上で定義したテンプレートが自動的に挿入されるようにする。

    ```emacs-lisp
    (define-auto-insert "\\.vue$" "template.vue")
    ```


#### パッケージのインストール {#パッケージのインストール}

ここでは Vue.js 開発に使っている関連パッケージを入れている。

<!--list-separator-->

-  vue-mode

    [vue-mode](https://github.com/AdamNiederer/vue-mode) は [mmm-mode](https://github.com/purcell/mmm-mode) をベースにして作られた Vue.js の単一ファイルコンポーネント用のモード。
    mmm-mode ベースなので
    template, script, css 部分でそれぞれ別のメジャーモードが動くようになっている。

    <!--list-separator-->

    -  インストール

        いつも透り el-get で入れている

        ```emacs-lisp
        (el-get-bundle vue-mode)
        ```

    <!--list-separator-->

    -  備考

        あまり更新は活発でなく微妙な挙動もあるので
        mmm-mode に乗り換えたり web-mode を使うようにしている人も多い様子。

        自分もそういった乗り換えを検討した方がいいかもと思いつつ最近あまり Vue.js 触ってないから、まあいいかという気持ちもある。

        なお vue-mode では JS 部分は js2-mode は使えないはず。
        mmm-mode の方が何かの制限で使えないという話だったはずなので。
        <https://github.com/mooz/js2-mode/issues/124>

<!--list-separator-->

-  pug-mode

    [pug-mode](https://github.com/hlissner/emacs-pug-mode) は [pug](https://pugjs.org/api/getting-started.html) というテンプレートエンジンを使って記述するためのモード。
    Vue.js でテンプレートエンジンに pug を利用することが多いので入れている。麦汁さんは HTML をそのまま書くようなことは好きじゃないのです。

    <!--list-separator-->

    -  インストール

        いつも透り el-get で入れている

        ```emacs-lisp
        (el-get-bundle hlissner/emacs-pug-mode)
        ```


#### hooks {#hooks}

css-mode と vue-mode だけは hook を定義している。
pug-mode や js-mode についても何か手を入れた方がいいのかもしれない。

<!--list-separator-->

-  css-mode

    Vue.js では style に scss を指定いちえる場合には css-mode が利用されるようになっているので
    css-mode の hook としている。
    <https://github.com/AdamNiederer/vue-mode/blob/031edd1f97db6e7d8d6c295c0e6d58dd128b9e71/vue-mode.el#L63>

    ```emacs-lisp
    (defun my/css-mode-hook ()
      (setq-local flycheck-checker 'css-stylelint)
      (rainbow-mode 1))

    (add-hook 'css-mode-hook 'my/css-mode-hook)
    ```

    見ての透り rainbow-mode と flycheck-checker の設定ぐらいしかしてない。
    [scss-mode](#scss-mode) の方ではもう少し手を入れているので同じようなのをここに反映してもいいかもしれない。

    もしくは設定を統合するという手もあるかも。

<!--list-separator-->

-  vue-mode

    ```emacs-lisp
    (defun my/vue-mode-hook ()
      (display-line-numbers-mode t)
      (lsp)
      (flycheck-mode 1))

    (add-hook 'vue-mode-hook 'my/vue-mode-hook)
    ```

    -   行番号表示
    -   lsp を有効化
    -   flyckeck-mode を有効化

    しているだけである。
    lsp-ui とか色々設定の余地はありそうな気がする。


#### キーバインド {#キーバインド}

これもろくに設定してないし、ろくに使ってないもいないが、一応設定自体はある。

```emacs-lisp
(with-eval-after-load 'major-mode-hydra
  (major-mode-hydra-define css-mode (:quit-key "q" :title (concat (all-the-icons-alltheicon "css3") " CSS"))
	("Edit"
	 (("v" my/replace-var "replace-var")))))
```

| Key | 効果                                      |
|-----|-----------------------------------------|
| v   | リージョンの値で CSS 変数を検索して置き換えるやつ。自作コマンドを利用している |


### yaml-mode {#yaml-mode}


#### 概要 {#概要}

[yaml-mode](https://github.com/yoshiki/yaml-mode) は yaml を編集する時のメジャーモード。インデントを調整しやすい。


#### インストール {#インストール}

いつも通り el-get でインストール

```emacs-lisp
(el-get-bundle yaml-mode)
```


#### hook {#hook}

mode に対する hook は関数を定義してその中で呼びたいコードを書いていくようにしている。

lambda で書いてしまうと hook を弄りたい時に結構面倒なのだけど関数を定義しておくと、その関数の中身を変更して評価しておくだけで
hook で動作する中身が変更できて便利。

とりあえず yaml-mode では以下のようにして
[highlight-indent-guides](https://github.com/DarthFennec/highlight-indent-guides) を有効にしている。

```emacs-lisp
(defun my/yaml-mode-hook ()
  (highlight-indent-guides-mode 1))
```

で、その hook を最後に yaml-mode-hook に追加している。

```emacs-lisp
(add-hook 'yaml-mode-hook 'my/yaml-mode-hook)
```


## 外部連携ツール設定 {#外部連携ツール設定}


### 外部連携ツール設定 {#_index}

ここでは外部のサービスと連携するようなやつをまとめています

[emacs-w3m](#emacs-w3m)
: 和製テキストブラウザである w3m を Emacs で使えるようにするパッケージ

[esa.el](#esa)
: [esa.io](https://esa.io/) と連携するためのパッケージ

[forge](#forge)
: [magit](#magit) と GitHub を連携して Emacs 上で PR を眺めたりできるようにするパッケージ

[google-this](#google-this)
: Google 検索機能を提供してくれるパッケージ

[google-translate](#google-translate)
: Emacs から Google 翻訳するためのパッケージ

[magit](#magit)
: Emacs 上で Git の操作をするのにとても便利なパッケージ

[notify-slack](#notify-slack)
: Emacs から外部コマンドを通じて Slack に通知するための関数周りの事を書いている

[wakatime-mode](#wakatime-mode)
: Emacs と WakaTime を連携してどのプロジェクトの作業をどのぐらいしてたかを計測するパッケージ

[todoist](#todoist)
: Todoist と連携して org-mode で扱えるようにするパッケージ

[twmode](#twmode)
: Emacs 上で動く Twitter クライアント

[ブラウザ設定](#browse-url)
: ブラウザ連携周りの設定


### emacs-w3m {#emacs-w3m}


#### 概要 {#概要}

w3m という和製のテキストブラウザを Emacs 上で使うためのパッケージ。つまり w3m 自体もインストールしておく必要がある。


#### インストール {#インストール}

emacs-w3m は el-get で入れられるので以下のようにして入れている

```emacs-lisp
(el-get-bundle emacs-w3m)
```

今はこれだけしか入れてない。昔の設定はどこかにいっちゃった……。


### esa.el {#esa}


#### 概要 {#概要}

[esa.el](https://github.com/nabinno/esa.el) は [esa.io](https://esa.io/) と連携するためのパッケージ。大体直接 Web で書くので活用はできてない……


#### インストール・設定 {#インストール-設定}

いつも通り el-get で入れている。

設定は別ファイルに分離している。authinfo に移動したい

```emacs-lisp
(el-get-bundle esa)
(my/load-config "my-esa-config")
```


### forge {#forge}


#### 概要 {#概要}

[forge](https://github.com/magit/forge) は magit と github を連携させるやつ。一応入れているけど実は使えてないのであまりこの設定を呼んでも意味はなさそう


#### インストール {#インストール}

いつも通り el-get でインストール

```emacs-lisp
(el-get-bundle forge)
```


#### 読み込み {#読み込み}

magit の拡張なので magit を読み込んで後に読み込まれるようにしている

```emacs-lisp
(with-eval-after-load 'magit
  (require 'forge))
```


#### その他 {#その他}

リポジトリのコミット数が多いとまともに使えない感じだけどどうしたらいいの。


### google-this {#google-this}


#### 概要 {#概要}

[google-this](https://github.com/Malabarba/emacs-google-this) は Google 検索を Emacs の中から行えるやつ。


#### インストール {#インストール}

いつも通り el-get でインストール

```emacs-lisp
(el-get-bundle google-this)
```

で、本来の使い方だとこのあとに

```emacs-lisp
(google-this-mode 1)
```

とやって有効化することになるがそれをしても google-this のデフォルトキーバインドが設定されるぐらいで自分はそのデフォルトキーバインドを使う気がないので有効化はしてない。


#### キーバインド {#キーバインド}

キーバインドは Hydra で設定しているが、
[google-translate](#google-translate) と統合したので
[キーバインド &gt; Google 連携](#google-integration) に記載している。


### google-translate {#google-translate}


#### 概要 {#概要}

[google-translate](https://github.com/atykhonov/google-translate) は Google 翻訳する機能を提供するパッケージ。


#### インストール {#インストール}

いつも通り el-get でインストール

```emacs-lisp
(el-get-bundle google-translate)
```


#### 関数のオーバーライド {#関数のオーバーライド}

どうも最新版でも壊れっぱなしのようなので
<https://github.com/atykhonov/google-translate/issues/52#issuecomment-727920888>
にあるように関数を上書きしている。

```emacs-lisp
(with-eval-after-load 'google-translate-tk
  (defun google-translate--search-tkk ()
	"Search TKK."
	(list 430675 2721866130)))
```

google-translate-tk に定義されていて、それが読まれた後に上書きしないといけないので
with-eval-after-load を使っている。


#### default-ui の読み込み {#default-ui-の読み込み}

Google Translate は UI を defauult と smooth のどちらかから選べるようになっている。

default だと

-   `google-translate-default-source-language`
-   `google-translate-default-target-language`

を設定しておいて

`M-x google-translate-at-point`
: source → target の翻訳

`M-x google-translate-at-point-reverse`
: target → source の翻訳

という使い方をする。

smooth だと翻訳の source, target を複数設定して多言語対応ができるが、英語以外を翻訳することがないので smooth でなくていいかという感じで default を採用している。

```emacs-lisp
(with-eval-after-load 'popup
  (require 'google-translate-default-ui))
```

popup.el に依存しているのでそれが読まれた後に require しないといけなかった。というわけで with-eval-after-load で対応している。


#### カスタム変数の設定 {#カスタム変数の設定}

上述の通り default UI を使うことにしたのでその変数をいくらか設定している。

```emacs-lisp
(custom-set-variables
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja")
 '(google-translate-output-destination 'popup))
```

google-translate-default-source-language
: 翻訳元言語

google-translate-default-target-language
: 翻訳先言語

google-translate-output-destination
: 翻訳結果の表示

日本語を母国語としていて英語はからきしという人間なので当然英日変換されるように設定していてあとは変換結果の表示方法は popup でツールチップ表示するようにしている。

popup 表示の欠点としては、その結果をコピペできないところだけど
current-buffer への挿入も邪魔そうだし
kill-ring に入れるのも違うしなどを考えた結果、消去法でこれにしてみた。

```emacs-lisp
(my/google-translate-at-point-output-tempbuf ()
  (let ((google-translate-output-destination nil))
	(google-translate-at-point)))
```

とか用意しておいたらその時だけデフォルト動作の temporary buffer への出力ができそうだけどもね。ただこれだと逆版も作らないといけなさそうなのでちょっと方法考えるか。別で output destination を切り替えるようにするとか。


#### キーバインド {#キーバインド}

[google-this](#google-this) と同じく Google 連係機能なので
[キーバインド &gt; Google 連携](#google-integration) でまとめて Hydra を定義している


### magit {#magit}


#### 概要 {#概要}

[magit](https://github.com/magit/magit) は Emacs の上で Git の色々な操作ができるやつ。結構使いやすいのでオススメなやつ。

[forge](#forge) を使うと GitHub や GitLab とも連携できてさらに便利、なはず。


#### インストール {#インストール}

```emacs-lisp
(el-get-bundle magit)
```


#### 使い方 {#使い方}

Git 管理されてるファイルを開いている時に
`M-x magit` とかすると Git 管理用のバッファが出て来るしそこで `?` を叩いたらどういうコマンドが使えるのか教えてくれるよ(雑)


### notify-slack {#notify-slack}


#### 概要 {#概要}

Emacs から Slack に通知するための自作関数。実体は同じく自作の外部コマンドを叩いているだけである。

何に使ってるかというと
org-clock-in, org-clock-out の時に作業の開始と終了を分報チャンネルに投稿しているだけである。作業の可視化である。


#### 実装 {#実装}

<!--list-separator-->

-  分報チャンネル設定用の変数

    通知先のチャンネル名を格納する変数が必要なので `defvar` で定義しておく

    ```emacs-lisp
    (defvar my/notify-slack-times-channel nil)
    ```

<!--list-separator-->

-  送信するコマンド

    start-process を使って外部コマンドを叩いている。

    ```emacs-lisp
    (defun my/notify-slack (channel text)
      (if my/notify-slack-enable-p
    	  (start-process "my/org-clock-slack-notifier" "*my/org-clock-slack-notifier*" "my-slack-notifier" channel text)))
    ```

    `my/notify-slack-enable-p` という変数が nil だと大分コマンドが実行されないようになっている。

<!--list-separator-->

-  Slack 連携を Toggle するコマンド

    連携したい時としたくない時があるので送信したりしなかったりを切り替えられるコマンドを用意している。

    中身は何をしているかというと上に書いた `my/notify-slack-enable-p` という変数を切り替えているだけ。

    ```emacs-lisp
    (defun my/notify-slack-toggle ()
      (interactive)
      (if my/notify-slack-enable-p
    	  (setq my/notify-slack-enable-p nil)
    	(setq my/notify-slack-enable-p t)))
    ```

<!--list-separator-->

-  分報チャンネル投稿関数

    「分報チャンネル投稿関数」としているけどデフォルト投稿先に投稿するための関数というような扱いの関数。

    単純に前出の `my/notify-slack` 関数の第一引数に `my/notify-slack-times-channel` という変数を設定してそのチャンネルに向けて投稿するだけ。

    ```emacs-lisp
    (defun my/notify-slack-times (text)
      (if my/notify-slack-times-channel
    	  (my/notify-slack my/notify-slack-times-channel text)))
    ```

<!--list-separator-->

-  設定

    あまり見せたくない設定ファイルを別ファイルに分離しているのでそれを読み出している。

    内部では `my/notify-slack-times-channel` という変数を設定しているだけじゃないだろうか。職場の Slack のチャンネルを指定しているので隠したいという意図があった。

    そのうち .authinfo.gpg に移動しようと思ってる。

    ```emacs-lisp
    (my/load-config "my-notify-slack-config")
    ```

    ちなみに [my/load-config](#my-load-config) はこの手の設定ファイルを読み出すために使っている自作関数である。
    load と同じように使えば大体 OK。むしろ load の引数ちゃんと使えばこの関数要らない説まである。

    そして起動直後は連携を ON にしたいので
    `my/notify-slack-enable-p` を ON にしている

    ```emacs-lisp
    (setq my/notify-slack-enable-p t)
    ```


### todoist {#todoist}


#### 概要 {#概要}

[emacs-todoist](https://github.com/abrochard/emacs-todoist) は Todo 管理サービスである Todoist と連携するためのパッケージ。
org-mode に依存している。


#### インストール {#インストール}

まず以下のレシピを用意している

```emacs-lisp
(:name emacs-todoist
	   :website "https://github.com/abrochard/emacs-todoist"
	   :description "Emacs interface to Todoist"
	   :type github
	   :pkgname "abrochard/emacs-todoist")
```

その上で以下のようにしてインストールしている

```emacs-lisp
(el-get-bundle emacs-todoist)
```


#### 設定 {#設定}

API キーを設定するので別ファイルに分離している。いつか .authinfo.gpg に移動しようかなと思っているけどそもそも最近 TODOIST 使ってない……

```emacs-lisp
(with-eval-after-load 'org
  (my/load-config "my-todoist-config"))
```


### twmode {#twmode}


#### 概要 {#概要}

[twmode](https://github.com/hayamiz/twittering-mode) は Emacs 上で動く Twitter クライアント。

今でもたまーに使っている。勉強会に参加して実況する時などに。


#### インストール {#インストール}

いつも通り el-get でインスコしている。

```emacs-lisp
(el-get-bundle twittering-mode)
```


#### 設定 {#設定}

```emacs-lisp
(setq twittering-username "mugijiru")
(setq twittering-jojo-mode t)
(setq twittering-timer-interval 60)
;(setq twittering-auth-method 'xauth)
(setq twittering-auth-method 'oauth)
(setq twittering-update-status-function 'twittering-update-status-from-minibuffer)
(setq twittering-status-format "%i %S(%s)%p, %@:\n%FILL{  %T // from %f%L%r%R}\n ")
(setq twittering-retweet-format "RT @%s %t")
(setq twittering-display-remaining t)
```

なんか色々設定しているけど、まあ大体こんな感じ。

-   ユーザー名の指定
-   twittering-jojo-mode を有効化
-   自動リロードの間隔を60秒に設定
-   OAuth で認証するように設定
-   投稿時にミニバッファから投稿するように設定
-   各ツイートのフォーマット指定
-   旧式の Retweet 時のフォーマット指定
-   late limit をmode-line に表示


#### キーバインド {#キーバインド}

```emacs-lisp
(let ((km twittering-mode-map))
  (define-key km (kbd "SPC") 'scroll-up)
  (define-key km (kbd "b") 'scroll-down)
  (define-key km (kbd "g") 'beginning-of-buffer)
  (define-key km (kbd "G") 'end-of-buffer)
  (define-key km (kbd "<") 'beginning-of-buffer)
  (define-key km (kbd ">") 'end-of-buffer)
  (define-key km (kbd "R") 'twittering-current-timeline)
  (define-key km (kbd "F") 'twittering-favorite)
  (define-key km (kbd "\C-cfd") 'twittering-unfavorite)
  (define-key km (kbd "\C-c[") 'twittering-follow)
  (define-key km (kbd "\C-c]") 'twittering-unfollow)
  nil)
```

| Key     | 効果         |
|---------|------------|
| SPC     | スクロールする |
| b       | 上にスクロールする |
| g, &lt; | バッファの先頭に移動 |
| G, &gt; | バッファの末尾に移動 |
| R       | 現在のタイムラインを更新 |
| F       | ふぁぼる     |
| C-c f d | ふぁぼ取り消し |
| C-c [   | フォローする |
| C-c ]   | アンフォロー |


### wakatime-mode {#wakatime-mode}


#### 概要 {#概要}

[wakatime-mode](https://github.com/wakatime/wakatime-mode) は [WakaTime](https://wakatime.com) というサービスと連携するためのパッケージ。

WakaTime は自分がどのプロジェクトの作業をしているかを計測してくれるようなツール。普段の行動の改善に使えるかもしれないので、なんとなく連携してみている。


#### インストール {#インストール}

いつも通り el-get から入れている

```emacs-lisp
(el-get-bundle wakatime-mode)
```


#### APIキーの設定 {#apiキーの設定}

APIキーは .authinfo.gpg に保存しているのでそこから引っ張り出している。

```emacs-lisp
(custom-set-variables
 '(wakatime-api-key (funcall (plist-get (nth 0 (auth-source-search :host "wakatime.com" :max 1)) :secret))))
```


#### 有効化 {#有効化}

Emacs を使っている間は常に有効になっていて欲しいので
global-wakatime-mode を有効にしている。

```emacs-lisp
(global-wakatime-mode 1)
```

APIキーが取れてない時はやたらエラーを吐くので何かしら調整はしてもいいかもしれない。

```emacs-lisp
(if (boundp 'wakatime-api-key)
  (global-wakatime-mode 1))
```

みたいにして API キーが取れている時だけ有効にするとかね。


### ブラウザ設定 <span class="tag"><span class="unused">unused</span></span> {#browse-url}

browse-url の時の開くプログラムの指定。

```emacs-lisp
(setq browse-url-generic-program "vivaldi")
```

Vivaldi を指定しているが、最近 Emacs から何かブラウザ立ち上げても Firefox がいつも開いているし、この設定ほんとうに生きてる? って感じ。

WSL2 を入れてる Windows の方は Vivladi 入れてないし
Mac の方は入れてるけど別に Emacs から Vivaldi が立ち上がるのも観測してないしほんと謎……。


## org-mode {#org-mode}


### org-mode {#_index}

ここでは org-mode 周りの設定をまとめている。
org-mode だけでも書くことが多いからね……。

1.  [基本設定](#base)
2.  [org-babel](#org-babel)
3.  [予定のカレンダー表示](#calendar)
4.  [Agenda 関係の設定](#agenda)
5.  [org-capture](#org-capture)
6.  [org-clock](#org-clock)
7.  [org-export](#org-export)
8.  [org-gcal](#org-gcal)
9.  [org-ql](#org-ql)
10. [org-refile](#org-refile)
11. [org-trello](#org-trello)
12. [ox-hugo](#ox-hugo)
13. [org-mode 用の独自コマンド](#org-commands)
14. [org-mode 関係の keybinds](#org-mode-keybinds)
15. [日報用の設定(旧)](#nippou)


### 基本設定 {#base}


#### 概要 {#概要}

ここでは org-mode 周りのベースとなる設定を書いているつもり。といいつつ、まだ書き方が雑だなと思っている。またその内にでも修正しよう


#### org-mode のインストール {#org-mode-のインストール}

Emacs に標準で入っている org-mode は大体古過ぎるのでとりあえずデフォルトで入ってるやつは削除しちゃって
el-get でインストールしている。

```emacs-lisp
(el-get-bundle org-mode)
```

なんか入れてるパッケージの問題か、依存関係が解決できなかったので
Git から入れた上でバージョンを固定している。

バージョンぐらいはそのうち上げたいね


#### org 用ディレクトリの指定 {#org-用ディレクトリの指定}

org-mode のファイルを保存するデフォルトのディレクトリを指定している。

デフォルトだと `~/org` なのだけどホームディレクトリを汚したくないのと基本的に Mac を使ってるので `~/Documents/org` というディレクトリを用意してそこにファイルを置いている。

```emacs-lisp
(setq org-directory (expand-file-name "~/Documents/org/"))
```


#### タスク管理ファイルのフォルダの指定 {#タスク管理ファイルのフォルダの指定}

タスク管理ファイルがいくつかに分かれているがそれらをまとめて `~/Documents/org/tasks` フォルダに置いている。

```emacs-lisp
(setq my/org-tasks-directory (concat org-directory "tasks/"))
```

とりあえずこの `my/org-tasks-directory` という変数を用意することであちらこちらでこれを使い回している。


#### タスクの状態管理のキーワード指定 {#タスクの状態管理のキーワード指定}

org-mode といえば TODO 管理で使ってる人も多いと思う。自分も最初はそういう使い方から始めたし、今でもそれをメインにして使っている。

そして TODO の状態がデフォルトでは

-   TODO
-   DONE

の2つしかないけど、それでは足りないので昔見たインターネットのどこかの記事を参考に以下のように設定している。

```emacs-lisp
(setq org-todo-keywords
	  '((sequence "TODO" "EXAMINATION(e)" "READY(r)" "DOING(!)" "WAIT" "|" "DONE(!)" "SOMEDAY(s)")))
```

初期状態は TODO で、作業開始時点で DOING にして待ちが発生したら WAIT にして完了したら DONE にしている。

SOMEDAY は「いつかやる」に付与しているけど最近ほとんど使ってない。

org-todo-keywords は複数の sequence を指定したり
type を指定したりもできるがそこまでの活用ができていないので、どこかで見直したいですね。


#### 完了時間の記録 {#完了時間の記録}

org-clock を使うようにしているしあんまり要らない気がする。もしかしたら habits で必要かもしれないけど。

```emacs-lisp
(setq org-log-done 'time)
(setq org-log-into-drawer "LOGBOOK")
```


#### Excel ファイルを OS で指定したアプリで開く {#excel-ファイルを-os-で指定したアプリで開く}

org-mode のリンク先の拡張子が xlsx の時に OS 側で指定した標準アプリを開くようにしている。
Excel が入っていたらそっちで開かれるし、入ってなければ Numbers で開かれる。はず。

```emacs-lisp
(with-eval-after-load 'org
  (add-to-list 'org-file-apps '("\\.xlsx?\\'" . default)))
```

第二引数に default を指定すると、内部的には open コマンドが使われることを利用している。


### org-babel {#org-babel}


#### 概要 {#概要}

ここでは org-babel の設定をまとめている。


#### org-babel で評価可能な言語の指定 {#org-babel-で評価可能な言語の指定}

なんか普段から使いそうな奴をとりあえず選定しているつもり。

```emacs-lisp
(org-babel-do-load-languages 'org-babel-load-languages
							 '((plantuml . t)
							   (sql . t)
							   (gnuplot . t)
							   (emacs-lisp . t)
							   (shell . t)
							   (js . t)
							   (ruby . t)))
```

js, ruby
: 仕事でメインで使ってる言語なので入れている。

shell
: 入れてる方が便利そう、ぐらいの雑な理由。

sql
: メモしておいて手元から実行できると便利そう

plantuml
: 図の出力。一番使ってる。

gnuplot
: 趣味で入れてみているけど実際使う機会ほとんどないよなって気がしてきている。


#### org-babel-execute 後に画像を再表示 {#org-babel-execute-後に画像を再表示}

PlantUML の処理をすることが多いので以下の hook を設定することで実行後に画像を再表示するようにしている

```emacs-lisp
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
```


#### org-babel の非同期実行 <span class="tag"><span class="improvement">improvement</span></span> {#org-babel-の非同期実行}

非同期に org-babel の source を実行するために
[ob-async](https://github.com/astahlman/ob-async) を入れている

```emacs-lisp
(el-get-bundle ob-async)
(require 'ob-async)
```

で、ob-async を何のために入れているかというと PlantUML の図の出力である。画像まで作成するからね、時間かかりそうだしね。

そんで、その時に `org-plantuml-jar-path` を強制的に指定している。

```emacs-lisp
(add-hook 'ob-async-pre-execute-src-block-hook
	  '(lambda ()
		 (setq org-plantuml-jar-path "~/bin/plantuml.jar")))
```

多分 custom-set-variables でちゃんと設定したらいいんだろうなあ。


#### org-store-link 時に org-id が発行されるようにする {#org-store-link-時に-org-id-が発行されるようにする}

`org-id-link-to-org-use-id` を `t` にしていると
`org-store-link` を実行した時に自動で id を発行してそれを store してくれるようになる

```emacs-lisp
(custom-set-variables
 '(org-id-link-to-org-use-id t))
```


### 予定のカレンダー表示 {#calendar}


#### 概要 {#概要}

普段の予定をカレンダー表示で見れると嬉しいな〜と思って
[calfw](https://github.com/kiwanami/emacs-calfw) で予定が見れるようにしている。

が、今ここに書いているのはまだ設定の一部である。
agenda 部分と関わっていてまだうまく整理しきれてない。


#### 日本の休日 {#日本の休日}

calfw に日本の休日を表示できるように
[japanese-holidays](https://github.com/emacs-jp/japanese-holidays) を入れている。

```emacs-lisp
(el-get-bundle japanese-holidays)
(require 'japanese-holidays)
(setq calendar-holidays (append japanese-holidays))
```

もっとちゃんと設定したら Emacs のデフォルトのカレンダーでも休日表示がわかりやすくなって良いので今度設定し直す。

その時には多分 org-mode カテゴリではないところに移動するはず。


#### calfw {#calfw}

calfw を el-get で入れた上で、
org-mode と連携するように calfw-org も require している。

```emacs-lisp
(el-get-bundle calfw)
(require 'calfw)
(require 'calfw-org)
```

ここではまだこれ以上のことはしてない


### Agenda 関係の設定 {#agenda}


#### 概要 {#概要}

org-mode の素晴らしい機能の1つに Agenda というものがある。

これは色々な org ファイルに散らばった情報を1つのビューに表示するための機能で、使いこなすとファイルがバラけていてもいい感じに情報が抽出できて便利なやつ。

まあ麦汁さんはまだ使いこなせてないけど。

それでもいくつか Agenda 用の View を用意したりして日常業務に役立てている。


#### org-super-agenda のインストール {#org-super-agenda-のインストール}

org-mode のデフォルトの agenda だと表示周りが物足りなかったので
[org-super-agenda](https://github.com/alphapapa/org-super-agenda) を導入している。

```emacs-lisp
(el-get-bundle org-super-agenda)
```


#### 週の始まりを日曜日に設定 {#週の始まりを日曜日に設定}

麦汁さんは週のスタートを日曜日とする派なので
org-agenda の週の始まりも日曜日に設定している

```emacs-lisp
(setq org-agenda-start-on-weekday 0)
```


#### 1日単位をデフォルト表示に設定 {#1日単位をデフォルト表示に設定}

1週間表示よりも「今日って何するんだっけ」みたいな使い方が多いので
1日を表示単位としている。

```emacs-lisp
(setq org-agenda-span 'day)
```

週単位で何をするかについては今のところ記憶力で対応している。

あと、基本的にカスタムビューを使ってるのでこれの影響は受けてるかどうか微妙。


#### agenda の対象ファイルを指定 {#agenda-の対象ファイルを指定}

org-agenda を使う時に抽出対象とする org ファイルを指定している。

```emacs-lisp
(setq org-agenda-files
	  '("~/Documents/org/ical.org"
		"~/Documents/org/tasks/"))
```

けどカスタムビューを多用しているので多分この設定ちゃんと活かしてない。
ical.org とか更新してないし……。


#### agenda の表示周りの設定 {#agenda-の表示周りの設定}

<!--list-separator-->

-  agenda に時間の区切りを入れない

    `org-agenda-use-time-grid` を t にしていると
    10:00 とかのキリがいいところに区切り線を表示してくれるのだが日報提出時には邪魔だし、普段使いでもその区切り線はあっても邪魔っぽいので
    nil にして表示しないようにしている。

    ```emacs-lisp
    (setq org-agenda-use-time-grid nil)
    ```

<!--list-separator-->

-  ブロック間の区切り表示

    ブロックとブロックの区切りをハイフン繋ぎの文字列で指定している。

    文字列を指定することで固定の長さの区切り文字になるが実は `?-` とか指定して長さが無限に伸びるようにしてもいいかもしれない。と思いつつ、多分 zoom-mode とかでバッファの幅が切り替わる時に邪魔になるから固定でいいか。

    ```emacs-lisp
    (setq org-agenda-block-separator "------------------------------")
    ```

<!--list-separator-->

-  org-super-agnda-mode の有効化

    なんでここで有効化しているのかね。インストールのやつと近付けた方がいい気がする。

    とりあえず有効化して使えるようにしている。

    ```emacs-lisp
    (org-super-agenda-mode 1)
    ```

<!--list-separator-->

-  agenda で使う変数の初期化

    `my/org-agenda-calendar-files` という変数でカレンダーの情報を取り込んで agenda を表示できるようにしている。けど今はカレンダー連携をしていないので空で初期化している。

    ```emacs-lisp
    (setq my/org-agenda-calendar-files '())
    ```

<!--list-separator-->

-  カスタムビュー

    色々なカスタムビューを定義している。かといって全部使ってるわけではないし、つまり使いこなせているかというと微妙。

    | キー | 内容                           | 備考                                 |
    |----|------------------------------|------------------------------------|
    | hs | 稼動日の始業直後に実施する習慣タスクの表示 | よく使っている。その日やるタスクを決めたりしている |
    | hf | 稼動日の退勤直前に実施する習慣タスクの表示 | よく使っている。その日の日報を書くなどしている |
    | hw | 週間隔または隔週で実施する習慣タスクの表示 | 週1で使う感じ。この中に放置しているタスクもある |
    | hh | 休日の習慣タスク               | 最近使ってない。。。真面目にタスクを作り過ぎてだるくなってるやつ |
    | d  | 今日の予定などを表示           | 普段は会議部分しか見てないので改善が必要そう |
    | D  | 休日タスクの表示               | 使ってない。。。                     |
    | pp | GTD の Projects の表示         | たまに使う程度。もうちょっと洗練させたい |
    | pP | GTD の Projects の内、環境整備系以外 | 環境整備はやっても業務に直接寄与しないので忙しい時は見たくないでござる |
    | P  | GTD の Pointers の表示         | たまーに使う。資料が貯まり過ぎて取り扱いに困っている |
    | X  | 終了したタスクを表示           | まとめてお掃除する時に使っている     |
    | z  | 日報用表示                     | 毎日業務日報の提出が要求されているのでそれっぽく表示されるようにしている |
    | H  | GTD の Projects の中の家事を抽出 | 最近は使ってない                     |
    | EO | org-mode 関連の環境整備タスク  | 最近見てない                         |
    | EE | Emacs 関係かつ org-mode 以外の環境整備タスク | 貯まる一方                           |
    | Ee | Emacs 以外の環境整備タスク     | これも貯まる。Emacs 設定ほどじゃないけど |

    ```emacs-lisp
    (setq org-agenda-custom-commands
    '(("h" . "Habits")
      ("hs" "Weekday Start"
       ((tags "Weekday&Start|Daily"
    		  ((org-super-agenda-groups '((:name "予定が過ぎてる作業" :scheduled past)
    									  (:name "今日の作業" :scheduled today)
    									  (:discard (:anything t))))))))
      ("hf" "Weekday Finish"
       ((tags "Weekday&Finish"
    		  ((org-super-agenda-groups '((:name "予定が過ぎてる作業" :scheduled past)
    									  (:name "今日の作業" :scheduled today)
    									  (:discard (:anything t))))))))
      ("hw" "Weekly"
       ((tags "Weekly"
    		  ((org-super-agenda-groups '((:name "予定が過ぎてる作業" :scheduled past)
    									  (:name "今週の作業" :scheduled today)
    									  (:discard (:anything t))))))))
      ("hh" "Holiday"
       ((tags "Weekend|Holiday|Daily"
    		  ((org-super-agenda-groups '((:name "予定が過ぎてる作業" :scheduled past)
    									  (:name "今日の作業" :scheduled today)
    									  (:discard (:anything t))))))))
      ("d" "Today"
       ((agenda "会議など"
    			((org-agenda-span 'day)
    			 (org-agenda-files my/org-agenda-calendar-files)))
    	(alltodo ""
    			   ((org-agenda-prefix-format " ")
    				(org-agenda-overriding-header "予定作業")
    				(org-habit-show-habits nil)
    				(org-agenda-span 'day)
    				(org-agenda-todo-keyword-format "-")
    				(org-overriding-columns-format "%25ITEM %TODO")
    				(org-agenda-files '("~/Documents/org/tasks/projects.org"))
    				(org-super-agenda-groups '((:name "〆切が過ぎてる作業" :and (:deadline past :not (:category "Private")))
    										   (:name "予定が過ぎてる作業" :and (:scheduled past :not (:category "Private")))
    										   (:name "今日〆切の作業" :and (:deadline today :not (:category "Private")))
    										   (:name "今日予定の作業" :and (:scheduled today :not (:category "Private")))
    										   ;; (:name "今後1週間の作業" :and (:and (:scheduled (before ,(format-time-string "%Y-%m-%d" (time-add (current-time) (* 60 60 24 7)))) (:scheduled (after (format-time-string "%Y-%m-%d" (current-time))))) :not (:category "Private")))
    										   (:discard (:anything t))))))
    	(tags-todo "-Weekday-Daily-Holiday-Weekly-Weekend"
    			   ((org-agenda-prefix-format " ")
    				(org-agenda-overriding-header "今日の作業")
    				(org-habit-show-habits nil)
    				(org-agenda-span 'day)
    				(org-agenda-todo-keyword-format "-")
    				(org-overriding-columns-format "%25ITEM %TODO")
    				(org-agenda-files '("~/Documents/org/tasks/next-actions.org"))
    				(org-super-agenda-groups '((:name "仕掛かり中" :todo "DOING")
    										   (:name "TODO" :todo "TODO")
    										   (:name "待ち" :todo "WAIT")
    										   (:discard (:anything t))))))
    	(tags-todo "Weekday-Finish|Daily"
    			   ((org-agenda-overriding-header "習慣")
    				(org-habit-show-habits t)
    				(org-agenda-files '("~/Documents/org/tasks/next-actions.org"))
    				(org-super-agenda-groups '((:name "予定が過ぎてる作業" :scheduled past)
    										   (:name "今日予定" :scheduled today)
    										   (:discard (:anything t))))))))
      ("D" "Holiday"
       ((tags-todo "-Weekday-Daily-Holiday-Weekly-Weekend"
    			   ((org-agenda-prefix-format " ")
    				(org-agenda-overriding-header "休日の作業")
    				(org-habit-show-habits nil)
    				(org-agenda-span 'day)
    				(org-agenda-todo-keyword-format "-")
    				(org-overriding-columns-format "%25ITEM %TODO")
    				(org-agenda-files '("~/Documents/org/tasks/next-actions.org"))
    				(org-super-agenda-groups '((:name "仕掛かり中" :todo "DOING")
    										   (:name "TODO" :todo "TODO")
    										   (:name "待ち" :todo "WAIT")
    										   (:discard (:anything t))))))
    	(tags-todo "Holiday|Weekend|Daily"
    			   ((org-agenda-overriding-header "習慣")
    				(org-agenda-files '("~/Documents/org/tasks/next-actions.org"))
    				(org-super-agenda-groups '((:name "予定が過ぎてる作業" :scheduled past)
    										   (:name "今日予定の作業" :scheduled today)
    										   (:discard (:anything t))))))))
      ("p" . "Projects")
      ("pp" "Projects"
       ((alltodo "" ((org-agenda-prefix-format " ")
    				 (org-agenda-overriding-header "今日のタスク")
    				 (org-habit-show-habits nil)
    				 (org-agenda-span 'day)
    				 (org-agenda-todo-keyword-format "-")
    				 (org-overriding-columns-format "%25ITEM %TODO")
    				 (org-agenda-files '("~/Documents/org/tasks/next-actions.org"))
    				 (org-super-agenda-groups (append
    										   (mapcar (lambda (key) `(:name ,key :and (:category ,key :todo ("DOING" "WAIT")))) (if (boundp 'my/nippou-categories) my/nippou-categories nil))
    										   '((:name "その他" :scheduled nil)
    											 (:discard (:anything t)))))))
    	(alltodo "" ((org-agenda-prefix-format " ")
    				 (org-agenda-overriding-header "予定に入ってる作業")
    				 (org-habit-show-habits nil)
    				 (org-agenda-span 'day)
    				 (org-agenda-todo-keyword-format "-")
    				 (org-overriding-columns-format "%25ITEM %TODO")
    				 (org-agenda-files '("~/Documents/org/tasks/projects.org"))
    				 (org-super-agenda-groups '((:name "〆切が過ぎてる作業" :deadline past)
    											(:name "予定が過ぎてる作業" :scheduled past)
    											(:name "今日〆切の作業" :deadline today)
    											(:name "今日予定の作業" :scheduled today)
    											(:discard (:anything t))))))
    	(todo "DOING" ((org-agenda-files '("~/Documents/org/tasks/projects.org"))))
    	(todo "TODO"  ((org-agenda-files '("~/Documents/org/tasks/projects.org"))))))
      ("pP" "Projects without Env"
       ((alltodo "" ((org-agenda-prefix-format " ")
    				 (org-agenda-overriding-header "今日のタスク")
    				 (org-habit-show-habits nil)
    				 (org-agenda-span 'day)
    				 (org-agenda-todo-keyword-format "-")
    				 (org-overriding-columns-format "%25ITEM %TODO")
    				 (org-agenda-files '("~/Documents/org/tasks/next-actions.org"))
    				 (org-super-agenda-groups (append
    										   (mapcar (lambda (key) `(:name ,key :and (:category ,key :todo ("DOING" "WAIT")))) (if (boundp 'my/nippou-categories) my/nippou-categories nil))
    										   '((:name "その他" :scheduled nil)
    											 (:discard (:anything t)))))))
    	(alltodo "" ((org-agenda-prefix-format " ")
    				 (org-agenda-overriding-header "予定に入ってる作業")
    				 (org-habit-show-habits nil)
    				 (org-agenda-span 'day)
    				 (org-agenda-todo-keyword-format "-")
    				 (org-overriding-columns-format "%25ITEM %TODO")
    				 (org-agenda-files '("~/Documents/org/tasks/projects.org"))
    				 (org-super-agenda-groups '((:name "〆切が過ぎてる作業" :deadline past)
    											(:name "予定が過ぎてる作業" :scheduled past)
    											(:name "今日〆切の作業" :deadline today)
    											(:name "今日予定の作業" :scheduled today)
    											(:discard (:anything t))))))
    	(tags-todo "-Emacs-org-Env-Hugo" ((org-agenda-files '("~/Documents/org/tasks/projects.org"))))))
      ("P" "Pointers"
       ((todo "DOING" ((org-agenda-files '("~/Documents/org/tasks/pointers.org"))))
    	(todo "TODO"  ((org-agenda-files '("~/Documents/org/tasks/pointers.org"))))))
      ("X" "Finished"
       ((todo "DONE"    ((org-agenda-files '("~/Documents/org/tasks/projects.org"
    										 "~/Documents/org/tasks/inbox.org"
    										 "~/Documents/org/tasks/shopping.org"
    										 "~/Documents/org/tasks/next-actions.org"))))
    	(todo "SOMEDAY" ((org-agenda-files '("~/Documents/org/tasks/projects.org"
    										 "~/Documents/org/tasks/inbox.org"
    										 "~/Documents/org/tasks/shopping.org"
    										 "~/Documents/org/tasks/next-actions.org"))))))

      ("z" "日報"
       ((agenda "" ((org-agenda-span 'day)
    				(org-agenda-overriding-header "")
    				(org-habit-show-habits nil)
    				(org-agenda-format-date "## %Y/%m/%d (%a) 日報")
    				(org-agenda-prefix-format " %?-12t")
    				(org-agenda-files my/org-agenda-calendar-files)
    				(org-super-agenda-groups
    				 '((:name "会議など" :time-grid t)
    				   (:discard (:anything t))))))
    	(todo "DONE" ((org-agenda-prefix-format " ")
    				  (org-agenda-overriding-header "対応済")
    				  (org-habit-show-habits nil)
    				  (org-agenda-span 'day)
    				  (org-agenda-todo-keyword-format "-")
    				  ;; (org-overriding-columns-format "%25ITEM %TODO %CATEGORY")
    				  (org-columns-default-format-for-agenda "%25ITEM %TODO %3PRIORITY")
    				  (org-agenda-files '("~/Documents/org/tasks/next-actions.org"))
    				  (org-super-agenda-groups (append
    											(mapcar (lambda (key) `(:name ,key :and (:category ,key :todo ("DONE")))) (if (boundp 'my/nippou-categories) my/nippou-categories nil))
    											'((:discard (:anything t :name "discard")))))))
    	(alltodo "" ((org-agenda-prefix-format " ")
    				 (org-agenda-overriding-header "仕掛かり中")
    				 (org-habit-show-habits nil)
    				 (org-agenda-span 'day)
    				 (org-agenda-todo-keyword-format "-")
    				 (org-overriding-columns-format "%25ITEM %TODO")
    				 (org-agenda-files '("~/Documents/org/tasks/next-actions.org"))
    				 (org-super-agenda-groups (append
    										   (mapcar (lambda (key) `(:name ,key :and (:category ,key :todo ("DOING" "WAIT")))) (if (boundp 'my/nippou-categories) my/nippou-categories nil))
    										   '((:discard (:anything t :name "discard")))))))))

      ("H" "HouseWork" ((tags "HouseWork")))
      ("E" . "Env")
      ("EO" "org"
       ((tags-todo "+org"
    			   ((org-agenda-files '("~/Documents/org/tasks/projects.org"
    									"~/Documents/org/tasks/inbox.org"))))))
      ("EE" "Emacs without org"
       ((tags-todo "+Emacs-org"
    			   ((org-agenda-files '("~/Documents/org/tasks/projects.org"
    									"~/Documents/org/tasks/inbox.org"))))))
      ("Ee" "without Emacs"
       ((tags-todo "+Env-Emacs-org"
    			   ((org-agenda-files '("~/Documents/org/tasks/projects.org"
    									"~/Documents/org/tasks/inbox.org"))))))))
    ```


### org-capture {#org-capture}


#### 概要 {#概要}

org-capture は org-mode 用にさくっとメモを取るための機能。


#### org-capture-ical-file <span class="tag"><span class="unused">unused</span></span> {#org-capture-ical-file}

<https://qiita.com/takaxp/items/0b717ad1d0488b74429d> を参考に設定したやつ。

今は別で Google Calendar 連携しているので使ってない……。

```emacs-lisp
;; org-capture
(defvar org-capture-ical-file (concat org-directory "ical.org"))
(setq org-capture-ical-file (concat org-directory "ical.org"))
```


#### capture 用ファイルを変数定義 <span class="tag"><span class="improvement">improvement</span></span> {#capture-用ファイルを変数定義}

変数定義しなくてもいい気がしないでもないけどとりあえず変数定義している。バラバラの変数にするよりも alist とか plist とかにする方が適切な気がする

```emacs-lisp
(setq my/org-capture-interrupted-file  (concat my/org-tasks-directory "interrupted.org"))
(setq my/org-capture-inbox-file        (concat my/org-tasks-directory "inbox.org"))
(setq my/org-capture-pointers-file     (concat my/org-tasks-directory "pointers.org"))
(setq my/org-capture-impediments-file  (concat org-directory "work/scrum/impediments.org"))
(setq my/org-capture-memo-file         (concat org-directory "memo.org"))
(setq my/org-capture-sql-file          (concat org-directory "work/sql.org"))
(setq my/org-capture-shopping-file     (concat my/org-tasks-directory "shopping.org"))
(setq my/org-capture-2020-summary-file (concat org-directory "private/2020_summary.org"))
```


#### テンプレートの定義 {#テンプレートの定義}

上記の変数を使って capture 用テンプレートを登録している。

| Key | 効果                                 | 備考                                                                                                    |
|-----|------------------------------------|-------------------------------------------------------------------------------------------------------|
| g   | GTD でとりあえず最初に放り込む Inbox に相当するファイルに登録 | Why?, Goal, How? 等の欄を設けることでそのタスクの諸々をハッキリさせようとしている                       |
| m   | とりあえずメモっておきたいやつを放り込む | 最近使ってない。使いにくいのかも                                                                        |
| p   | 資料を放り込むやつ                   | あとで読むリストになってる。読み終わっても、便利そうなのは DONE のまま置いている                        |
| i   | 割込みタスクの登録                   | [org-modeで割り込みにも対応した時間記録をとる方法](https://grugrut.hatenablog.jp/entry/2016/03/13/085417) のやつを流用している。たまに使う。 |
| I   | 開発を進める上での障害をリストアップする用 | 最近使ってない。溜めても振り替えってないので溜める気すらなくなった                                      |
| R   | 2020年の振り返り用                   | もう2020年は過去の話なので不要でしょ                                                                    |
| s   | SQL 用のメモに登録                   | さくっと書いた SQL を後からまた使えないかな〜と思って溜めてみている                                     |
| S   | 買物リストに登録                     | Inbox から refile でもいい気がする                                                                      |
| b   | Blogネタにエントリー                 | 最近使ってない……。ブログ止まってるしな。                                                              |
| P   | Firefox からページの一部を資料として放り込む用 | <https://github.com/sprig/org-capture-extension> 関係。Win では設定できてない                           |
| L   | Firefox からページURLを資料として放り込む用 | <https://github.com/sprig/org-capture-extension> 関係。Win では設定できてない                           |
| c   | スケジュール管理用ファイルに登録     | 使ってない。対象ファイルを変えて使ってみてもいいかも                                                    |

```emacs-lisp
(setq org-capture-templates
	  `(("g" "Inbox にエントリー" entry
		 (file ,my/org-capture-inbox-file)
		 "* TODO %?\n** Ready の定義
   - Why?, Goal, How? が埋められていること
   - How がある程度具体的に書かれていること
** Why?
** Info
** Goal
** How?
** Result
\t")
		("m" "Memoにエントリー" entry
		 (file+headline ,my/org-capture-memo-file "未分類")
		 "*** %?\n\t")
		("p" "Pointersにエントリー" entry
		 (file+headline ,my/org-capture-pointers-file "Pointers")
		 "** %?\n\t")
		("i" "割り込みタスクにエントリー" entry ;; 参考: http://grugrut.hatenablog.jp/entry/2016/03/13/085417
		 (file+headline ,my/org-capture-interrupted-file "Interrupted")
		 "** %?\n\t" :clock-in t :clock-resume t)
		("I" "障害リストにエントリー" entry
		 (file+headline ,my/org-capture-impediments-file "Impediments")
		 "** TODO %?\n\t")
		("R" "2020ふりかえりにエントリー" entry
		 (file+headline ,my/org-capture-2020-summary-file "Timeline")
		 "** %?\n\t")
		("s" "SQL にエントリー" entry
		 (file+headline ,my/org-capture-sql-file "SQL")
		 "** %?\n\t")
		("S" "買い物リストエントリー" entry
		 (file ,my/org-capture-shopping-file)
		 "* TODO %?\n\t")
		("b" "Blogネタにエントリー" entry
		 (file+headline ,my/org-capture-memo-file "Blogネタ")
		 "** %?\n\t")
		("P" "Protocol" entry
		 (file+headline ,my/org-capture-pointers-file "Pointers")
		 "** %?\n   #+BEGIN_QUOTE\n   %i\n   #+END_QUOTE\n\n   Source: %u, [[%:link][%:description]]\n")
		("L" "Protocol Link" entry
		 (file+headline ,my/org-capture-pointers-file "Pointers")
		 "** %:description\n   %:link\n   %?\n   Captured On: %U")
		("c" "同期カレンダーにエントリー" entry
		 (file+headline ,org-capture-ical-file "Schedule")
		 "** TODO %?\n\t")))
```


### org-clock {#org-clock}


#### 概要 {#概要}

org-clock 関係の設定をここにまとめている


#### clocktable の設定 {#clocktable-の設定}

clocktable は report 表示などで使う表の設定。

```emacs-lisp
(setq org-clock-clocktable-default-properties
	  '(:maxlevel 10
				 :lang "ja"
				 :scope agenda-with-archives
				 :block today
				 :level 4))
```

| 項目名   | 設定内容                                |
|-------|-------------------------------------|
| maxlevel | ツリーの何段目まで表示するかの設定。隠さないで欲しいので大きい値を指定している |
| lang     | 日本語ネイティブなので日本語で          |
| scope    | agenda とそのアーカイブもチェック。結構するアーカイブするので |
| block    | 基本的に退勤前に実行するので today にしている |
| level    | 最低限表示するレベル。まあ適当          |


#### hooks {#hooks}

<!--list-separator-->

-  clock-in 時の hook

    clock-in のタイミングで以下の処理をするための hook を用意している

    -   作業開始したことを Slack 通知する
    -   TODO ステータスを DOING に変更

    <!--listend-->

    ```emacs-lisp
    (defun my/org-clock-in-hook ()
      (let* ((task org-clock-current-task)
    		 (message (format "開始: %s" task)))
    	(my/notify-slack-times message))

      (if (org-clocking-p)
    	  (org-todo "DOING")))

    (setq org-clock-in-hook 'my/org-clock-in-hook)
    ```

<!--list-separator-->

-  clock-out 時の hook

    clock-out のタイミングで以下の処理をするための hook を用意している

    -   作業終了を Slack 通知する
        -   中断でも終了扱いになるのでちょっと悩み中。DONE にしたことを hook する必要があるかも。

    <!--listend-->

    ```emacs-lisp
    (defun my/org-clock-out-hook ()
      (let* ((task org-clock-current-task)
    		 (message (format "終了: %s" task)))
    	(my/notify-slack-times message)))

    (setq org-clock-out-hook 'my/org-clock-out-hook)
    ```


#### org-pomodoro {#org-pomodoro}

ポモドーロテクニックを使うために org-pomodoro を導入している

```emacs-lisp
(el-get-bundle org-pomodoro)
```

そして以下の設定をしている

-   sound は結構邪魔なのでそれは鳴らないようにしている
-   デフォルトの 25 分だと短かいので倍の 50 分にしている
    -   25 分だとノって来た時に終わるので集中できない
-   それに合わせて short break も倍にしている
    -   10 分休めると間で色々できて便利。Emacs のパッケージ更新とか。
-   long break も通常の 1.5 倍にしている
    -   とはいえ long break になる頃は定時が近いので無視しがち

<!--listend-->

```emacs-lisp
(custom-set-variables
 '(org-pomodoro-play-sounds nil)
 '(org-pomodoro-length 50)
 '(org-pomodoro-short-break-length 10)
 '(org-pomodoro-long-break-length 30))
```

今のところこの運用で大体うまくいってて良い


### org-export {#org-export}


#### 概要 {#概要}

ここではファイルへの出力用の設定をまとめている。というか昔書いた設定をとりあえずここに押し込めている


#### footnote や制作者などを出力しない {#footnote-や制作者などを出力しない}

HTML で記事を吐き出す時に邪魔だったの非表示にしている記憶。随分昔に設定したのであんまり覚えてない。

```emacs-lisp
;; フッターなくしたり
(setq org-export-html-footnotes-section "")
(setq org-export-html-footnote-format "")
(setq org-export-with-footnotes nil)
(setq org-export-with-creator nil)
(setq org-export-with-author nil)
(setq org-html-validation-link nil)
```

以下は seesaa blog への吐き出し用設定なのだけどもう向こうを更新することはないので消しても良さそう

```emacs-lisp
;; for seesaa blog settings
(setq org-export-author-info nil)
(setq org-export-email-info nil)
(setq org-export-creator-info nil)
(setq org-export-time-stamp-file nil)
(setq org-export-with-timestamps nil)
(setq org-export-with-section-numbers nil)
(setq org-export-with-sub-superscripts nil)
```


#### Table of Contents 出力抑制 {#table-of-contents-出力抑制}

これも自分の用途では要らなかったけどファイル単位とかで制御しても良い気がする

```emacs-lisp
(setq org-export-with-toc nil)
```


#### サイト名の出力 {#サイト名の出力}

seesaa blog 用に記事を吐き出していた時はページ全体ではなく記事部分だけ出力したかったのでつまり h1 とかはもうテンプレート側に埋め込まれているので出す必要がなかった

というわけで h1 でサイト名を出さないようにしている

```emacs-lisp
(setq org-export-html-preamble nil)
(setq org-html-preamble nil)
```


#### bold, italic などの抑制 {#bold-italic-などの抑制}

アスタリスクで囲ったりスラッシュでアンダースコアで囲ったりすると
b タグや i タグ、 u タグにする機能があるが
HTML 4.01 Strict 信者だったこともあって抑制している。

アスタリスクで囲む時、重要と思って囲むので、そういう意味では em とかで出る方が適切だと思う。

```emacs-lisp
;;; *bold* とか /italic/ とか _underline_ とかを<b>とかにしないようにする
(setq org-export-with-emphasize nil)
```


#### export のデフォルト出力言語は日本語 {#export-のデフォルト出力言語は日本語}

まあ日本語しか書かないので……

```emacs-lisp
(setq org-export-default-language "ja")
```


### org-gcal <span class="tag"><span class="replacement">replacement</span></span> {#org-gcal}


#### 概要 {#概要}

[org-gcal](https://github.com/kidd/org-gcal.el) は org-mode と Google Calendar を連携させるためのパッケージ。

オリジナルは <https://github.com/myuhe/org-gcal.el> なのだけど今は fork されてるやつが MELPA にも登録されていて
el-get のレシピもそっちを見ている。


#### インストール {#インストール}

org-gcal が依存しているので [parsist](https://elpa.gnu.org/packages/persist.html) を入れている。

```emacs-lisp
(el-get-bundle persist)
```

あとは当然 org-gcal 本体を入れないと動かない

```emacs-lisp
(el-get-bundle org-gcal)
```


#### 設定 {#設定}

とりあえず require をしないといけない

```emacs-lisp
(require 'org-gcal)
```

あとは設定ファイルは公開したくないので別ファイルに分けてる。

```emacs-lisp
(my/load-config "my-org-gcal-config")
```

隠したい部分だけ .authinfo.gpg にでも分離したら公開できるようになるかもしれない。


#### appt {#appt}

Emacs にはデフォルトで約束の通知ができる機能が appt.el で定義されている。
org-gcal で取得したデータをそれで通知できるように
appt の設定をここで行っている

<!--list-separator-->

-  通知形式の設定

    window 通知を使う設定にしている。

    ```emacs-lisp
    (setq appt-display-format 'window)
    ```

    これだけだと、通知する時間になったらピョコッと window が生えて来るのだけど、後の方で、この設定の時に使う関数を差し替えている

<!--list-separator-->

-  通知用関数の定義

    通知には [alert.el](#alert) を使いたいので自前で関数を定義。
    alert.el は別のところで設定していてそこで dunst を使って通知するようにしている。

    ```emacs-lisp
    (defun my/appt-alert (min-to-app _new-time msg)
      (interactive)
      (let ((title (format "あと %s 分" min-to-app)))
    	(alert msg :title title)))
    ```

    この関数を使うように `appt-disp-window-function` を変更している。

    ```emacs-lisp
    (setq appt-disp-window-function 'my/appt-alert)
    ```


#### その他 {#その他}

[gcal-org](https://github.com/misohena/gcal) に乗り換えようかと思ってるがそっちの中身もよくわからないので躊躇している。自分の用途に合うのだろうか?


### org-ql <span class="tag"><span class="unused">unused</span></span> {#org-ql}


#### 概要 {#概要}

[org-ql](https://github.com/alphapapa/org-ql) は org-mode の情報を検索するためのパッケージ。柔軟な検索ができるようになるので貴方好みの検索で業務効率向上ができちゃうかも!?


#### インストール {#インストール}

いつも透り el-get でインストールしている

```emacs-lisp
(el-get-bundle org-ql)
```


#### その他 {#その他}

一時期は色々試していたけどこれを利用している org-super-agenda の方でなんとかするようにしたのでもう直接は使ってないでござる


### org-refile {#org-refile}


#### 概要 {#概要}

org-refile は org-mode の1機能で
org-mode のエントリを別のファイルなどに移動するための機能。実はコピーもできるけど、コピーは使ったことがない。


#### 設定 {#設定}

<!--list-separator-->

-  org ファイル内の階層を選択候補に入れる

    これを nil に設定することでファイルの選択だけでなく、その中の PATH まで選択できるようになる

    ```emacs-lisp
    (setq org-outline-path-complete-in-steps nil)
    ```

<!--list-separator-->

-  refile ターゲットにファイル名を含める

    以下のように設定すると
    refile のターゲット候補としてファイル名とその中の PATH が表示されるようになる。

    ```emacs-lisp
    (setq org-refile-use-outline-path 'file)
    ```

    nil だと移動先候補PATHの最後の部分しか表示されないのでどのファイルのどの場所かというのがわかりにくいのでこのように設定している。

<!--list-separator-->

-  refile 先の候補設定

    いくつかの org ファイルを使っているのでターゲットを以下のように設定している。

    ```emacs-lisp
    (setq org-refile-targets `((,(concat org-directory "tasks/projects.org") :level . 1)
    						   (,(concat org-directory "tasks/pointers.org") :level . 1)
    						   (,(concat org-directory "work/scrum/impediments.org") :level . 3)
    						   (,(concat org-directory "tasks/next-actions.org") :regexp . "today")
    						   (,(concat org-directory "tasks/next-actions.org") :regexp . "C-")
    						   (,(concat org-directory "private/2020_summary.org") :level . 2)
    						   (,(concat org-directory "tasks/shopping.org") :level . 1)
    						   (,(concat org-directory "tasks/someday.org") :level . 1)))
    ```

    | ターゲット         | 目的                                                             |
    |---------------|----------------------------------------------------------------|
    | projects.org       | とりあえずその内やるタスクを放り込むところ。Work, Private の階層を設けているので `:level 2` としている |
    | pointers.org       | 読物を突っ込むところとしている。                                 |
    | impediments.org    | スクラムの妨害リストでも作ってみようかと思って用意したやつ。放置中 |
    | next-actions today | その日やる作業を放り込むところ。projects や inbox から移動する時に使う。 |
    | next-actions C-    | いくつかの作業を各階層に分けて管理しようとしていたのでターゲット指定している。放置中。 |
    | 2020_summary.org   | 2020 年の個人ふりかえり用。もう 2020 年は大昔なので当然もう使っていない |
    | shopping.org       | 買物リスト。時々思い出した時に放り込んでるが主に使うのは beorg からなので refile では使ってない |
    | someday.org        | 遠い将来やるかもしれないリスト。放り込んで忘れるためにあるところ |


### org-trello {#org-trello}


#### 概要 {#概要}

[org-trello](https://org-trello.github.io/) は org-mode を使って Trello のタスクを管理するためのパッケージ。


#### インストール {#インストール}

いつも通り el-get でインストールしている

```emacs-lisp
(el-get-bundle org-trello)
```


#### 同期するコマンドの用意 {#同期するコマンドの用意}

バッファと Trello との同期する関数はあるのだけどコマンドにはなっていなかったので同期するためのコマンドを用意している

```emacs-lisp
(defun my/org-trello-fetch-buffer ()
  (interactive)
  (org-trello-sync-buffer t))
```


#### キーバインド設定 {#キーバインド設定}

キーバインドは覚えられないので、いつも通り [pretty-hydra](https://github.com/jerrypnz/major-mode-hydra.el#pretty-hydra) で Hydra のやつを用意している

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define
	org-trello-hydra
	(:separator "-"
				:color teal
				:foreign-key warn
				:title (concat (all-the-icons-faicon "trello") "  Org Trello commands")
				:quit-key "q")
	("Install"
	 (("i" org-trello-install-board-metadata "Board metadata")
	  ("I" org-trello-install-key-and-token "Setup"))

	 "Sync"
	 (("s" my/org-trello-fetch-buffer "← Trello")
	  ("S" org-trello-sync-buffer "→ Trello"))

	 "Other"
	 (("V" org-trello-version "Version")))))
```

| Key | 効果                  |
|-----|---------------------|
| i   | Board のメタデータをインストールする |
| I   | Key と トークンを設定する |
| s   | Trello の情報を引っ張ってくる |
| S   | Trello の情報を連携する |
| V   | バージョン情報を表示  |


#### その他 {#その他}

まだ試していないが
<https://github.com/gizmomogwai/org-kanban>
と組み合わせるとビジュアル的に見れて嬉しいとかあるかもしれない


### ox-hugo {#ox-hugo}


#### 概要 {#概要}

[ox-hugo](https://ox-hugo.scripter.co/) は org-mode から Hugo 用に md ファイルを出力できる便利なやつ。

設定にもよるけど、1つのorgファイルに全部の記事を書いておいてツリー毎に md ファイルが生成される、というのがデフォルトの動きなので
1ファイルに詰めておくとファイルが分散しないで済んで良い。

なお、この [麦汁's Emacs Config](#top) も親サイトである [麦汁三昧](https://mugijiru.github.io/.emacs.d/) も
ox-hugo を用いて構築している


#### インストール・読み込み {#インストール-読み込み}

いつも通り el-get でインスコしている。

```emacs-lisp
(el-get-bundle ox-hugo)
```

そして org-mode の ox が先に読まれてないといけないので
with-eval-after-load を使って、ox が読まれてから require するようにしている。

```emacs-lisp
(with-eval-after-load 'ox
  (require 'ox-hugo))
```


#### その他 {#その他}

デフォルト設定でいい感じに使えているので特に設定変更は加えていない。


### org-mode 用の独自コマンド {#org-commands}


#### 概要 {#概要}

org-mode を使う上で、標準で用意されているコマンド以外に自分でも適当にコマンドを用意しているのでここにまとめている。


#### org-mode 用のファイルを作成するコマンド <span class="tag"><span class="unused">unused</span></span> {#org-mode-用のファイルを作成するコマンド}

指定したフォルダに org-mode なファイルを作るためのコマンドを用意している。

が、使ってないし意味をあまり感じないし消して良さそう。

```emacs-lisp
(setq my/org-document-dir (expand-file-name "~/Documents/org/"))
(defun my/create-org-document ()
  (interactive)
  (find-file-other-window my/org-document-dir))
```


#### 各ツリーの所要時間表示/非表示切替 {#各ツリーの所要時間表示-非表示切替}

org-clock-display で各ツリーにおける org-clock で記録された所要時間が表示でき、
org-clock-remove-overlays でそれを非表示にできるが、それを Toggle できるようにコマンド/関数を定義している。

```emacs-lisp
(defun my/org-clock-toggle-display ()
  "各ツリーの末尾に掛かった作業時間を表示/非表示を切り替えるコマンド"
  (interactive)
  (if org-clock-overlays
	  (org-clock-remove-overlays)
	(org-clock-display)))
```


#### org-todo-keywords から装飾を省いた文字列のリストを返す関数 {#org-todo-keywords-から装飾を省いた文字列のリストを返す関数}

ivy で org-todo-keywords を選択可能にするために
org-todo-keywords を加工してシンプルな文字列の配列にする関数を定義している。

後述の `my/org-todo` で利用している

```emacs-lisp
(defun my/org-todo-keyword-strings ()
  "org-todo-keywords から装飾を省いた文字列のリストを返す関数"
  (let* ((keywords (cl-rest (cl-first org-todo-keywords)))
		 (without-delimiter (cl-remove-if (lambda (elm) (string= "|" elm))
										  keywords)))
	(mapcar (lambda (element)
			  (replace-regexp-in-string "\(.+\)" "" element))
			without-delimiter)))
```


#### Ivy で TODO ステータスを選択し設定するコマンド {#ivy-で-todo-ステータスを選択し設定するコマンド}

標準の org-todo だと画面がガチャガチャ動くのが気になったので
ivy で選択できるようにしている。

```emacs-lisp
(defun my/org-todo ()
  "ivy で TODO ステータスを切り替えるためのコマンド
Hydra から利用するために定義している。"
  (interactive)
  (ivy-read "Org todo: "
			(my/org-todo-keyword-strings)
			:require-match t
			:sort nil
			:action (lambda (keyword)
					  (org-todo keyword))))
```


#### タグ選択でそのタグがついたヘッドラインをリスト表示 {#タグ選択でそのタグがついたヘッドラインをリスト表示}

タグ毎に見たいことがありそうなので用意したやつ。存在を忘れてしまっていたのであまり使ってない。

カスタムアジェンダを頑張る方が良い気もする

```emacs-lisp
(defun my/org-tags-view-only-todo ()
  (interactive)
  (org-tags-view t))
```


#### org-gcal で取得した情報を appt に登録 {#org-gcal-で取得した情報を-appt-に登録}

appt.el で通知されるように登録する必要があるのでコマンドを定義している。

```emacs-lisp
(defun my/org-gcal-refresh-appt ()
  (interactive)
  (let ((org-agenda-files my/org-agenda-calendar-files))
	(org-agenda-to-appt t)))
```


#### calfw で選択したカレンダーを表示 {#calfw-で選択したカレンダーを表示}

```emacs-lisp
(defun my/open-calendar ()
  (interactive)
  (ivy-read "Calendar: "
			my/calendar-targets
			:require-match t
			:sort nil
			:action (lambda (target)
					  (progn
						(setq cfw:org-icalendars `(,(concat org-directory target ".org")))
						(cfw:open-org-calendar)))))
```


#### レビュー依頼がされてる PR を取得してバッファに挿入 {#レビュー依頼がされてる-pr-を取得してバッファに挿入}

review-requested-prs というコマンドでレビュー対象の PR を取得できるようにしているのでそれを Emacs から叩けるようにしているコマンド。

```emacs-lisp
(defun my/insert-review-requested-prs-as-string ()
  (interactive)
  (let* ((cmd (concat "review-requested-prs " my/github-organization " " my/github-repository))
		 (response (shell-command-to-string cmd)))
	(insert response)))
```

実際のところこの Emacs のコマンドは使わず
Terminal で review-requested-prs というコマンドを直で叩いているから何かしら工夫が必要そうである。

あと、そもそも既にバッファにあるやつとマージしたいとか色々やりたいことはあるのでそれをなんとかしたいですね。


### org-mode 関係の keybinds {#org-mode-keybinds}


#### 概要 {#概要}

ここでは org-mode 関係のキーバインド設定を書いている。キーバインドというか Hydra の設定になっているが。

Hydra を定義しておくことで様々なキーバインドを忘れることができるし左手小指を酷使しなくて済むので便利ということで Hydra で設定している。


#### major-mode-hydra {#major-mode-hydra}

major-mode-hydra で、org-mode のファイルを開いている時によく使いそうなコマンドのキーバインドを定義している

```emacs-lisp
(with-eval-after-load 'major-mode-hydra
  (major-mode-hydra-define org-mode (:separator "-" :quit-key "q" :title (concat (all-the-icons-fileicon "org") " Org commands"))
	("Insert"
	 (("l" org-insert-link                     "Link")
	  ("T" org-insert-todo-heading             "Todo")
	  ("h" org-insert-heading-respect-content  "Heading")
	  ("P" org-set-property                    "Property")
	  ("." org-time-stamp                      "Timestamp")
	  ("!" org-time-stamp-inactive             "Timestamp(inactive)")
	  ("S" org-insert-structure-template       "Snippet"))

	 "Edit"
	 (("a" org-archive-subtree  "Archive")
	  ("r" org-refile           "Refile")
	  ("Q" org-set-tags-command "Tag"))

	 "View"
	 (("N" org-toggle-narrow-to-subtree "Toggle Subtree")
	  ("C" org-columns "Columns")
	  ("D" my/org-clock-toggle-display  "Toggle Display"))

	 "Task"
	 (("s" org-schedule         "Schedule")
	  ("d" org-deadline         "Deadline")
	  ("t" my/org-todo          "Change state")
	  ("c" org-toggle-checkbox  "Toggle checkbox"))

	 "Clock"
	 (("i" org-clock-in      "In")
	  ("o" org-clock-out     "Out")
	  ("E" org-set-effort    "Effort")
	  ("R" org-clock-report  "Report")
	  ("p" org-pomodoro      "Pomodoro"))

	 "Babel"
	 (("e" org-babel-confirm-evaluate "Eval")
	  ("x" org-babel-tangle "Export SRC"))

	 "Trello"
	 (("K" org-trello-mode "On/Off" :toggle org-trello-mode)
	  ("k" (if org-trello-mode
			   (org-trello-hydra/body)
			 (message "org-trello-mode is not enabled")) "Menu"))

	 "Agenda"
	 (("," org-cycle-agenda-files "Cycle")))))
```

| Key | 効果                        | 使用頻度                            |
|-----|---------------------------|---------------------------------|
| l   | リンク挿入                  | C-c C-l で手が馴染んでるのでたまに使う程度 |
| T   | TODO ヘッドライン挿入       | なんかあまり使わない                |
| h   | ヘッドライン挿入            | これも C-RET で慣れてるので使ってない |
| P   | プロパティ設定              | よく使う                            |
| .   | タイムスタンプ挿入          | 使ってない。使い慣れると便利かも    |
| !   | アジェンダのエントリに反映されないタイムスタンプ挿入 | 使ってない。こっちも慣れると便利かも? |
| S   | &lt;s TAB とかのテンプレートの挿入 | 使ってないなあ。慣れたら便利かも    |
| a   | サブツリーをアーカイブ      | よく使う                            |
| r   | サブツリーの移動(refile)    | よく使う                            |
| Q   | タグ設定                    | 時々使う。C-c C-q の方が使うか      |
| N   | カーソル位置のサブツリーのみ表示 | 使ってない。そのツリーだけに集中することがないのかも |
| C   | カラム表示。ツリー内の時間などを合計して表示できる | たまに使う。                        |
| D   | 各ツリーでそれぞれの掛かった時間を表示 | 使ってない。存在忘れてた            |
| s   | スケジュール設定            | C-c C-s をよく使う                  |
| d   | 締め切り設定                | C-c C-d をよく使う                  |
| t   | TODO ステータス変更         | 同じ効果である C-c C-t と同じぐらい使う |
| c   | チェックボックスの切替      | 使うけどチェックボックスの行だけ使えればいいよなとか思う |
| i   | Clock In                    | よく使う。標準的なキーバインドは忘れた。 |
| o   | Clock Out                   | よく使う。標準的なキーバインドは忘れた。 |
| E   | 見積時間の挿入              | まあまあ使う。設定して予実差の確認はできてない |
| R   | org-clock のレポート挿入    | 一応毎日の稼動をこれで記録している  |
| p   | ポモドーロタイマーの開始    | ポモドーロテクニック使えてないでござる |
| e   | org-babel のコード片を実行  | C-c C-c しか使ってない気がするお    |
| x   | tangle でファイル出力       | 最近多用している                    |
| K   | org-trello-mode の切替      | 最近使ってない。trello 連携してないバッファでは要らんしな |
| k   | org-trello-mode 用の Hydra 起動 | 同上                                |
| ,   | agenda ファイルの移動       | いつも固定のファイルを見てるので使ってない。Cycle より直で飛ぶし |


#### Global な Hydra {#global-な-hydra}

pretty-hydra を使って Global に使える org-mode のコマンドを叩けるようにしている

```emacs-lisp
(with-eval-after-load 'pretty-hydra
  (pretty-hydra-define
	global-org-hydra
	(:separator "-"
				:color teal
				:foreign-key warn
				:title (concat (all-the-icons-fileicon "org") " Global Org commands")
				:quit-key "q")
	("Main"
	 (("a" org-agenda "Agenda")
	  ("c" counsel-org-capture "Capture")
	  ("l" org-store-link "Store link")
	  ("t" my/org-tags-view-only-todo "Tagged Todo"))

	 "Calendar"
	 (("F" org-gcal-fetch "Fetch Calendar")
	  ("C" my/open-calendar "Calendar")
	  ("A" my/org-gcal-refresh-appt "Appt"))

	 "Clock"
	 (("i" org-clock-in       "In")
	  ("o" org-clock-out      "Out")
	  ("r" org-clock-in-last  "Restart")
	  ("x" org-clock-cancel   "Cancel")
	  ("j" org-clock-goto     "Goto"))

	 "Search"
	 (("H" org-search-view "Heading"))

	 "Pomodoro"
	 (("p" org-pomodoro "Pomodoro")))))
```

| Key | 効果                        | 使用頻度                                      |
|-----|---------------------------|-------------------------------------------|
| a   | Agenda 選択                 | よく使う                                      |
| c   | Capture                     | よく使う                                      |
| l   | その場所へのリンクを保存    | 使ってない                                    |
| t   | 選択したタグが付与された TODO のみ表示 | 使ってない。使うと便利かもなあ                |
| F   | Google Calendar の情報取得  | 平日は毎日使っている                          |
| C   | カレンダーを calfw で開く   | 最近使ってない                                |
| A   | org-gcal で拾って来た情報を appt に登録 | appt.el 経由で通知できるようにしている        |
| i   | Clock In                    | 使ってないというか major-mode-hydra の方があれば良い |
| o   | Clock Out                   | 使ってない。使ってもいい気がする              |
| r   | 最後に Clock In したやつを再開 | 使ってない。大体常に Clock しているから最後がいつも切り替わってるので使う機会がない |
| x   | Clock Cancel                | 作業は発生しているからキャンセルしないで普通に Clock out しているなあ |
| j   | 最後に Clock In したやつの場所に移動 | ちょくちょく使う。便利                        |
| H   | Heading の検索              | 使ってない。インクリメンタルに検索できればいいのに |
| p   | ポモドーロタイマー          | これも major-mode-hydra にあれば十分かな      |


#### その他 {#その他}

org-agenda 用の Hydra も用意しておいた方が良さそうだなというのが最近の実感。同じコマンド体系で操作できるようにしておいたら考えることが減って楽。


### 日報用の設定(旧) <span class="tag"><span class="unused">unused</span></span> {#nippou}


#### 概要 {#概要}

業務で日報を提出する必要があったのでそれっぽいのを作れるようにしていた。

今では org-super-agenda を使っているのでこれは使ってないが、とりあえず載せておく。


#### シークレット設定の読み込み {#シークレット設定の読み込み}

表に出したくない情報については別ファイルに分離して setq している。が、内容的に本名が露出する程度の情報ではある。

```emacs-lisp
(my/load-config "my-nippou-config")
```

これの中で `my/org-nippou-additional-files` を定義していてそのファイル名に名前が含まれてるだけであった。

`me.org` とでもしておけば解決しそう……。


#### 日報構築の対象となるファイルをリストアップする関数の定義 {#日報構築の対象となるファイルをリストアップする関数の定義}

`~/Documenets/org/tasks` に作業記録用ファイルなどを find コマンドを使ってリストアップする関数。

```emacs-lisp
(defun my/org-nippou-files ()
  (let* ((dir my/org-tasks-directory)
		 (cmd (format "find \"%s\" -name '*.org' -or -name '*.org_archive'" dir))
		 (result (shell-command-to-string cmd))
		 (file-names (split-string result "\n")))
	(-remove (lambda (file-name) (string= "" file-name))
			 file-names)))
```

org-agenda-files を使えば要らないっぽいけどね。
agenda 全然使えてなかったらこんなことに。


#### 日報構築元ファイルを取得する関数の定義 {#日報構築元ファイルを取得する関数の定義}

シークレット設定で定義した変数と上で定義した `my/org-nippou-files` を結合して
1つのリストにするだけの関数を用意している。
1つにまとまってる方が扱いやすいので。

```emacs-lisp
(defun my/org-nippou-targets ()
	  (-concat (my/org-nippou-files) my/org-nippou-additional-files))
```


#### 日報を出力する関数 {#日報を出力する関数}

上記の関数群で target になるファイルから日報用に TODO 項目を引っ張り出してくる関数を用意している。

```emacs-lisp
(defun my/nippou-query ()
  (interactive)
  (org-ql-search
	(my/org-nippou-targets)
	"todo:TODO,DOING,WAIT,DONE ts:on=today"
	:title "日報"
	:super-groups '((:auto-group))))
```

その中では [org-ql](https://github.com/alphapapa/org-ql) の org-ql-search という関数を叩いている。
org-ql は使いこなすと色々なことができそうではあるがそれを内部で使ってる [org-super-agenda](https://github.com/alphapapa/org-super-agenda) を使えば十分な感じではある。


## テスト用ツール {#テスト用ツール}


### テスト用ツール {#_index}

自動テストを実行するにあたり、追加インストールしているパッケージをここに載せている

[with-simulated-input](#with-simulated-input)
: 入力処理をシミュレートしてくれるパッケージ

[mocker.el](#mocker-el)
: Mock/Stub するためのパッケージ。まだ使ってない


### with-simulated-input {#with-simulated-input}


#### 概要 {#概要}

[with-simulated-input](https://github.com/DarwinAwardWinner/with-simulated-input) は入力処理をシミュレートするためのプラグイン。

公式のドキュメントにあるように

```emacs-lisp
(with-simulated-input
	"hello SPC world RET"
  (read-string "Say hello to the world: "))
```

を評価すると
read-string に対して「hello world」を入力したことになるので
echo エリアに「hello world」と表示される。

これで何が嬉しいかというと
Emacs Lisp でやっていることはインタラクティブな部分が大きいのでそういった要素をテストできるようになる。

具体的な使用例は [test:my/org-todo](#test-my-org-todo) で示す。


#### インストール {#インストール}

el-get-bundle で GitHub からインストールしている

```emacs-lisp
(el-get-bundle DarwinAwardWinner/with-simulated-input)
```


### mocker.el <span class="tag"><span class="unused">unused</span></span> {#mocker-el}


#### 概要 {#概要}

[mocker.el](https://github.com/sigma/mocker.el) は Emacs Lisp のテストで使う Mock ライブラリ。

使おうと思って導入したけど、自分のやりたいことはちょっと違ったので死蔵中

便利そうなのでとりあえず置いといている。


#### インストール {#インストール}

el-get で GitHub から取得している。

```emacs-lisp
(el-get-bundle sigma/mocker.el)
```


## テストコード {#テストコード}


### テストコード {#_index}

一部のコマンドなどの設定を書き始めているので設けたセクション。

暫定的にここに置いているが設定と近い方が良さそうなのでいずれドキュメント内の位置を移動しそう。

[実行方法](#execution)
: とりあえず書かれているテストを動かす方法を書いている。

[run-tests](#run-tests)
: テスト全体を動かすための共通設定ファイルの説明

[my-org-commands-test](#my-org-commands-test)
: org-mode 用に自分が生やしたコマンドのテストファイルの解説


### 実行方法 {#execution}

テストする時は以下のように叩いたら動く。

```sh
emacs -Q --batch -l ~/.emacs.d/inits/test/*-test.el -l ~/.emacs.d/inits/test/run-tests.el
```

今まで `.emacs.d` にいる状態でしか叩いたことないので他の場所にいる時に実行しても大丈夫かはわからない。

単体でテストしたい時は

```text
-l ~/.emacs.d/inits/test/*-test.el
```

の部分を書き換えたらいいんじゃないかな。やったことないけど。


### run-tests {#run-tests}

読み込んだテストをまるっとテストするためのコードをとりあえず置いている。

```emacs-lisp
(if noninteractive
	(let ((ert-quiet t))
	  (ert-run-tests-batch-and-exit)))
```

後述の [テストライブラリの読み込み](#テストライブラリの読み込み) などはここで担うべきかとも考えるが今はテストファイルが1つしかないので気にしないことにする。


### my-org-commands-test {#my-org-commands-test}

org-mode 用に定義したコマンドや関数のテストコード


#### Setup {#setup}

<!--list-separator-->

-  テストライブラリの読み込み

    標準でついてくる ert を採用しているのでそれを読み込んでいる。

    ```emacs-lisp
    (require 'ert)
    ```

<!--list-separator-->

-  el-get の設定の読み込み

    プラグイン管理には el-get を利用しているのでその設定ファイルを読み込んでいる。

    ```emacs-lisp
    ;; プラグイン読み込みの前準備
    (load (expand-file-name (concat user-emacs-directory "/init-el-get.el")))
    ```

<!--list-separator-->

-  テスト補助のプラグイン読み込み

    <!--list-separator-->

    -  with-simulated-input

        上で説明しているが、入力をシミュレートするためのプラグインをテストで利用しているのでここで読み込んでいる。

        ```emacs-lisp
        ;; 入力シミュレート用のプラグイン
        (load (expand-file-name (concat user-emacs-directory "/inits/99-with-simulated-input")))
        ```

<!--list-separator-->

-  依存プラグインの読み込み <span class="tag"><span class="improvement">improvement</span></span>

    テスト対象が依存しているプラグインを読み込んでいる。本来は init.el などの設定ファイルを全部読み込んだ状態でテストをした方が良さそうだが現状だとその状態で GitHub Actions で動かせる方法がわからないので一旦個別に読み込むようにしている。

    <!--list-separator-->

    -  swiper

        ivy-read を使った機能のテストをするので読み込んでいる。

        ```emacs-lisp
        (el-get-bundle abo-abo/swiper)
        ```

<!--list-separator-->

-  テスト対象の読み込み

    テストしたいファイルをここで読んでる。

    ```emacs-lisp
    ;; テスト対象の読み込み
    (load (expand-file-name (concat user-emacs-directory "/inits/68-my-org-commands.el")))
    ```


#### ert-deftest {#ert-deftest}

<!--list-separator-->

-  test:my/org-todo-keyword-strings

    `org-todo-keywords` から "|" という区切りを除外したり
    "(s)" とかのような高速アクセスのためのキーワードは
    ivy で選択する時には邪魔なので除外したい、ということを表現したテスト。

    ```emacs-lisp
    (ert-deftest test:my/org-todo-keyword-strings ()
      "Test of `my/org-todo-keyword-strings'."
      (let ((org-todo-keywords '((sequence "TODO" "DOING(!)" "WAIT" "|" "DONE(!)" "SOMEDAY(s)"))))
    	(should (equal '("TODO" "DOING" "WAIT" "DONE" "SOMEDAY")
    				   (my/org-todo-keyword-strings)))))
    ```

    なお、ここでテストしている関数では
    TODO キーワードを ivy で扱いやすいように整えているだけで実際の選択は別の関数が担っている

<!--list-separator-->

-  test:my/org-todo

    org-todo を ivy で選択する関数のテストを書いている。

    ```emacs-lisp
    (ert-deftest test:my/org-todo ()
      "Test of `my/org-todo'."
      (let ((org-todo-keywords '((sequence "TODO" "DOING(!)" "WAIT" "|" "DONE(!)" "SOMEDAY(s)")))
    		(result))
    	;; org-mode を読まずに済むように org-todo を差し替えてテストしている
    	(cl-letf (((symbol-function 'org-todo)
    			   (lambda (keyword)
    				 (setq result keyword))))
    	  (with-simulated-input "DOI RET" (my/org-todo))
    	  (should (equal "DOING" result)))))
    ```

    ポイントは cl-letf を使って、内部で叩いている関数 `org-todo` を一時的に

    ```emacs-lisp
    (lambda (keyword)
      (setq result keyword))
    ```

    に差し替えているところ。

    org-mode を呼び出さずに代わりの関数に差し替えているのでテストがしやすくなっている。Stub 的なやつかな。

    何度も使うならこの差し替え処理自体をテストヘルパーにしても良いかもしれない。

    また ivy で選択するので with-simulated-input を使って入力操作を代替している。便利。
