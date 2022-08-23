+++
title = "7.3. line-spacing"
draft = false
weight = 3
+++
### 12.4 行間を制御する
`line-spacing` 行間を制御する変数です。バッファローカルな変数なので、ミニバッファも含めて、各バッファの行間を個別に制御できます。

[@takaxpさんのブログ記事](https://pxaka.tokyo/blog/2019/emacs-buffer-list-update-hook/) のによると、`global` で `0.3` 以下に設定すると 
`nil` に戻せないという不具合があるとのことなので、Tipsをパクって以下のように設定をしました。

```code
(defun my:linespacing ()
  (unless (minibufferp)
    (setq-local line-spacing 0.2)))
(add-hook 'buffer-list-update-hook #'my:linespacing)
```
`my:linespacing` はシンプルに、 `global` ではなく `local` 変数の `line-spacing` を書き換えます。
`(minibufferp)` で括っているのは、ミニバッファの行間を `my:linespacing` に左右されずに制御するためです。

`darkroom-mode` では、

```code
(setq-local line-spacing 0.4)
```
と行間を大きくするように設定していますが、`dark-room` からでるときに `my:linespacing` に戻しています。
