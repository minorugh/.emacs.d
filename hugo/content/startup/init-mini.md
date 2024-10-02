+++
date = "2022-08-29T05:45:20+09:00"
title = "1.5. init-mini.el"
+++
## [init-mini.el] 最小限の emacs を起動させるための設定

[`init-mini.el`](https://github.com/minorugh/dotfiles/blob/main/.emacs.d/init-mini.el) は、
新しいパッケージを試したり設定をテストしたり、エラー等で Emacsが起動しない場合などに使用します。

以下を `.zshrc` または `.bashrc` に記述し反映させたのち、シェルから `eq` と入力することで起動することがでます。

```zshrc
alias eq = 'emacs -q -l ~/.emacs.d/init-mini.el'
```

ファイルの PATH は、ご自分の環境に応じて修正が必要です。

