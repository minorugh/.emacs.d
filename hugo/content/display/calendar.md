+++
title = "7.. calendar"
draft = false
+++

### 6.4. [japanese-holidays] カレンダーをカラフルにする
ビルドインの `holidays` と `japanese-holidays.el`を使います。土日祝日に色を着けます。土曜日と日曜祝日で異なる配色にできます。

```elisp
(leaf calendar
  :leaf-defer t
  :bind (("<f7>" . calendar)
		 (:calendar-mode-map
		  ("<f7>" . calendar-exit)))
  :config
  (leaf japanese-holidays
	:ensure t
	:require t
	:hook ((calendar-today-visible-hook . japanese-holiday-mark-weekend)
		   (calendar-today-invisible-hook . japanese-holiday-mark-weekend)
		   (calendar-today-visible-hook . calendar-mark-today))
	:config
	(setq calendar-holidays
		  (append japanese-holidays holiday-local-holidays holiday-other-holidays))
	(setq calendar-mark-holidays-flag t)))
```
