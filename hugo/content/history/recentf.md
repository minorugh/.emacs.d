+++
title = "9.3. recentf"
draft = false
+++
### 開いたファイルの履歴を保存

複数端末で設定ファイルを共有させている環境では、`recentf-auto-cleanup` を `never` にしておかないと大変なことになる。

```elisp
;; recentf
(leaf recentf
  :custom `((recentf-auto-cleanup . 'never)
			(recentf-exclude
			 . '("\\.howm-keys" "Dropbox/backup" ".emacs.d/tmp/" ".emacs.d/elpa/" "/scp:"))))
```
