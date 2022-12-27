;;; Color themes

;; (use-package dracula-theme
;;   :config
;;   (load-theme 'dracula-theme t))
;; (use-package zenburn-theme
;;   :config
;;   (load-theme 'zenburn-theme t))
;; (use-package material-theme
;;   :config
;;   (load-theme 'material-theme t))

(use-package sublime-themes
  :config
  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'zenburn))

(use-package airline-themes
  :requires powerline
  :config
  (powerline-default-theme)
  (load-theme 'airline-hybridline)
  (setq
   ;; powerline-utf-8-separator-left        #xe0b0
   ;; powerline-utf-8-separator-right       #xe0b2
   ;; airline-utf-glyph-separator-left      #xe0b0
   ;; airline-utf-glyph-separator-right     #xe0b2
   ;; airline-utf-glyph-subseparator-left   #xe0b1
   airline-utf-glyph-subseparator-right  #xe0b3
   ;; airline-utf-glyph-branch              #xe0a0
   ;; airline-utf-glyph-readonly            #xe0a2
   airline-utf-glyph-linenumber          #xe0a1)
  )

;; (use-package kaolin-themes
;;   :config
;;   (load-theme 'kaolin-dark t)
;;   (use-package all-the-icons)
;;   (kaolin-treemacs-theme))

;; ========================================
