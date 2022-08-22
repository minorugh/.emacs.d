+++
title = "2.6. 同じバッファ名が開かれた場合に区別する"
draft = false
+++
ビルトインの `uniquify` を使います。

```elisp
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
```
