;; https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html

(require 'package)

(package-initialize nil)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
;; ========================================

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
;; ========================================

;; Package manager
(unless (package-installed-p 'use-package)
  (message "EMACS install use-package.el")
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
;; ========================================

;; https://dunmaksim.blogspot.com/2017/07/emacs-use-package.html

;;; Указываем откуда брать части настроек.
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory) user-emacs-directory)
        ((boundp 'user-init-directory) user-init-directory)
        (t "~/.emacs.d/")))

;;; Функция для загрузки настроек из указанного файла.
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;;; Части конфигурации. Порядок не имеет принципиального значения,
;;; однако я рекомендую некоторые базовые вещи помещать в начало,
;;; чтобы не было необходимости вспоминать базовые команды EMACS
;;; если в результате улучшения сломается один из базовых конфигов.
(load-user-file "base.el")
(load-user-file "visual.el")
(load-user-file "packages.el")
(load-user-file "colors.el")
(load-user-file "mappings.el")
(load-user-file "server.el")
;; ========================================
