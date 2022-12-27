;;; mappings.el --- Summary
;;; Commentary:
;;; Custom mappings {{{1

;;; Code:

;; Vim mappings
;; (require 'evil)
;; (evil-mode t)

;; определение клавиатурных комбинаций для внутренних подрежимов org-mode
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)
;; (global-set-key "\C-cl" 'org-store-link)

;; font size +-
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Quick access to init.el
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "<f12>") 'find-user-init-file)

;; Quick access to recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;; Open at startup
(recentf-open-files)

;; Bind non standard completion
;;(global-set-key "\M- " 'hippie-expand)

;; Custom mappings }}}1
