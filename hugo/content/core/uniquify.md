### 3.9.  [uniquify.el] 同じバッファ名が開かれた場合に区別する
ビルトインの `uniquify` を使います。モードラインの表示が変わります。

```elisp
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
```
