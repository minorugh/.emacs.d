### [sudo-edit.el] Root権限でファイルを開き直す
🔗 [nflath/sudo-edit: Utilities for opening files with sudo.](https://github.com/nflath/sudo-edit)

`sudo-edit.el` はカレントバッファ・任意のファイルを `root` 権限で開き直すコマンドを2つ提供しています。

`M-x sudo-edit`
: ファイルを `root`権限で開きます。システムファイルを編集するときに便利です。

`M-x sudo-edit-find-file`
: `root`権限で `find-file` します。

実用上は、`sudo-edit` だけで十分な気がします。自分は、`dired-mode` から `s` でコマンドを実行するようにしています。


パッケージを使わずに関数設定だけで機能させるTipsも見つけました。

🔗 [Emacs でファイルをsudoで開き直す](https://ameblo.jp/grennarthmurmand1976/entry-12151018656.html) 

`dired` や `C-x C-f` で普通にファイルを開いたときに、それが `root`所有なファイルなら、自動的に`sudo`で開きなおすかを聞いてくれます。

案外使いやすいので、とりあえず両方設定しています。

```elisp
;; Automatically open root permission file with sudo
;; https://ameblo.jp/grennarthmurmand1976/entry-12151018656.html
(defun file-root-p (filename)
  "Return t if file FILENAME created by root."
  (eq 0 (nth 2 (file-attributes filename))))
                                                                        
(defadvice find-file (around my:find-file activate)
  "Open FILENAME using tramp's sudo method if it's root permission."
  (if (and (file-root-p (ad-get-arg 0))
           (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat (ad-get-arg 0)
                             " is root permission. Open it as root? ")))
      (my:find-file-sudo (ad-get-arg 0))
    ad-do-it))
                                                                        
(defun my:find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))
```
