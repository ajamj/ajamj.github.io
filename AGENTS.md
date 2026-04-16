# AGENTS.md — ajamj.github.io

## Project Identity

This is a **personal portfolio website** for **Ajam Jamaludin**, deployed at `https://ajamj.github.io`.

- **Background**: Geophysics researcher, junior (2026). Alumni of Universitas Gadjah Mada.
- **Work focus**: Seismology, seismic data processing, earthquake monitoring, seismic exploration for oil & gas.
- **Role**: Junior Geophysical Research Assistant.
- **Core value**: Visitors quickly understand Ajam's expertise, explore portfolio projects, and make contact.

## Tech Stack

- Static site on **GitHub Pages** (main branch, root folder — no `gh-pages`, no CI/CD).
- **HTML/CSS/JS only** — no framework, no build step.
- Plain HTML files pushed to `main` branch auto-serve from `https://ajamj.github.io` within ~2 minutes.
- If adding a generator, prefer minimal dependency overhead (Jekyll, Hugo, Astro all acceptable).

## Deployment

- Push to `main` branch — GitHub Pages serves from `main`/`root` automatically.
- No `gh-pages` branch, no GitHub Actions needed for a simple static site.
- After push, site is live within ~2 minutes.

## Local Preview

Open `index.html` directly in a browser, or serve with:
```bash
npx serve .
```
If using Jekyll (GitHub Pages default):
```bash
bundle install
bundle exec jekyll serve --livereload
```

## Planning Artifacts

All planning is in `.planning/`:

| Artifact | Purpose |
|----------|---------|
| `.planning/PROJECT.md` | Living project context, requirements, decisions |
| `.planning/REQUIREMENTS.md` | Checkable v1/v2 requirements with REQ-IDs |
| `.planning/ROADMAP.md` | Phase structure with success criteria |
| `.planning/STATE.md` | Current phase status and milestone tracking |
| `.planning/config.json` | Workflow preferences (granularity, agents, models) |

## Roadmap (v1.0 MVP)

| # | Phase | Goal | Requirements |
|---|-------|------|--------------|
| 1 | Foundation | HTML skeleton, responsive layout, typography | STRU-01–04, DESN-01–05 |
| 2 | Content | About, Projects, Skills with geophysics context | CONT-01–05 |
| 3 | Contact & SEO | Contact section, meta tags, no tracking | CONT-06, TECH-01–03 |
| 4 | Polish | Visual refinement, responsive testing, final deploy | All |

Run `/gsd-discuss-phase 1` to start execution.

## Content Guidelines

- Include: About/Bio, Projects/Portfolio (seismic processing, earthquake monitoring), Skills, Contact.
- Use a clean, academic/professional aesthetic suitable for a research portfolio.
- No dark patterns, no intrusive tracking, no third-party analytics.
- Keep it fast and accessible.

## Workflow

- **Granularity**: Fine (8–12 phases)
- **Parallelization**: Yes (independent plans run simultaneously)
- **Workflow agents**: Research + Plan Check + Verifier enabled
- **Model**: Quality profile (Opus for research/roadmap)
- **Auto-advance**: Enabled — chains to next phase after completion
