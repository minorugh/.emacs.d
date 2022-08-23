+++
title = "3.5. expand-region"
draft = false
+++
### [expand-refion.el] カーソル位置を起点に選択範囲を賢く広げてくれる

[`expand-region.el`](https://github.com/magnars/expand-region.el) は、カーソル位置を起点として前後に選択範囲を広げてくれます。

2回以上呼ぶとその回数だけ賢く選択範囲が広がりますが、2回目以降は設定したキーバインドの最後の一文字を連打すれば OKです。その場合、選択範囲を狭める時は - を押し， 0 を押せばリセットされます。

```elisp
(leaf expand-region
  :ensure t
  :bind ("C-@" . er/expand-region))
```
