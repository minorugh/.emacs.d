+++
date = "2022-08-29T05:48:41+09:00"
title = "2.6. uniguify"
+++
## 同じバッファ名が開かれたら区別する

ビルトインの `uniquify` は、同じバッファ名が開かれた場合に区別する設定です。

```elisp
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
```
