;;; init.el --- Init file for the ar-org-pack  -*- lexical-binding: t; -*-
;;
;; Author: Andrea Richiardi

;;; Commentary:
;;
;; org-roam manual is at https://www.orgroam.com/manual.html
;;
;;; Code:

(setq ar-emacs-org-directory "~/git/ar-org")

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
         ("j" . org-roam-dailies-capture-today))

  :config
  (setq org-roam-directory (concat ar-emacs-org-directory "/zettelkasten"))
  (setq org-roam-dailies-directory "journal/")
  (setq ar-emacs--org-roam-current-job-file (concat org-roam-directory "/comcast.org.gpg"))

  (setq org-roam-link-extensions '(".org" ".org.gpg"))
  (setq org-roam-db-location (expand-file-name "org-roam.db" live-etc-dir))
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

  ;; capture
  (setq ar-emacs--org-roam-capture-todo-header "* TODO %^{Brief Description} %^g")
  (setq ar-emacs--org-roam-capture-work-todo
    (string-join
     (list ar-emacs--org-roam-capture-todo-header
           ":PROPERTIES:"
           ":ID: %(org-id-new)"
           ":END:"
           "%?")
     "\n"))

  (setq org-roam-dailies-capture-templates
        `(("d" "default"
           entry
           "** %<%H:%M %p> %i%?\n"
           :if-new (file+head+olp
                    "%<%Y-%m-%d>.org.gpg"
                    ,(string-join
                      (list ":PROPERTIES:"
                            ":ID: %(org-id-new)"
                            ":END:"
                            "-*- epa-file-encrypt-to: (\"a.richiardi.work@gmail.com\") -*-"
                            "-*- backup-inhibited t; -*-"
                            "#+TITLE: %<%Y-%m-%d>"
                            "#+AUTHOR: Andrea Richiardi"
                            "#+CATEGORY: daily"
                            "#+STARTUP: content indent")
                      "\n")
                    ("Journal"))
           :jump-to-captured t)))

  (setq org-roam-capture-templates
        `(("w" "Work Templates")
	      ("wt" "Work Todo"
           entry
           ,ar-emacs--org-roam-capture-work-todo
           :target (file+olp ,ar-emacs--org-roam-current-job-file ("Tasks"))
           :clock-resume t)))

  (org-roam-db-autosync-mode)
  :custom
  (org-roam-database-connector 'sqlite))

(use-package org-roam-ui
  :after org
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start nil))

;;; init.el ends here
