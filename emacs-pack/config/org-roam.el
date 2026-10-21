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

;; .org.gpg files get org-mode from auto-mode-alist ("\\.org"), so no
;; local variables lines are needed in the files themselves. Encryption
;; key and backup behaviour are set globally instead.
(setq epa-file-encrypt-to '("a.richiardi.work@gmail.com"))
(add-hook 'org-mode-hook
          (lambda ()
            (when (and buffer-file-name
                       (string-suffix-p ".org.gpg" buffer-file-name))
              (setq backup-inhibited t))))

(with-eval-after-load 'org-roam
  (org-roam-db-autosync-mode))

(custom-set-variables
 '(org-roam-database-connector 'sqlite))

;;; org-roam.el ends here
