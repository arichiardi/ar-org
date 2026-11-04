# ar-org

Personal org-roam zettelkasten. Notes live under `zettelkasten/` and are
encrypted with GPG (encrypt-to is set in `.dir-locals.el`). `commit.sh` stages
everything and commits with an ISO-8601 message.

## Journal timestamps are UTC

Journal entries (`zettelkasten/journal/YYYY-MM-DD.org.gpg`) are headed
`** HH:MM <title>`. The time comes from `format-time-string` in whatever
environment writes the note, and the coding agent runs in **UTC**, so entries it
writes carry UTC (GMT) times, not the local (America/Edmonton) wall clock.
This box's commits show an offset of UTC-6, so 20:06 UTC is 14:06 local.

Convert when reading if the local time matters.
