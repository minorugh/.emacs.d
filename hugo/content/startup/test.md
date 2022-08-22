+++
title = "1.5. 最小限の emacs起動設定"
draft = false
+++

* 最小限の emacs を起動させるための設定です。

[`test.el`](https://github.com/minorugh/dotfiles/blob/main/.emacs.d/test.el) は、
新しいパッケージを試したり設定をテストしたり、エラー等で Emacsが起動しない場合などに使用します。

以下を `.zshrc` または `.coderc` に記述し反映させたのち、シェルから `eq` と入力することで起動することがでます。

```code
alias eq = 'emacs -q -l ~/.emacs.d/test.el'
```

ファイルの PATH は、ご自分の環境に応じて修正が必要です。
