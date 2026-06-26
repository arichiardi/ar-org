;;; org-roam.el --- Org Roam Config for ar-org-pack -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Core org-roam settings. Loaded after org-roam-directory is bootstrapped
;; in init.el.
;;
;;; Code:

(setq org-roam-dailies-directory "journal/")
(setq org-roam-link-extensions '(".org" ".org.gpg"))
(setq org-roam-db-location (expand-file-name "org-roam.db" live-etc-dir))
(setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

(setq ar-emacs--org-roam-current-job-file (concat org-roam-directory "/comcast.org.gpg"))

(with-eval-after-load 'org-roam
  (org-roam-db-autosync-mode))

(custom-set-variables
 '(org-roam-database-connector 'sqlite))

;;; org-roam.el ends here
