+++
title = "5.5. winner-mode"
draft = false
+++

### 11.3. [Winner.el] ウインドウ構成の履歴を辿る

ビルトインの `winner.el` を使います．

分割状況を含めて各ウィンドウで表示していたバッファの履歴を辿ることができます。

`winner-undo` で直前の状態に戻せます。誤って `C-x 0` で分割ウィンドウを閉じた時でも即座に元の状態に戻すことが可能です。

```elisp
(leaf winner-mode
  :ensure nil
  :bind (("C-c <left>" . winner-undo)
         ("C-c <right>" . winner-redo))
  :init
  (winner-mode 1))
```
