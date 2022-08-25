+++
title = "7.9. toggle-frame-fullscreen"
draft = false
+++
### [toggle-frame-fullscreen] 画面を最大とフルスクリーンとにトグルで切替え

Emacsの起動時に最大化 / フルスクリーンにするには、次のいづれかを `init.el` に書きます。

```elisp
;; 最大化
(set-frame-parameter nil 'fullscreen 'maximized)

;; フルスクリーン
(set-frame-parameter nil 'fullscreen 'fullboth)
```
ところが、起動後に `M-x toggle-frame-fullscreen`/`M-x toggle-frame-fullscreen` とやっても思うような動きになりません。

そこで、多少インチキくさい設定ですが、`init.el` にはまず、`maxmized` を設定し、全ての設定を詠み終えた最後にフルスクリーンに設定し直します。

こうすることで、あとは `M-x toggle-frame-fullscreen` で最大化フルスクリーンの切り替えが出来るようになります。

```elisp
;;; init.el
;; set maxmized for startup
(set-frame-parameter nil 'fullscreen 'maximized)

;; set fullscreen for window-setup-hook
(add-hook 'window-setup-hook
		  (lambda ()
			(set-frame-parameter nil 'fullscreen 'fullboth)))

(bind-key "<f11>" 'toggle-frame-fullscreen)
```

