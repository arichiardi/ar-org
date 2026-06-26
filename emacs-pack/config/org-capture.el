;;; org-capture.el --- All Capture Templates for ar-org-pack -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; All capture templates: org-roam-dailies, org-roam, and general org-capture.
;; Loaded after org-roam-directory is bootstrapped.
;;
;;; Code:

;; --- Shared template parts ---

(setq ar-emacs--org-capture-todo (string-join
                                  (list "* TODO %^{Brief Description} %^g"
                                        ":LOGBOOK:"
                                        ":ADDED: %U"
                                        ":END:"
                                        "%?")
                                  "\n"))

(setq ar-emacs--org-roam-capture-todo-header "* TODO %^{Brief Description} %^g")
(setq ar-emacs--org-roam-capture-work-todo
    (string-join
     (list ar-emacs--org-roam-capture-todo-header
           ":PROPERTIES:"
           ":ID: %(org-id-new)"
           ":END:"
           "%?")
     "\n"))

;; --- Org Roam Dailies ---

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

;; --- Org Roam Capture ---

(setq org-roam-capture-templates
      `(("w" "Work Templates")
        ("wt" "Work Todo"
         entry
         ,ar-emacs--org-roam-capture-work-todo
         :target (file+olp ,ar-emacs--org-roam-current-job-file ("Tasks"))
         :clock-resume t)))

;; --- General Org Capture ---

(setq org-capture-templates
      `(("a" "Article/video to read/watch"
         entry
         (file "")
         "* %U\n%?\n" :clock-resume t)

        ("t" "Todo"
         entry
         (file "")
         ,ar-emacs--org-capture-todo
         :clock-resume t)

        ("e" "Email"
         entry
         (file "")
         "* TODO %^{Title}\n Source: %u, %c\n\n  %i" :clock-resume t)

        ("n" "Note, snippet, word or fact"
         entry
         (file "")
         ,(string-join
           (list "* %? :note:"
                 "%A"
                 ":LOGBOOK:"
                 "ADDED: %U"
                 ":END:"
                 "%?")
           "\n") :clock-resume t)

        ("wr" "Review Note"
         entry
         (file ,(concat org-roam-directory "/work.org.gpg"))
         ,(string-join
           (list "* %^{Brief Description} :review:%^g:"
                 ":LOGBOOK:"
                 "ADDED: %U"
                 ":END:"
                 "%?")
           "\n") :clock-resume t)

        ("wm" "Meeting/Call"
         entry
         (file ,(concat org-roam-directory "/work.org.gpg"))
         "* %^{Name} :meeting:\n%?\n" :clock-resume t)

        ("rs" "Respond to"
         entry
         (file "")
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-resume t)))

;;; org-capture.el ends here
