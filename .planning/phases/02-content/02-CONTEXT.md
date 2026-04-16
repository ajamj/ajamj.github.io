# Phase 2: Content - Context

**Gathered:** 2026-04-16
**Status:** Ready for planning

<domain>
## Phase Boundary

Fill all content sections (About, Projects, Skills) with geophysics research portfolio information. The Astro foundation is complete — this phase adds meaningful content that showcases Ajam's expertise, projects, and technical competencies.

</domain>

<decisions>
## Implementation Decisions

### Content Structure
- **D-01:** About section includes: name, role, location, bio paragraph, education (UGM Geophysics 2019-2026), experience (BMKG internship, UGM lab assistant), achievements
- **D-02:** Projects section displays 3 project cards in a responsive grid layout
- **D-03:** Skills section organized by category (Programming, Seismic Tools, Languages) in a grid

### Project Content
- **D-04:** Project 1: Earthquake Early Warning System (EEWS) with ML, ObsPy, real-time P-wave detection
- **D-05:** Project 2: Thesis on ML-Based Earthquake Parameter Estimation
- **D-06:** Project 3: Real-time Seismic Monitoring Dashboard with PyQt5 and Telegram API

### Skills Content
- **D-07:** Programming: Python, Bash, SQL, MATLAB
- **D-08:** Seismic Tools: ObsPy, SeisComP, Waveform Visualization, Phase Picking, SEED/MiniSEED
- **D-09:** Languages: Indonesian (Native), English (Professional)

### Design Approach
- **D-10:** Keep existing teal (#0D7377) accent color for headings and tags
- **D-11:** Card-based layout for projects with tag pills
- **D-12:** Grid layout for skills with categorized groupings

### Technical
- **D-13:** Astro framework — content lives in `src/pages/index.astro` frontmatter and JSX
- **D-14:** Component-scoped styles within `<style>` tags in Astro components
- **D-15:** Global CSS variables already defined in `src/layouts/Layout.astro`

### Claude's Discretion
- Content tone: Professional, academic, showcases research capabilities
- Card design: Clean with subtle shadows, rounded corners, consistent spacing
- Typography: Maintain existing hierarchy with h1 for name, h2 for section headings

</decisions>

<canonical_refs>
## Canonical References

**Downstream agents MUST read these before planning or implementing.**

- `.planning/ROADMAP.md` §Phase 2 — Phase goal, requirements, success criteria
- `.planning/REQUIREMENTS.md` §CONT-01 to CONT-05 — Content acceptance criteria
- `.planning/PROJECT.md` — Core value (showcase expertise, projects, contact)

</canonical_refs>

<code_context>
## Existing Code Insights

### Project Structure (Astro)
- `src/layouts/Layout.astro` — Main layout with global CSS variables
- `src/components/Header.astro` — Navigation header with mobile menu
- `src/components/Footer.astro` — Footer component
- `src/pages/index.astro` — Main page with all content sections
- `src/styles/global.css` — Empty global styles (styles scoped to components)

### Content Already Present
- index.astro contains full content for About, Projects, Skills, Contact
- Projects data array with 3 projects
- Skills data array with 3 categories
- Experience array with 2 positions
- Achievements array with 4 items

### CSS Variables Available
- `--color-bg: #FAFAFA`
- `--color-text: #1A1A2E`
- `--color-accent: #0D7377`
- `--color-accent-secondary: #E8A838`
- `--color-white: #FFFFFF`
- `--color-border: #e5e5e5`
- Spacing scale: `--space-xs` through `--space-3xl`

### Integration Points
- Header links: `#about`, `#projects`, `#skills`, `#contact`
- Section IDs match header navigation targets

</code_context>

<specifics>
## Specific Ideas

- About section should emphasize earthquake early warning research
- Projects cards should highlight technical stack and outcomes
- Skills should reflect seismology-specific tools (ObsPy, SeisComP)
- Achievement bullet points add credibility

</specifics>

<deferred>
## Deferred Ideas

### Phase 3 (Contact & SEO)
- SEO meta tags and Open Graph
- Contact form or additional social links
- Privacy policy

### Phase 4 (Polish)
- Dark mode toggle
- Image optimization
- Performance testing

</deferred>

---

*Phase: 02-content*
*Context gathered: 2026-04-16*
