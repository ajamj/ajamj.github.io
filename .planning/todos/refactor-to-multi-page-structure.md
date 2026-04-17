---
title: "Refactor to multi-page website structure"
status: "pending"
priority: "high"
area: "architecture"
created: "2026-04-17"
---

## Description
The user wants to transition the website from a single-page layout to a multi-page architecture. The current implementation uses anchor links (`#`) for sections like Projects and Skills, which should be moved to dedicated pages.

## Implementation Details
- **Decompose Index**: Move logic/content from sections in `src/pages/index.astro` to individual pages:
  - `src/pages/projects.astro`
  - `src/pages/skills.astro`
  - `src/pages/contact.astro`
- **Update Navigation**: Update `src/components/Header.astro` to use absolute paths instead of anchors (e.g., `/projects` instead of `/#projects`).
- **Shared Components**: Ensure components like `ProjectGallery`, `SkillsChart`, and `ContactForm` are easily reusable across pages.
- **Routing**: Ensure Astro's static routing is correctly utilized.
- **HUD Consistency**: Verify that the HUD corners and grid background in `Layout.astro` work well across all sub-pages.

## Constraints
- Preserve the "Digital Lithosphere" / "HUD" aesthetic.
- Maintain fast page loads and SEO friendliness.
