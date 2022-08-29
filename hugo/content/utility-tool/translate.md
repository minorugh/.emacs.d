+++
date = "2022-08-29T06:03:08+09:00"
title = "12.9. google-translate"
draft = false
+++
## [google-translate.el] Google翻訳サービスを使用して文字列を翻訳
🔗 [atykhonov/google-translate: Emacs interface to Google Translate.](https://github.com/atykhonov/google-translate) 

この設定は、[@masasam](https://twitter.com/SolistWork) の
[Sollst Work Blog](https://solist.work/blog/posts/google-translate/) で公開されている設定をパクりました。

リージョンが日本語なら `ja to en` に、英語なら `en to ja` にと自動判別して実行してくれます。

```elisp
(leaf google-translate
  :ensure t
  :bind (("C-t" . google-translate-auto)
         ("C-c t" chromium-translate))
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

最後の部分は、`Failed to search TKK` というエラーが出てときどきとまることがあるので、おまじないです。
```elisp
(defun google-translate--get-b-d1 ()
  "Fix error of `Failed to search TKK`."
  (list 427110 1469889687))
```

## プラウザのGoogle翻訳サービスを使用して文字列を翻訳
前述のように、`google-translate` は、Google側のサービスシステムの都合上ときどき止まることがあります。
そのようなときの待避策としてプラウザからでも使えるようにという設定です。

こちらも [Sollst Work Blog](https://solist.work/blog/posts/google-translate/) で公開されているものです。

```elisp
(defun chromium-translate ()
  "Open google translate with chromium."
  (interactive)
  (if (use-region-p)
	  (let ((string (buffer-substring-no-properties (region-beginning) (region-end))))
		(deactivate-mark)
		(if (string-match (format "\\`[%s]+\\'" "[:ascii:]")
						  string)
			(browse-url (concat "https://translate.google.com/?source=gtx#en/ja/"
								(url-hexify-string string)))
		  (browse-url (concat "https://translate.google.com/?source=gtx#ja/en/"
							  (url-hexify-string string)))))
	(let ((string (read-string "Google Translate: ")))
	  (if (string-match
		   (format "\\`[%s]+\\'" "[:ascii:]")
		   string)
		  (browse-url
		   (concat "https://translate.google.com/?source=gtx#en/ja/" (url-hexify-string string)))
		(browse-url
		 (concat "https://translate.google.com/?source=gtx#ja/en/" (url-hexify-string string)))))))
```
