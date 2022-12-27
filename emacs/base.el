;;; Package --- Summary
;;; Commentary:
;;; General Emacs configuration

;;; Code:

;;; Закрывать *scratch* при запуске.
(kill-buffer "*scratch*")
;; (desktop-save-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode 1)

;; IDO plugin {{{1
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

;;; show choices vertically
(if (version< emacs-version "25")
    (progn
      (make-local-variable 'ido-separator)
      (setq ido-separator "\n"))
  (progn
    (make-local-variable 'ido-decorations)
    (setf (nth 2 ido-decorations) "\n")))

;; IDO }}}1

;; Inhibit startup/splash screen
(setq inhibit-splash-screen t
      inhibit-startup-message t
      ;; экран приветствия можно вызвать комбинацией C-h C-a
      inhibit-startup-echo-area-message t)


;; Doesn't work if splash screen enabled
(setq default-directory "~/")

;; Save backups in specific directory
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

;; syntax highlighting
;; (require 'font-lock)
;; включено с версии Emacs-22. Нo на всякий случай:
;; (global-font-lock-mode             t)
;; (setq font-lock-maximum-decoration t)

;; Electric-modes settings
;; (electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
;; (electric-indent-mode -1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал
(setq  display-buffer-reuse-frames t) ;; If a frame alredy opened, use it!

;;; Copy orgmode links
(defun my-yank-org-link (text)
  (if (derived-mode-p 'org-mode)
      (insert text)
    (string-match org-bracket-link-regexp text)
    (insert (substring text (match-beginning 1) (match-end 1)))))

(defun my-org-retrieve-url-from-point ()
  (interactive)
  (let* ((link-info (assoc :link (org-context)))
	 (text (when link-info
		 ;; org-context seems to return nil if the current element
		 ;; starts at buffer-start or ends at buffer-end
		 (buffer-substring-no-properties (or (cadr link-info) (point-min))
						 (or (caddr link-info) (point-max))))))
    (if (not text)
	(error "Not in org link")
      (add-text-properties 0 (length text) '(yank-handler (my-yank-org-link)) text)
      (kill-new text))))

(defun my-smarter-kill-ring-save ()
  (interactive)
  (if (region-active-p)
      (call-interactively #'kill-ring-save)
    (when (eq major-mode 'org-mode)
      (call-interactively #'my-org-retrieve-url-from-point))))

(defalias 'color 'load-theme)
