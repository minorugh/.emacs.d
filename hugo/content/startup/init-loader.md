+++
title = "1.4. init-loader.el"
draft = false
+++

### [init-loader] 設定ファイル群のローダー 

* [emacs-jp/init-loader:Loader of configuration files.](https://github.com/emacs-jp/init-loader/) 

指定されたディレクトリから構成ファイルをロードします。これにより、構成を分類して複数のファイルに分けることができます。

`init-loader` には、エラーが出た設定ファイルは読み込まれない...という特徴があり原因究明がしやすくなるというメリットがある。またログの出力機能を備えていることもメリットとして挙げられる。

起動時間が犠牲になるということで敬遠される向きもあるが微々たるもので、恩恵のほうが遥かに大きい。

```elisp
(leaf init-loader
  :ensure t
  :config
  (custom-set-variables
   '(init-loader-show-log-after-init 'error-only))
  (init-loader-load))
```
