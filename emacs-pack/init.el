;;; init.el --- Init file for the ar-org-pack  -*- lexical-binding: t; -*-
;;
;; Author: Andrea Richiardi

;;; Commentary:
;;
;; Bootstrap org-roam-directory, then load config files from config/.
;;
;;; Code:

(setq ar-emacs-org-directory "~/git/ar-org")
(setq org-roam-directory (concat ar-emacs-org-directory "/zettelkasten"))

(use-package org-roam
  :after org
  :bind-keymap ("C-c o" . org-roam-map)
  :bind (:map org-roam-mode-map
         ("l" . org-roam-buffer-toggle)
         ("f" . org-roam-node-find)
         ("g" . org-roam-graph)
         ("n" . org-roam-node-insert)
         ("c" . org-roam-capture)
         ("i" . org-id-get-create)
         ("j" . org-roam-dailies-capture-today)))

;; Load config files (depend on org-roam-directory being set)
(live-load-config-file "org-roam.el")
(live-load-config-file "org-capture.el")
(live-load-config-file "org-agenda.el")

(use-package org-roam-ui
  :after org
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start nil))

;;; init.el ends here
