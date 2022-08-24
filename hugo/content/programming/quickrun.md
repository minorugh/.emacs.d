+++
title = "10.4. quickrun"
draft = false
+++

### [quickrun.el] お手軽ビルド
カレントバッファで編集中のソースコードをビルド・実行して別バッファに結果を得ます。

```elisp
(leaf quickrun
  :ensure t
  :bind ("<f5>" . quickrun))
```
