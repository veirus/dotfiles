;;; org-evil-commands.el --- org-evil general commands.

;; Copyright (C) 2016, 2018 Ben Moon
;; Author: Ben Moon <software@guiltydolphin.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;;
;;; Defines org-evil general commands.
;;;
;;; Code:

(require 'dash)
(require 'evil)
(require 'org-evil-core)

(org-evil--define-minor-mode org-evil-command-mode
  "Minor-mode for general org-evil commands."
  t
  :keymap (make-sparse-keymap))

(org-evil--define-regional-minor-mode org-evil-heading-mode
  "Minor mode active when in an Org heading."
  (org-at-heading-p)
  :keymap (make-sparse-keymap))

(evil-define-operator org-evil-promote
  (beg end &optional count)
  "Promote the current subtree.

With a visual selection, promote the selected headings.
Otherwise, act upon the current subtree."
  :type line
  :motion nil
  (interactive "<r><c>")
  (let* ((beg (set-marker (make-marker) beg))
         (end (set-marker (make-marker) end))
         (count (or count 1))
         (subtree-promoter (if (>= count 0) 'org-promote-subtree 'org-demote-subtree))
         (do-promoter (if (>= count 0) 'org-do-promote 'org-do-demote))
         (count (abs count)))
    (if (not (evil-visual-state-p))
        (--dotimes count (funcall subtree-promoter))
      (--dotimes count (funcall do-promoter)))))

(evil-define-operator org-evil-demote
  (beg end &optional count)
  "Demote the current subtree.

See also `org-evil-promote'."
  :type line
  :motion nil
  (interactive "<r><c>")
  (funcall 'org-evil-promote beg end (- (or count 1))))

(evil-define-minor-mode-key 'normal 'org-evil-heading-mode
  "<" 'org-evil-promote
  ">" 'org-evil-demote)

(provide 'org-evil-commands)
;;; org-evil-commands.el ends here
