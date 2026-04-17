# External Integrations

**Analysis Date:** 2026-04-16

## APIs & External Services

**Visualizations:**
- Custom SVG - No external charting libraries (D3.js, Chart.js) currently integrated. Interactive data is handled via native SVG and CSS animations in `src/components/ResearchDataViz.astro`.

**Icons:**
- `astro-icon` - Used for icon management in components.

## Data Storage

**Databases:**
- None - Static content approach.

**File Storage:**
- Astro Content Collections - Markdown files located in `src/content/blog/` used as the primary data source for the blog.

**Caching:**
- None - Static site generation relies on browser caching and CDN (GitHub Pages).

## Authentication & Identity

**Auth Provider:**
- None - Public personal website.

## Monitoring & Observability

**Error Tracking:**
- None detected.

**Logs:**
- Browser console logging only.

## CI/CD & Deployment

**Hosting:**
- GitHub Pages - Project is configured for deployment to `https://ajamj.github.io`.

**CI Pipeline:**
- GitHub Actions - Workflow in `.github/workflows/deploy.yml` automates build and deployment on push to `main`.

## Environment Configuration

**Required env vars:**
- `SITE` - Defined in `astro.config.mjs` as `https://ajamj.github.io`.

**Secrets location:**
- GitHub Actions secrets - Used for deployment permissions (`GITHUB_TOKEN`).

## Webhooks & Callbacks

**Incoming:**
- Netlify Forms (Attempted) - `src/components/ContactForm.astro` contains `data-netlify="true"`, but project is deployed to GitHub Pages. This integration will not function without migration to Netlify or an alternative service like Formspree.

**Outgoing:**
- None detected.

---

*Integration audit: 2026-04-16*
