+++
title = "12.9. google-translate"
draft = false
+++
### [google-translate.el] 
🔗 [atykhonov/google-translate: Emacs interface to Google Translate.](https://github.com/atykhonov/google-translate) 

この設定は、[@masasam](https://twitter.com/SolistWork) の
[Sollst Work Blog](https://solist.work/blog/posts/google-translate/) で公開されている設定をパクりました。

リージョンが日本語なら `ja to en` に、英語なら `en to ja` 自動判別して `google-Translate` を実行してくれます。

```elisp
(leaf google-translate
  :ensure t
  :bind ("C-t" . google-translate-auto)
  :config
  (defun google-translate-auto ()
	"Automatically recognize and translate Japanese and English."
	(interactive)
	(if (use-region-p)
		(let ((string (buffer-substring-no-properties (region-beginning) (region-end))))
		  (deactivate-mark)
		  (if (string-match (format "\\`[%s]+\\'" "[:ascii:]")
							string)
			  (google-translate-translate
			   "en" "ja"
			   string)
			(google-translate-translate
			 "ja" "en"
			 string)))
	  (let ((string (read-string "Google Translate: ")))
		(if (string-match
			 (format "\\`[%s]+\\'" "[:ascii:]")
			 string)
			(google-translate-translate
			 "en" "ja"
			 string)
		  (google-translate-translate
		   "ja" "en"
		   string)))))

  (defun google-translate--get-b-d1 ()
	"Fix error of `Failed to search TKK`."
	(list 427110 1469889687)))
```

最後の部分、は、ときどき "Fix error of `Failed to search TKK`." というエラーが出て動かなくなるので、おまじないです。
```elisp
(defun google-translate--get-b-d1 ()
  "Fix error of `Failed to search TKK`."
  (list 427110 1469889687))
```
