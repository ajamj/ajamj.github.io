# Technology Stack

**Analysis Date:** 2026-04-16

## Languages

**Primary:**
- TypeScript 5.0 - Used for all logic and component scripts in `src/`
- Astro - Component-based framework for static site generation

**Secondary:**
- CSS (Tailwind 4.0) - Used for styling in `src/styles/global.css` and component `<style>` blocks
- Markdown/MDX - Used for blog content in `src/content/blog/`

## Runtime

**Environment:**
- Node.js 20 - Build and development environment

**Package Manager:**
- npm 10.x - Dependency management
- Lockfile: `package-lock.json` present

## Frameworks

**Core:**
- Astro 5.0.0 - Static Site Generator for content-driven websites

**Testing:**
- Not detected - No testing framework (Jest/Vitest) found in `package.json`

**Build/Dev:**
- Vite (Internal to Astro) - Build tool and dev server
- Tailwind CSS 4.2.2 - Utility-first CSS framework with Vite plugin `@tailwindcss/vite`

## Key Dependencies

**Critical:**
- `astro` ^5.0.0 - Core framework
- `tailwindcss` ^4.2.2 - Styling engine

**Infrastructure:**
- `astro-seo` ^1.1.0 - SEO management for pages
- `@astrojs/sitemap` ^3.7.2 - Automated sitemap generation
- `astro-icon` ^1.1.5 - SVG icon management

## Configuration

**Environment:**
- Environment variables managed via standard `.env` (note: existence of `.env` files not checked for security)

**Build:**
- `astro.config.mjs` - Main Astro configuration
- `tsconfig.json` - TypeScript compiler settings (extends `astro/tsconfigs/strict`)
- `package.json` - Build scripts and metadata

## Platform Requirements

**Development:**
- Node.js 18.17.1 or higher
- npm (Node Package Manager)

**Production:**
- GitHub Pages - Static hosting environment

---

*Stack analysis: 2026-04-16*
