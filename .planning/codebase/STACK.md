## STACK

Overview
This document captures the current codebase technology footprint.

Repository scope
Ajam's static site lives in the root and uses plain HTML/CSS/JS with no framework or build step.

Primary language(s)
- HTML
- CSS
- JavaScript

Frameworks and runtimes
- None (static hosting)

Build/run process
- No bundler, no npm scripts
- Local preview via simple static server

Deployment
- GitHub Pages on main/root
- Auto-serve after push, typical ~2 minutes

Directory layout (highlights)
- index.html: landing page
- assets/: images, fonts, icons
- scripts/: small JS
- .planning/: planning artifacts

Developer notes
- Use plain diff and minimal changes
- Avoid heavy tooling

Known constraints
- No server-side code
- No external dependencies

Next steps
- Review codebase docs
- Prepare for /gsd-plan-phase
