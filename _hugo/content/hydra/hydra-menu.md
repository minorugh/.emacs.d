+++
title = "8.1. hydra-menu"
draft = false
+++
`hydra-menu` は、いわば私の秘書のような役割です。

便宜上、`quick-menu`と`work-menu` に分けていますが、どちらからでも相互に呼び出せるようにしています。

### Hydra for quick-menu
編集作業で頻繁にアクセスするプロジェクトのディレクトリを一発で開くためのショートカットを設定しています。

よく使うアプリ起動のショートカットなども設定しておくと便利です。

![hydra-quick-menu](https://live.staticflickr.com/65535/50174826063_b4fa442b1e_b.jpg) 

```elisp
;; Hydra for quick-menu
(leaf *hydra-quick-menu
  :bind ("M-." . hydra-quick/body)
  :hydra
  (hydra-quick
   (:hint nil :exit t)
   "
   Quick Menu
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^-----------------------------------------------------------------------------------------
  _d_ropbox  _e_macs.d^^  _i_nits  _x_srv.jp^^^^  GH:_h_  root:_/_  _s_rc  _._files   howm:_@__,_   _m_d:_p_view   _z_illa
  _r_estart  magit_[__]_  _t_ramp  _y_as:_n_:_v_  _j_unk  _b_rowse  _o_rg  _<home>_   _c_ompile^^   make:_k_._g_   _a_g:🐾
"
   ("a" counsel-ag)
   ("o" my:org-dir)
   ("t" counsel-tramp)
   ("q" my:tramp-quit)
   ("<home>" my:home-dir)
   ("d" my:dropbox)
   ("." my:dotfiles-dir)
   ("i" my:inits-dir)
   ("e" my:emacs-dir)
   ("h" my:gh-dir)
   ("x" my:xsrv-dir)
   ("y" company-yasnippet)
   ("n" yas/new-snippet)
   ("v" yas/visit-snippet-file)
   ("r" restart-emacs)
   ("m" hydra-markdown/body)
   ("p" livedown-preview)
   ("w" livedown-kill)
   ("b" hydra-browse/body)
   ("c" hydra-make/body)
   ("-" my:github-show)
   ("@" howm-list-all)
   ("," howm-remember)
   ("j" open-junk-file)
   ("J" open-last-junk-file)
   ("k" my:make-k)
   ("g" my:make-git)
   ("/" my:root-dir)
   ("_" my:delete-other-windows)
   ("[" git-timemachine-toggle)
   ("]" magit-status)
   ("s" my:scr-dir)
   ("l" my:open-capture)
   (":" view-mode)
   ("z" filezilla)
   ("M-." hydra-work/body)
   ("<muhenkan>" nil)))
```
### Hydra for work-menu
ブログ記事のほかWEB日記や俳句関係のシリーズ記事の追加、編集など、毎日頻繁に開くワークスペースへのショートカットを設定しています。

![hydra-work-menu](https://live.staticflickr.com/65535/50175364331_9fcf3c6c86_b.jpg) 

```elisp
;; Hydra for work-menu
(leaf *hydra-work-menu
  :bind ("<henkan>" . hydra-work/body)
  :hydra
  (hydra-work
   (:hint nil :exit t)
   "
   Work Menu
  ------^^^^^^^^^^^^^^^^^^^^^^^^---------------------------------------------------------------------------
  _d_:日記   _m_:毎日   _w_:毎週   _k_:兼題^^   _t_:定例   _s_:吟行^^   近詠:_n_   創作:_[_._]_   keep:_;_
  _a_:合評   _e_:hugo   _b_ackup   _g_ist:_L_   pass_x_c   repo:_@_^^   view:_:_   _p_rint:_r_e   Pages_._
"
   ("p" ps-print-buffer)
   ("r" ps-print-region)
   ("a" my:apvoice)
   ("A" my:apvoice-new-post)
   ("P" ps-print-buffer)
   ("b" my:backup-all)
   ("@" browse-at-remote)
   ("e" easy-hugo)
   ("d" my:diary)
   ("D" my:diary-new-post)
   ("g" gist-region-or-buffer)
   ("L" lepton)
   ("j" my:junk-dir)
   ("i" iedit-mode)
   ("l" open-last-junk-file)
   ("t" my:teirei)
   ("T" my:teirei-new-post)
   ("s" my:swan)
   ("S" my:swan-new-post)
   ("N" my:kinnei)
   ("n" my:kinnei-draft)
   ("c" my:make-draft)
   ("m" my:d_kukai)
   ("w" my:w_kukai)
   ("k" my:m_kukai)
   ("/" livedown-kill)
   ("v" markdown-preview)
   ("f" flymake-show-diagnostics-buffer)
   ("x" keepassxc)
   ("+" text-scale-adjust)
   ("_" my:delete-other-windows)
   ("]" my:haiku-note)
   ("[" my:haiku-note-post)
   (";" (browse-url "https://keep.google.com/u/0/"))
   (":" view-mode)
   ("z" select-mozc-tool)
   ("h" my:github.io-dir)
   ("." my:emacs.d-dir)
   ("<henkan>" hydra-quick/body)
   ("<muhenkan>" nil))
```

### 必要に応じて作業コマンドを作成します
以下は一例です。

```elisp
(defun my:backup-all ()
  "Backup all."
  (interactive)
  (let* ((default-directory (expand-file-name "~/Dropbox/backup")))
  (compile "make -k")))
                                                                                                               
(defun filezilla ()
  "Open filezilla."
  (interactive)
  (compile "filezilla -s")
  (delete-other-windows))
                                                                                                               
(defun lepton () 
  "Open lepton."
  (interactive)
  (compile "~/Appimage/Lepton-1.10.0.AppImage")
  (delete-other-windows))
                                                                                                               
(defun keepassxc ()
  "Open keepassxc with auto passwd input." 
  (interactive)
  (compile "secret-tool lookup type kdb | keepassxc --pw-stdin ~/Dropbox/backup/passwd/keypassX/20191105.kdbx")
  (delete-other-windows))
```
