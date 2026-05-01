## ARCHITECTURE

High-level view
The codebase is a static site with no runtime server.

Key components
- index.html
- assets/
- scripts/
- styles/

Module boundaries
- There are no modules; pages are static.

Data flow
- Client-side rendering and static assets only

Rendering model
- HTML/CSS/JS

Directory responsibilities
- root/: pages
- assets/: media
- .planning/: planning artifacts

Build/test strategy
- No build step; tests not applicable

Versioning and deployment
- Git main branch is live on GitHub Pages

Known constraints
- No server code
- No dynamic content

Observability
- None

Future evolution
- If adding a dynamic feature, adopt a minimal SPA architecture

Risks
- If assets become large, performance risk

Next actions
- Confirm map progress
- Prepare for /gsd-plan-phase
