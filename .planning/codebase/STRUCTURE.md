# Codebase Structure

**Analysis Date:** 2026-04-17

## Directory Layout

```
ajamj.github.io/
├── .github/workflows/  # CI/CD pipelines (GitHub Actions)
├── .planning/          # GSD planning and codebase analysis
├── public/             # Static assets (CV, icons)
├── img/                # Project and profile images
└── src/
    ├── components/     # Astro components (UI units)
    ├── content/        # Content collections (Markdown)
    │   └── blog/       # Blog post source files
    ├── layouts/        # Page layout templates
    ├── pages/          # Routing and page components
    │   └── blog/       # Blog-related routes
    └── styles/         # Global CSS and design system
```

## Directory Purposes

**src/components/:**
- Purpose: Houses all reusable UI components and page sections.
- Contains: `.astro` files.
- Key files: `ResearchDataViz.astro`, `SkillsChart.astro`, `CareerTimeline.astro`.

**src/content/:**
- Purpose: Managed content area for data-driven parts of the site.
- Contains: Markdown (`.md`) files and schema configuration.
- Key files: `config.ts` (schema definitions).

**src/pages/:**
- Purpose: Application routing using file-based routing.
- Contains: `.astro` files representing individual pages or dynamic routes.
- Key files: `index.astro` (home), `blog/index.astro` (blog list).

**src/layouts/:**
- Purpose: Base templates for the site's pages.
- Contains: `Layout.astro`.

**src/styles/:**
- Purpose: Global styles and theme definitions.
- Contains: `global.css`.

## Key File Locations

**Entry Points:**
- `src/pages/index.astro`: The primary landing page.
- `src/pages/blog/index.astro`: Blog index page.

**Configuration:**
- `astro.config.mjs`: Astro framework configuration.
- `package.json`: Project dependencies and scripts.
- `tsconfig.json`: TypeScript configuration.

**Core Logic:**
- `src/content/config.ts`: Defines data structures for the site.

**Testing:**
- Not detected (likely handled via build-time validation).

## Naming Conventions

**Files:**
- Astro Components: PascalCase (`BlogPreview.astro`).
- Content Files: kebab-case (`hidup-itu-ujian.md`).
- Pages: kebab-case or `[...slug].astro` for dynamic routes.

**Directories:**
- Lowercase/kebab-case (`components`, `content`).

## Where to Add New Code

**New Feature:**
- Primary code: Create a new component in `src/components/`.
- Integration: Add the component to `src/pages/index.astro` or a new page.

**New Blog Post:**
- Implementation: Add a new `.md` file to `src/content/blog/`.

**Utilities:**
- Shared helpers: Create `src/lib/` or `src/utils/` (if needed, currently not present).

## Special Directories

**.planning/:**
- Purpose: Contains GSD framework documentation and plans.
- Generated: No (managed by agents).
- Committed: Yes.

**public/:**
- Purpose: Assets served at the root path (e.g., `public/favicon.svg` -> `/favicon.svg`).
- Generated: No.
- Committed: Yes.

---

*Structure analysis: 2026-04-17*
