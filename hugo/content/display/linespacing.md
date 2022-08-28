+++
title = "7.3. line-spacing"
draft = false
+++
## [my:line-spacing] 行間を制御する

`line-spacing` は、行間を制御する変数ですが、バッファローカルな変数なので、ミニバッファも含めて、各バッファの行間を個別に制御できます。

執筆モードの `darkroom-mode` では、

```elisp
(setq-local line-spacing 0.4)
```
と行間を大きくするように設定していて、`dark-room` を出るときに元に戻します。

[@takaxpさんのブログ記事](https://pxaka.tokyo/blog/2019/emacs-buffer-list-update-hook/) のによると、`global` で `0.3` 以下に設定すると 
`nil` に戻せないという不具合があるとのことなので、次のように設定しました。

```elisp
(defun my:linespacing ()
  (unless (minibufferp)
    (setq-local line-spacing 0.2)))
(add-hook 'buffer-list-update-hook #'my:linespacing)
```

