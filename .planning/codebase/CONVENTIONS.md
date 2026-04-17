# Coding Conventions

**Analysis Date:** 2026-04-17

## Naming Patterns

**Files:**
- Components: `PascalCase.astro` - e.g., `src/components/Hero.astro`, `src/components/ResearchDataViz.astro`
- Layouts: `PascalCase.astro` - e.g., `src/layouts/Layout.astro`
- Pages: `index.astro` or `[...slug].astro` - e.g., `src/pages/index.astro`, `src/pages/blog/[...slug].astro`
- Content Config: `config.ts` - e.g., `src/content/config.ts`
- Styles: `global.css` - e.g., `src/styles/global.css`

**Functions:**
- Frontmatter scripts use standard JavaScript/TypeScript naming (typically `camelCase`).
- Component logic is mostly inlined in the frontmatter `---` section of `.astro` files.

**Variables:**
- Prop extraction: `camelCase` - e.g., `const { title, description } = Astro.props;`
- Internal variables: `camelCase`.

**Types:**
- Component props: `interface Props` - defined in the frontmatter.
- Schema validation: Zod schemas in `src/content/config.ts`.

## Code Style

**Formatting:**
- No dedicated formatting tool (Prettier/Biome) configuration found in the root.
- Code appears to use 2-space or 4-space indentation (mix observed, but mostly consistent within files).

**Linting:**
- No dedicated linting tool (ESLint) configuration found in the root.

## Import Organization

**Order:**
1. Astro components/layouts
2. Local styles (`.css`)
3. Component prop interfaces

**Path Aliases:**
- Use of relative paths observed - e.g., `import Header from '../components/Header.astro';`

## Error Handling

**Patterns:**
- No explicit error handling patterns observed in the current codebase (mostly static site generation).
- Schema validation via Zod in `src/content/config.ts` provides compile-time/build-time safety for content.

## Logging

**Framework:** `console`

**Patterns:**
- No systematic logging patterns observed.

## Comments

**When to Comment:**
- Comments are used at the top of `.astro` files to describe their purpose.
- Comments are used within templates to mark sections (e.g., `<!-- Card 1: P-Wave Detection -->`).

**JSDoc/TSDoc:**
- Not extensively used.

## Function Design

**Size:**
- Frontmatter scripts are generally small, focused on prop extraction and data fetching.
- CSS is either inlined in `<style>` blocks or in `src/styles/global.css`.

**Parameters:**
- Astro components receive parameters via `Astro.props`.
- Type safety for props is provided by `interface Props`.

## Module Design

**Exports:**
- `src/content/config.ts` exports `collections` to define content structures.

**Barrel Files:**
- Not used. Components are imported directly from their respective files.

---

*Convention analysis: 2026-04-17*
