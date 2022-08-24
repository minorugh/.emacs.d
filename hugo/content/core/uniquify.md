+++
title = "2.6. uniguify"
draft = false
+++
### [unquify.el] 同じバッファ名が開かれた場合に区別する

ビルトインの `uniquify` は、同じバッファ名が開かれた場合に区別する設定です。

```elisp
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
```
