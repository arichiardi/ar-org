;;; org-capture.el --- Org Capture Templates for ar-org-pack -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Capture templates for the zettelkasten.
;; Loaded by the ar-org-pack after org-roam-directory is set.
;;
;;; Code:

(setq ar-emacs--org-capture-todo (string-join
                                  (list "* TODO %^{Brief Description} %^g"
                                        ":LOGBOOK:"
                                        ":ADDED: %U"
                                        ":END:"
                                        "%?")
                                  "\n"))

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

        ("w" "Work Templates")

        ("wt" "Work Todo"
         entry
         (file ,(concat org-roam-directory "/work.org.gpg"))
         ,ar-emacs--org-capture-todo
         :clock-resume t)

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
