;;; org-agenda.el --- Org Agenda Config for ar-org-pack -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Agenda file list and custom commands for the zettelkasten.
;; Loaded by the ar-org-pack after org-roam-directory is set.
;;
;;; Code:

(setq org-default-notes-file (concat org-roam-directory "/notes.org.gpg"))
(setq org-archive-location (concat org-roam-directory "/archive.org.gpg" "::datetree/"))
(setq org-agenda-files (list org-roam-directory))

(setq org-agenda-custom-commands
      `(("d" todo "DONE|CANCELLED" nil)
        ("w" todo "WAITING" nil)
        ("P" agenda "Today's Priorities"
         ((org-agenda-skip-function
           (lambda nil
             (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
          (org-agenda-ndays 1)
          (org-agenda-overriding-header "Today's Priority #A tasks: ")))
        ("c" "Weekly Commit Tickets"
         ((agenda "" ((org-agenda-files (list ,(concat org-roam-directory "/work.org.gpg")))
                      (org-agenda-span 'week)
                      (org-agenda-start-on-weekday 1)
                      (org-agenda-overriding-header "Worked on tickets: ")
                      (org-agenda-time-grid nil)))))
        ("u" alltodo ""
         ((org-agenda-skip-function
           (lambda nil
             (org-agenda-skip-entry-if (quote scheduled) (quote deadline)
                                       (quote regexp) "\n]+>")))
          (org-agenda-overriding-header "Unscheduled TODO entries: ")))
        ("A" agenda "" ((org-agenda-ndays 21)))))

;;; org-agenda.el ends here
