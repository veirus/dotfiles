;;; kaolin-breeze-theme.el --- Light Kaolin theme with soft colors.
;;; Commentary:

;;; Code:
(require 'kaolin-themes)

(define-kaolin-theme breeze  "Light Kaolin theme with soft colors."

  ;; Palette modification
  ((spring-green6 "#3e594e")
   (aquamarine4   "#518270")
   (orange0       "#d1832e")

   (cyan1         "#48a9a9")
   (cyan2         "#008b8b")
   (cyan3         "#6facb3")

   (capri4 "#4F9CB8")
   (cerulean4 "#4C6190")
   (blue4 "#605DB3")

   ;; Color vars
   (bg0 "#F6F2EF")
   (bg1 "#EBE8E4")
   (bg2 "#DEDAD5")
   (bg3 "#D2CECA")
   (bg4 "#C9C2BD")

   (fg1 gray1)
   (fg2 gray2)
   (fg3 gray3)
   (fg4 gray4)

   (keyword     cerulean4)
   (second-key  keyword)
   (builtin     vermilion4)

   (var         crimson3)
   (const       crimson3)
   (functions   brown1)
   (type        spring-green2)

   (comment     lime7)
   ;; (alt-comment "#ffaaaa")

   (str         magenta4)
   (str-alt     magenta2)
   (doc         str-alt)

   (prep        capri1)
   (num         capri1)
   (bool        num)
   (warning     orange1)
   (err         red1)

   (dim-buffer white0)
   (hl         ultramarine2)
   ;; TODO: add colored
   (hl-line    (if kaolin-hl-line-colored bg2 bg2))
   (hl-indent  gray9)
   ;; TODO:
   (selection bg4)
   ;; TODO:
   (pulse cyan3)

   (todo crimson4)

   (tooltip-hl-bg bg3)
   (tooltip-hl-fg hl)

    ;; TODO:
   (rb1 ultramarine4)
   (rb2 magenta4)
   (rb3 azure4)
   (rb4 ultramarine4)
   (rb5 teal1)
   (rb6 aquamarine2)
   (rb7 magenta4)
   (rb8 spring-green4)
   (rb9 crimson4)

   (diff-add aquamarine4)
   (diff-mod vermilion4)
   (diff-rem red4)

    ;; Mode-line
   (line-fg           fg4)
   (line-bg1          bg2)
   (line-bg2          bg3)
   (line-border       bg3)

   ;; Telephone-line
   (segment-active    gray2)
   (segment-inactive  gray2)
   (evil-normal       teal1)
   (evil-insert       spring-green1)
   (evil-visual       orange1)
   (evil-replace      red4)
   (evil-motion       yellow1)
   (evil-operator     evil-normal)
   (evil-emacs        amber3)

   (win-border    bg3)
   (line-num-bg   bg1)
   (line-num-fg   chartreuse8)
   (line-num-hl   hl)

   (cursor        gray3)

   (ivy1          gray9)
   (ivy2          capri1)
   (ivy3          orange0)
   (ivy4          red4))

  ((link                   (:foreground capri1 :underline underline))

   (highlight-quoted-quote   (:foreground keyword))
   (highlight-quoted-symbol  (:foreground keyword))

   (org-level-1            (:foreground teal1 :bold bold :height 1.1))
   (org-level-2            (:foreground ultramarine4 :bold nil))
   (org-level-3            (:foreground vermilion4 :bold nil))
   (org-level-4            (:foreground cerise4 :bold nil))
   (org-code               (:foreground teal1))
   (org-verbatim           (:foreground orange2))
   (org-table              (:foreground ultramarine4 :bold bold))

   (js2-object-property          (:foreground brown1))
   (evil-ex-info                 (:foreground crimson4)))


  (when kaolin-git-gutter-solid
    (custom-theme-set-faces
     'kaolin-breeze
     `(git-gutter:added     ((t (:background ,diff-add :foreground ,diff-add))))
     `(git-gutter:modified  ((t (:background ,diff-mod :foreground ,diff-mod))))
     `(git-gutter:deleted   ((t (:background ,diff-rem :foreground ,diff-rem)))))))

;;; kaolin-breeze-theme ends here
