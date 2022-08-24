+++
title = "12.2. ps-priter__"
draft = false
+++

### 13.4. PS-Printer へのファイルの出力
基本的には Postscript ファイルを打ち出すことのできるPostscript プリンターが必要です。

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
