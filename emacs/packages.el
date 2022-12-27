;;; Package --- Summary
;;; Commentary:
;;; Install and configure packages

;;; Code:

(use-package diminish)
(use-package fzf)
(use-package calfw)

;;; Этот модуль отвечает за подсказки и автозавершение. Он новее, чем
;;; autocomplete, и активно развивается. Большая часть плагинов
;;; дополнения сейчас пишется именно под него.
(use-package company
  :ensure t
  :diminish company-mode
  :config (setq company-backends (remove 'company-ropemacs company-backends) company-tooltip-limit
                20 company-tooltip-align-annotations t)
  (global-company-mode 1))

;; powerline
(use-package powerline
  :diminish indent-guide-mode
  )

;; (use-package airline-themes
;;   :requires powerline
;;   :config
;;   (powerline-default-theme)
;;   (load-theme 'airline-badwolf)
;;   (setq
;;    ;; powerline-utf-8-separator-left        #xe0b0
;;    ;; powerline-utf-8-separator-right       #xe0b2
;;    ;; airline-utf-glyph-separator-left      #xe0b0
;;    ;; airline-utf-glyph-separator-right     #xe0b2
;;    ;; airline-utf-glyph-subseparator-left   #xe0b1
;;    airline-utf-glyph-subseparator-right  #xe0b3
;;    ;; airline-utf-glyph-branch              #xe0a0
;;    ;; airline-utf-glyph-readonly            #xe0a2
;;    airline-utf-glyph-linenumber          #xe0a1)
;;   )

;;; Иконки в статус-баре
(use-package mode-icons
  :config (mode-icons-mode 1))

;;; Показ отступов во всех режимах
(use-package indent-guide
  :diminish indent-guide-mode
  :config
  (indent-guide-global-mode 1))

;;; Дерево отмены
(use-package undo-tree
  :diminish undo-tree-mode
  :config (global-undo-tree-mode 1))

;;; Цветные скобочки
(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
        (setq rainbow-delimiters-max-face-count 9))

;;; Evil-mode
(use-package evil
    :ensure t
    :config
    (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :diminish evil-leader-mode
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
	"e" 'find-file
	"b" 'switch-to-buffer
	"k" 'kill-buffer
	"v" 'exchange-point-and-mark
	"-" 'evil-numbers/dec-at-pt
	"=" 'evil-numbers/inc-at-pt))

  (use-package evil-surround
    :ensure t
    :diminish evil-surround-mode
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t)

  (use-package evil-rsi
    :ensure t
    :diminish evil-rsi-mode
    :config
    (evil-rsi-mode))

  (use-package evil-snipe
    :ensure t
    :diminish evil-snipe-mode
    :config
    (evil-snipe-mode +1)
    (evil-snipe-override-mode +1)
    (setq evil-snipe-scope 'visible
	  evil-snipe-repeat-scope 'visible
	  evil-snipe-repeat-keys nil
	  evil-snipe-use-vim-sneak-bindings 1))

  (use-package evil-space
    :ensure t)

  (use-package evil-numbers
    :ensure t)
)

;;; Helm
(use-package helm
    :ensure t
    :commands helm-mode
    :config
    (helm-mode 1)
    (setq helm-quick-update t
	  helm-buffers-fuzzy-matching t)
    :bind (("C-c v"	.	helm-show-kill-ring)
	   ("M-x"	.	helm-M-x)
	   ("C-x C-b"	.	helm-buffers-list)
	   ("C-x C-f"	.	helm-find-files)
))

;;; Org-mode {{{
(use-package org
  :ensure t
  :defer t
  :commands (org-capture)
  :bind (("C-c c" .   org-capture)
	 ("C-c l" .   org-store-link)
	 ("C-c a" .   org-agenda)
	 ("C-c b" .   org-iswitchb)
	 ("C-c y" .   my-smarter-kill-ring-save))
  :config
  (setq show-trailing-whitespace t)

  (use-package evil-org
    :ensure t
    :after org
    :config
    (add-hook 'org-mode-hook 'evil-org-mode)
    (add-hook 'evil-org-mode-hook
	      (lambda ()
		(evil-org-set-key-theme)

		(evil-leader/set-key-for-mode 'org-mode
		  "r" 'org-refile
		  "n" 'org-add-note)))
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))

  ;; (use-package org-evil
  ;;   :ensure t
  ;;   :config
  ;;   (evil-define-minor-mode-key 'normal 'org-evil-heading-mode
  ;;     "@" 'org-refile)
  ;;   (evil-define-minor-mode-key 'normal 'org-evil-heading-mode
  ;;     "#" 'org-add-note))

  (use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    (setq org-bullets-bullet-list '("•")))

  ;; org-mode END }}}
)
