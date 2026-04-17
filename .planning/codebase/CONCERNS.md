# Codebase Concerns

**Analysis Date:** 2025-05-14

## Tech Debt

**Static Data Visualizations:**
- Issue: Visualization components use hardcoded SVG paths and CSS for animations rather than data-driven frameworks.
- Files: `src/components/ResearchDataViz.astro`, `src/components/SkillsChart.astro`
- Impact: Difficult to update with real research data; scaling to complex geophysics datasets will be extremely labor-intensive and error-prone.
- Fix approach: Integrate a data visualization library like D3.js or Plotly.js to render charts dynamically from JSON/CSV data.

**Manual Blog Image Management:**
- Issue: Blog images are currently handled via optional string paths in frontmatter without a robust optimized image pipeline or central management.
- Files: `src/content/config.ts`, `src/pages/blog/[...slug].astro`
- Impact: Risks unoptimized image delivery and broken paths as the blog grows.
- Fix approach: Utilize Astro's `image()` schema helper and `<Image />` component for automatic optimization and validation.

## Performance Bottlenecks

**CSS-Based Glow Effects:**
- Problem: Extensive use of `filter: drop-shadow` and `box-shadow` for the "glow" aesthetic.
- Files: `src/styles/global.css`, `src/components/ResearchDataViz.astro`, `src/components/SkillsChart.astro`
- Cause: Layering multiple CSS filters on SVG elements can lead to heavy paint times, especially on mobile devices or lower-end hardware.
- Improvement path: Monitor performance using Lighthouse; consider pre-rendering glow effects as static assets or using canvas for more complex animations.

## Fragile Areas

**Responsive Visualization Layouts:**
- Files: `src/components/ResearchDataViz.astro`
- Why fragile: Hardcoded `viewBox` and coordinate systems in SVGs may not adapt well to ultra-wide or mobile screens without complex media queries.
- Safe modification: Use a responsive container strategy (as currently attempted) but test across diverse viewport sizes.
- Test coverage: No automated visual regression tests exist.

## Scaling Limits

**Static Site Content:**
- Current capacity: Small number of blog posts and projects.
- Limit: As the number of "Research Data Visualization" examples increases, the page size will grow significantly due to inline SVGs.
- Scaling path: Implement lazy loading for visualization components or move data-heavy visualizations to separate pages/endpoints.

## Dependencies at Risk

**Tailwind CSS v4:**
- Risk: Using a very recent version (`^4.2.2`) might have breaking changes or limited community documentation for specific Astro integrations compared to v3.
- Impact: Build pipeline issues if the `@tailwindcss/vite` plugin undergoes significant changes.
- Migration plan: Pin to a stable version if build instability occurs.

## Missing Critical Features

**Search Functionality:**
- Problem: No way to search or filter blog posts or research projects.
- Blocks: Users cannot easily find specific technical content as the site grows.

**Interactive Geophysics Tools:**
- Problem: Project goal specifies "interactive data analysis", but current components are purely visual/non-interactive.
- Blocks: Fulfilling the core user goal of demonstrating computational research skills.

## Test Coverage Gaps

**Unit/Integration Tests:**
- What's not tested: Component rendering, content collection validation, and utility functions.
- Files: All `src/components/` and `src/pages/`
- Risk: Future refactors (e.g., adding a data viz library) could break existing layouts or content rendering unnoticed.
- Priority: Medium (personal site, but high importance for "Geophysics context" accuracy).

---

*Concerns audit: 2025-05-14*
