# Architecture

**Analysis Date:** 2026-04-17

## Pattern Overview

**Overall:** Component-Based Static Site Generation (SSG)

**Key Characteristics:**
- **Island Architecture:** Leverages Astro's "Islands" to deliver zero-JS by default, only shipping interactivity where needed.
- **Content-Driven:** Uses Astro Content Collections for type-safe content management of blog posts and research data.
- **Utility-First Styling:** Integrates Tailwind CSS for rapid UI development alongside standard CSS Variables for theme management.

## Layers

**UI Layer (Components):**
- Purpose: Reusable UI elements and complex sections.
- Location: `src/components/`
- Contains: Astro components for Hero, Gallery, Charts, and Data Visualizations.
- Depends on: Global styles, public assets.
- Used by: Pages and Layouts.

**Content Layer:**
- Purpose: Managed data and markdown content.
- Location: `src/content/`
- Contains: Markdown files for blog posts (`blog/`) and schema definitions (`config.ts`).
- Depends on: Zod for schema validation.
- Used by: Pages (via Astro Content API).

**Routing Layer (Pages):**
- Purpose: Defines application structure and endpoints.
- Location: `src/pages/`
- Contains: Route components, including dynamic routes for blog posts (`blog/[...slug].astro`).
- Depends on: Layouts and Components.

**Layout Layer:**
- Purpose: Shared page structure and global metadata.
- Location: `src/layouts/`
- Contains: `Layout.astro` which provides the HTML skeleton, SEO tags, and standard styling.
- Depends on: Global styles, Header/Footer components.

## Data Flow

**Content Retrieval Flow:**

1. Content is authored in Markdown files in `src/content/blog/`.
2. Astro validates content against schemas defined in `src/content/config.ts`.
3. Pages in `src/pages/blog/` use `getCollection('blog')` to fetch content.
4. Data is mapped to props and passed into components like `BlogPreview.astro`.

**State Management:**
- **Build-time State:** Most state is handled during the build process to generate static HTML.
- **Client-side Interactivity:** Handled via CSS animations and SVG interactions in components like `ResearchDataViz.astro` and `SkillsChart.astro`.

## Key Abstractions

**Content Collections:**
- Purpose: Provides a type-safe way to manage Markdown/MDX content with automatic schema validation.
- Examples: `src/content/blog/`
- Pattern: Data Modeling with Zod.

**Astro Components:**
- Purpose: Encapsulated HTML/CSS logic for specific UI sections.
- Examples: `src/components/ResearchDataViz.astro`, `src/components/CareerTimeline.astro`
- Pattern: Multi-framework components (though currently using pure Astro/HTML).

## Entry Points

**Main Index:**
- Location: `src/pages/index.astro`
- Triggers: Root URL access.
- Responsibilities: Composing the landing page from multiple section components (Hero, Gallery, ResearchDataViz, etc.).

**Blog Entry:**
- Location: `src/pages/blog/index.astro`
- Triggers: `/blog` route.
- Responsibilities: Listing all blog posts with previews.

## Error Handling

**Strategy:** Build-time validation and basic 404 handling.

**Patterns:**
- **Schema Validation:** Zod schemas in `src/content/config.ts` catch content errors during build.
- **Type Safety:** TypeScript ensures component props and content data match expected shapes.

## Cross-Cutting Concerns

**Logging:** Standard console output during build/dev.
**Validation:** Content schema validation via Astro/Zod.
**Authentication:** Not applicable (static site).
**SEO:** Managed via `astro-seo` in `src/layouts/Layout.astro`.

---

*Architecture analysis: 2026-04-17*
