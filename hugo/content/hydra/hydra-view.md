+++
title = "8.5. hydra-view-mode"
draft = false
weight = 5
+++
```elisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hydra view mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(leaf *hydra-view-mode
  :hydra
  (hydra-view
   (:color red :hint nil)
   "
   View mode
  -----------------------^^^^^^^^^^^^^^^^^^^^^^^^^^------------------------------------------------------------
  _x_:del-chra   _u_:undo   winner:_[__]_   _s_wiper   :_o_._0_._1_._2_   _%_:paren   _-__\/__+_   help_._
  _d_:del-line   _y_:yank   x_r_ef🐾_RET_   _g_oogle   _w_:for-word^^^^^^   _@_:point   _m_agit^^^^   ex_i_t_:_
"
   ("r" xref-find-references)
   ("RET" xref-find-definitions)
   ("x" my:view-del-char)
   ("w" forward-word)
   ("d" my:view-kill-region)
   ("y" my:view-yank)
   ("u" my:view-undo)
   ("[" winner-undo)
   ("]" winner-redo)
   ("n" my:org-view-next-heading)
   ("p" my:org-view-previous-heading)
   ("%" my:jump-brace)
   ("@" counsel-mark-ring)
   ("i" View-exit-and-edit :exit t)
   (":" View-exit-and-edit :exit t)
   ("s" swiper-thing-at-point)
   ("m" magit-status)
   ("g" my:google)
   ("o" other-window-or-split)
   ("0" my:delete-window)
   ("1" my:delete-other-windows)
   ("2" my:split-window-below)
   ("3" my:split-window-right)
   ("+" text-scale-increase)
   ("-" text-scale-decrease)
   ("/" (text-scale-set 0))
   ("." nil :cokor blue)))
```
