;;; Package --- Summary
;;; Commentary:
;;; Visual settings

;;; Code:

;; Visual stuff {{{1

;;; Transparency
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

;;; GUI customizations
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; Fonts
;;;; (set-face-attribute 'default nil :family "DejaVu Sans Mono for Powerline")
;;;; (set-face-attribute 'default nil :height 120)
;;;; or like this:
(set-face-attribute 'default nil :family "DejaVu Sans Mono for Powerline" :height 120)

;;; Line numbers on the left and column number in the status line
(global-linum-mode t)
(column-number-mode t)

;;; Highlight matching parens
(show-paren-mode t)

;;; Display the name of the current buffer in the title bar
(setq frame-title-format "%b - Emacs")

;;; whitespace display
(global-whitespace-mode)
(setq whitespace-global-modes
      '(not magit-mode git-commit-mode))
(setq whitespace-style '(face trailing tabs))

;;; Change cursor color depending on mode
;; https://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
;; This is something that I liked to have in Vim. Fortunately, you can
;; also have it in Emacs. Unfortunately, I’ve been unable to get in
;; working on non-GUI emacs:
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; Visual stuff }}}1
