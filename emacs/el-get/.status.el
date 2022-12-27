((autopair status "installed" recipe
           (:name autopair :after
                  (progn
                    (autopair-global-mode)
                    (setq autopair-blink nil)
                    (setq autopair-pair-criteria 'always)
                    (setq autopair-skip-whitespace 'chomp))
                  :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (cmake-mode status "installed" recipe
             (:name cmake-mode :after
                    (progn
                      (autoload 'cmake-mode "cmake-mode" "Editing cmake files" t)
                      (add-to-list 'auto-mode-alist
                                   '("CMakeLists\\.txt$" . cmake-mode))
                      (add-to-list 'auto-mode-alist
                                   '("\\.cmake$" . cmake-mode))
                      (add-hook 'cmake-mode-hook 'ecfg--cmake-hook))
                    :website "http://www.itk.org/Wiki/CMake/Editors/Emacs" :description "Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake source files." :type http :url "http://cmake.org/gitweb?p=cmake.git;a=blob_plain;hb=master;f=Auxiliary/cmake-mode.el"))
 (coffee-mode status "installed" recipe
              (:name coffee-mode :after
                     (progn
                       (add-hook 'coffee-mode-hook 'ecfg--coffee-hook))
                     :website "https://github.com/defunkt/coffee-mode" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode"))
 (company-mode status "installed" recipe
               (:name company-mode :after
                      (progn
                        (ecfg-with-local-autoloads
                         (autoload 'company-complete "company" nil t)
                         (eval-after-load "company"
                           '(progn
                              (add-to-list 'company-begin-commands 'backward-delete-char)
                              (setq company-dabbrev-ignore-case t company-dabbrev-code-ignore-case t company-dabbrev-downcase nil company-minimum-prefix-length 2 company-backends
                                    '((company-capf :with company-dabbrev-code company-keywords)
                                      company-dabbrev))
                              (define-key company-active-map
                                (kbd "<tab>")
                                'company-complete-selection)
                              (define-key company-active-map
                                (kbd "C-w")
                                nil)
                              (global-company-mode)))))
                      :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (diminish status "installed" recipe
           (:name diminish :after
                  (progn
                    (eval-after-load "abbrev"
                      '(diminish 'abbrev-mode))
                    (eval-after-load "undo-tree"
                      '(diminish 'undo-tree-mode))
                    (eval-after-load "projectile"
                      '(diminish 'projectile-mode "Prj")))
                  :description "An Emacs package that diminishes the amount of space taken on the mode line by the names of minor modes." :type http :url "http://www.eskimo.com/~seldon/diminish.el" :features diminish))
 (drag-stuff status "installed" recipe
             (:name drag-stuff :after
                    (progn
                      (autoload 'drag-stuff-up "drag-stuff")
                      (autoload 'drag-stuff-down "drag-stuff"))
                    :website "https://github.com/rejeep/drag-stuff#readme" :description "Drag Stuff is a minor mode for Emacs that makes it possible to drag stuff, such as words, region and lines, around in Emacs." :features nil :type github :pkgname "rejeep/drag-stuff.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :features el-get :post-init
                (when
                    (memq 'el-get
                          (bound-and-true-p package-activated-list))
                  (message "Deleting melpa bootstrap el-get")
                  (unless package--initialized
                    (package-initialize t))
                  (when
                      (package-installed-p 'el-get)
                    (let
                        ((feats
                          (delete-dups
                           (el-get-package-features
                            (el-get-elpa-package-directory 'el-get)))))
                      (el-get-elpa-delete-package 'el-get)
                      (dolist
                          (feat feats)
                        (unload-feature feat t))))
                  (require 'el-get))))
 (emmet-mode status "installed" recipe
             (:name emmet-mode :after
                    (progn
                      (autoload 'emmet-mode "emmet-mode" nil t)
                      (add-hook 'sgml-mode-hook 'emmet-mode)
                      (add-hook 'web-mode-hook 'emmet-mode))
                    :website "https://github.com/smihica/emmet-mode" :description "Produce HTML from CSS-like selectors." :type "github" :branch "master" :pkgname "smihica/emmet-mode"))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental completion and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
              (("make"))
              :build/darwin
              `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (let
                  ((generated-autoload-file
                    (expand-file-name "helm-autoloads.el"))
                   \
                   (backup-inhibited t))
                (update-directory-autoloads default-directory)
                nil)
              :features "helm-config" :post-init nil))
 (helm-css-scss status "installed" recipe
                (:name helm-css-scss :after
                       (progn
                         (ecfg-with-local-autoloads
                          (setq helm-css-scss-insert-close-comment-depth 2)
                          (setq helm-css-scss-split-direction 'split-window-vertically)
                          (dolist
                              ($hook
                               '(css-mode-hook scss-mode-hook less-css-mode-hook))
                            (add-hook $hook
                                      (lambda nil
                                        (local-set-key
                                         (kbd "s-i")
                                         'helm-css-scss)
                                        (local-set-key
                                         (kbd "s-I")
                                         'helm-css-scss-back-to-last-point))))))
                       :description "CSS/SCSS/LESS Selectors with helm interface." :type github :pkgname "ShingoFukuyama/helm-css-scss" :depends helm))
 (helm-projectile status "installed" recipe
                  (:name helm-projectile :after
                         (progn
                           (ecfg-with-local-autoloads))
                         :description "Helm integration for Projectile." :type github :pkgname "bbatsov/helm-projectile" :depends
                         (projectile helm cl-lib)))
 (jade-mode status "installed" recipe
            (:name jade-mode :after
                   (progn
                     (autoload 'stylus-mode "stylus-mode" nil t)
                     (autoload 'jade-mode "jade-mode" nil t)
                     (add-to-list 'auto-mode-alist
                                  '("\\.styl$" . stylus-mode))
                     (add-to-list 'auto-mode-alist
                                  '("\\.jade$" . jade-mode))
                     (add-hook 'jade-mode-hook 'ecfg--jade-hook)
                     (add-hook 'stylus-mode-hook 'ecfg--stylus-hook))
                   :website "https://github.com/brianc/jade-mode" :description "Emacs major mode for jade template highlighting" :features nil :type github :pkgname "brianc/jade-mode"))
 (js2-mode status "installed" recipe
           (:name js2-mode :after
                  (progn
                    (ecfg-with-local-autoloads
                     (add-to-list 'auto-mode-alist
                                  '("\\.jsx?$" . js2-jsx-mode))
                     (eval-after-load 'js2-mode
                       '(progn
                          (setq js2-basic-offset 2 js2-cleanup-whitespace t js2-auto-indent-p t js2-bounce-indent-p nil js2-idle-timer-delay 0.5 js2-mirror-mode nil js2-missing-semi-one-line-override t js2-allow-keywords-as-property-names nil js2-strict-missing-semi-warning nil js2-pretty-multiline-declarations t)
                          (define-key js2-mode-map
                            (kbd "RET")
                            'js2-line-break)))
                     (add-hook 'js2-mode-hook 'ecfg--js-hook)
                     (add-hook 'js2-jsx-mode-hook
                               #'(lambda nil
                                   (setq-local sgml-basic-offset js2-basic-offset)))))
                  :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
                  (autoload 'js2-mode "js2-mode" nil t)))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :after
                       (progn
                         (autoload 'markdown-mode "markdown-mode" nil t)
                         (add-to-list 'auto-mode-alist
                                      '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode)))
                       :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type git :url "http://jblevins.org/git/markdown-mode.git" :prepare
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (org-mode status "required" recipe nil)
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
                  (dash epl)))
 (projectile status "installed" recipe
             (:name projectile :description "Project navigation and management library for Emacs." :type github :pkgname "bbatsov/projectile" :depends pkg-info))
 (scss-mode status "installed" recipe
            (:name scss-mode :after
                   (progn
                     (autoload 'scss-mode "scss-mode" nil t)
                     (add-to-list 'auto-mode-alist
                                  '("\\.scss$" . scss-mode))
                     (add-hook 'scss-mode-hook 'ecfg--scss-hook))
                   :description "Major mode for editing SCSS files(http://sass-lang.com)" :type github :pkgname "antonj/scss-mode" :features nil))
 (sml-modeline status "installed" recipe
               (:name sml-modeline :after
                      (progn
                        (require 'sml-modeline)
                        (setq sml-modeline-borders
                              '("[" . "]"))
                        (setq sml-modeline-len 14)
                        (sml-modeline-mode t))
                      :description "Show position in a scrollbar like way in mode-line" :type http :url "http://bazaar.launchpad.net/~nxhtml/nxhtml/main/download/head%3A/smlmodeline.el-20100318165023-n7kkswg6dlq8l6b3-1/sml-modeline.el" :features "sml-modeline"))
 (undo-tree status "installed" recipe
            (:name undo-tree :after
                   (progn
                     (ecfg-with-local-autoloads
                      (eval-after-load "undo-tree"
                        '(progn
                           (define-key undo-tree-map
                             (kbd "C-/")
                             nil)
                           (define-key undo-tree-map "" nil)
                           (define-key undo-tree-map
                             (kbd "C-?")
                             nil)
                           (define-key undo-tree-map
                             (kbd "M-_")
                             nil)
                           (define-key undo-tree-map
                             (kbd " u")
                             nil)
                           (global-set-key
                            (kbd "C-z")
                            'undo-tree-undo)
                           (global-set-key
                            (kbd "s-z")
                            'undo-tree-undo)
                           (global-set-key
                            (kbd "M-z")
                            'undo-tree-redo)
                           (global-set-key
                            (kbd "s-Z")
                            'undo-tree-visualize)))
                      (defun ecfg--load-undo-tree-hook nil
                        (let
                            ((buffer
                              (buffer-name)))
                          (unless
                              (and
                               (string-match-p "^[ 	]*\\*.*\\*[ 	]*$" buffer)
                               (not
                                (string= "*scratch*" buffer)))
                            (global-undo-tree-mode)
                            (remove-hook 'first-change-hook 'ecfg--load-undo-tree-hook))))
                      (add-hook 'window-setup-hook
                                (lambda nil
                                  (add-hook 'first-change-hook 'ecfg--load-undo-tree-hook)))))
                   :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
 (web-mode status "installed" recipe
           (:name web-mode :after
                  (progn
                    (autoload 'web-mode "web-mode" nil t)
                    (add-to-list 'auto-mode-alist
                                 '("\\.\\(xml\\|x?html?\\)\\'" . web-mode))
                    (add-to-list 'auto-mode-alist
                                 '("\\.phtml\\'" . web-mode))
                    (add-to-list 'auto-mode-alist
                                 '("\\.tpl\\.php\\'" . web-mode))
                    (add-to-list 'auto-mode-alist
                                 '("\\.[agj]sp\\'" . web-mode))
                    (add-to-list 'auto-mode-alist
                                 '("\\.as[cp]x\\'" . web-mode))
                    (add-to-list 'auto-mode-alist
                                 '("\\.erb\\'" . web-mode))
                    (add-to-list 'auto-mode-alist
                                 '("\\.mustache\\'" . web-mode))
                    (add-to-list 'auto-mode-alist
                                 '("\\.djhtml\\'" . web-mode))
                    (add-to-list 'auto-mode-alist
                                 '("\\.ejs\\'" . web-mode))
                    (ecfg-install emmet-mode
                                  (autoload 'emmet-mode "emmet-mode" nil t)
                                  (add-hook 'sgml-mode-hook 'emmet-mode)
                                  (add-hook 'web-mode-hook 'emmet-mode))
                    (add-hook 'web-mode-hook 'ecfg--web-mode-hook))
                  :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :after
                   (progn
                     (autoload 'yaml-mode "yaml-mode" nil t)
                     (add-to-list 'auto-mode-alist
                                  '("\\.ya?ml\\'" . yaml-mode)))
                   :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
 (yasnippet status "installed" recipe
            (:name yasnippet :after
                   (progn
                     (autoload 'yas-minor-mode "yasnippet" "turns yasnippet minor mode on" t)
                     (eval-after-load "yasnippet"
                       '(progn
                          (setq yas-snippet-dirs
                                (expand-file-name "snippets" ecfg-dir))
                          (yas-reload-all))))
                   :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
                   (("git" "submodule" "update" "--init" "--" "snippets")))))
