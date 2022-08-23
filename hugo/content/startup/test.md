+++
title = "1.5. test.el"
draft = false
+++
### [test.el] 最小限の emacs を起動させるための設定

[`test.el`](https://github.com/minorugh/dotfiles/blob/main/.emacs.d/test.el) は、
新しいパッケージを試したり設定をテストしたり、エラー等で Emacsが起動しない場合などに使用します。

以下を `.zshrc` または `.coderc` に記述し反映させたのち、シェルから `eq` と入力することで起動することがでます。

```zshrc
alias eq = 'emacs -q -l ~/.emacs.d/test.el'
```

ファイルの PATH は、ご自分の環境に応じて修正が必要です。
