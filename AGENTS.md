# ar-org conventions

This file lists conventions specific to this vault. The org-roam adhoc-memory
skill covers general operations. These rules apply to the ar-org vault.

## Issues

Issues are first-class notes. Keep them in `zettelkasten/issues.org.gpg`. That
file is one org-roam node titled "Issues". Each issue is a top-level `*`
heading. Do not create per-issue org-roam files.

### Heading

- Start each issue with an org state keyword: `TODO` for open, `DONE` for
  resolved.
- End the heading with one org tag for the area, for example `:strata:`.
- Link the affected node in the title with an inline id link, for example
  `[[id:UUID][Strata]]`. The project, host, or tool the issue is about is the
  node the issue points to.

Format:

```org
* TODO [[id:UUID-of-project][Project]]: short problem title :areatag:
```

### Body

Use `**` subheadings. Use these, in order, and drop the ones that do not apply:

- `** Symptom`: what the user sees. The failing command, version, and error
  text go here.
- `** Cause`: the root cause.
- `** Diagnosis`: commands that confirm the cause.
- `** Solution`: the fix. Keep it for resolved issues.
- `** Verification`: how to confirm the fix works.
- `** Source`: a link to the upstream tracker, doc, or issue that documents
  the problem.

### External issue links

When an issue has an upstream tracker entry (GitHub, GitLab), store the URL as
an inline org link under `** Source` of the issue heading. Do not store that
URL in `:ROAM_REFS:` on the project node. The issue note owns the reference to
its upstream entry.

### Links

- Issue to affected node: inline `[[id:UUID][Title]]` in the issue title.
- Project to issue: inline `[[url][#id]]` link to the upstream tracker in the
  project node body. Issue headings have no org-roam id, so link them by URL.

### Example

```org
* TODO [[id:e81a85f3-cebd-404b-8084-6bf23b8ae533][Strata]]: CUDA rebuild recompiles all kernels (no compiler cache) :strata:
** Symptom
Rebuilding the Strata engine image recompiles every CUDA kernel from scratch.
** Cause
The build uses no compiler cache. nvcc runs with a clean cache.
** Source
[[https://github.com/Niko1221/Strata/issues/6100][Strata issue #6100]]
** Solution
Open. Candidate: add ccache or sccache for nvcc.
```
