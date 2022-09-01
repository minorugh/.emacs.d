+++
date = "2022-08-29T06:01:24+09:00"
title = "10.7. browse-at-point"
draft = false
weight = 7
+++
## [browse-at-remote.el]
🔗 [rmuslimov/browse-at-remote: Browse target page on github/bitbucket from emacs buffers](https://github.com/rmuslimov/browse-at-remote) 

`browse-at-remote.el` は、Git管理しているEmacsバッファーからgithubの特定リンクを瞬時に開くことができる優れものです。

```elisp
(leaf browse-at-remote
  :ensure t
  :custom (browse-at-remote-prefer-symbolic . nil))
```
