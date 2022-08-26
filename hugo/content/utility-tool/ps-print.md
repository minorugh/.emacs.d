+++
title = "12.3. ps-priter"
draft = false
+++

### PS-Printer での印刷
Emacsから`Postscript`経由で印刷する際の個人的な設定です。

`Postscript` 対応のプリンターが必要。

```code
(defalias 'ps-mule-header-string-charsets 'ignore)
(setq ps-multibyte-buffer 'non-latin-printer
	  ps-paper-type 'a4
	  ps-font-size 9
	  ;; ps-font-family 'Helvetica
	  ps-font-family 'Courier
	  ps-line-number-font 'Courier
	  ps-printer-name nil
	  ps-print-header nil
	  ps-show-n-of-n t
	  ps-line-number t
	  ps-print-footer nil)
```
