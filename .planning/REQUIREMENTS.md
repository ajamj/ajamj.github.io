# Requirements: Personal Portfolio Website & Blog

**Defined:** 2026-04-16
**Updated:** 2026-04-18
**Core Value:** Visitors can quickly understand Ajam's expertise, explore portfolio projects, engage with interactive geophysics data visualizations, and read in-depth analysis.

## v1.1 Requirements (Enhancement Phase)

### Accessibility & UI

- [x] **A11Y-01**: SVG icons instead of emojis (hamburger menu)
- [x] **A11Y-02**: Touch targets minimum 44×44pt
- [x] **A11Y-03**: Reduced motion support (prefers-reduced-motion)
- [x] **A11Y-04**: Text contrast WCAG AA compliant (4.5:1)
- [x] **A11Y-05**: Keyboard navigation focus states

### Blog & Content

- [x] **CONT-08**: Blog post descriptions from actual content
- [x] **BLOG-04**: Fixed blog post scroll-reveal visibility

### Forms

- [x] **FORM-01**: Contact form textarea non-resizable

---

## v1 Requirements

Requirements for initial release. Each maps to roadmap phases.

### Structure

- [x] **STRU-01**: Website has a Home/About section introducing Ajam Jamaludin
- [x] **STRU-02**: Website has a Projects/Portfolio section showcasing work
- [x] **STRU-03**: Website has a Skills section listing technical competencies
- [x] **STRU-04**: Website has a Contact section with contact information
- [ ] **STRU-05**: Website has a Blog/Analysis section for in-depth posts

### Content

- [x] **CONT-01**: About section includes background (geophysics researcher, UGM alumni 2026)
- [x] **CONT-02**: About section includes research focus (seismology, seismic exploration for oil & gas)
- [x] **CONT-03**: Projects section showcases seismic data processing software
- [x] **CONT-04**: Projects section showcases earthquake monitoring tools
- [x] **CONT-05**: Skills section lists seismology-related technical skills
- [x] **CONT-06**: Contact section provides email or contact form link
- [ ] **CONT-07**: Blog content focused on geophysics, seismology, and data analysis

### Design

- [x] **DESN-01**: Clean, academic/professional visual aesthetic
- [x] **DESN-02**: Responsive layout works on desktop and mobile
- [x] **DESN-03**: Fast page load (Static Site Generation via Astro)
- [x] **DESN-04**: Accessible design with proper contrast and readable typography
- [x] **DESN-05**: Consistent color scheme and visual hierarchy

### Technical

- [x] **TECH-01**: SEO-friendly with appropriate meta tags (title, description, og:*)
- [x] **TECH-02**: No intrusive tracking or dark patterns
- [x] **TECH-03**: Works on GitHub Pages (Astro-generated static files)
- [ ] **TECH-04**: Git best practices: feature branches and PR-based development

### Blog Features

- [x] **BLOG-01**: Supports Markdown/MDX for blog post content (Already works - .md and .mdx files render)
- [ ] **BLOG-02**: Blog listing page with previews and filtering by geophysics topics (Phase 5 in progress)
- [ ] **BLOG-03**: Dedicated post layout with typography optimized for reading analysis (Phase 5 in progress)

### Data Visualization

- [ ] **VIZ-01**: Interactive geophysics data visualizations (D3.js or similar)
- [ ] **VIZ-02**: Support for visualizing geophysics datasets (e.g., SEGY, seismic wave data)
- [ ] **VIZ-03**: Embedding visualizations within blog posts for interactive analysis

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| Backend / server-side processing | Static site only (SSG) |
| User authentication | Not needed for portfolio |
| Multi-language support | English only for v1 |
| E-commerce / paid features | N/A |
| Dynamic/DB-backed CMS | Use file-based MDX instead |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| STRU-01 | Phase 1 | Done |
| STRU-02 | Phase 1 | Done |
| STRU-03 | Phase 1 | Done |
| STRU-04 | Phase 1 | Done |
| STRU-05 | Phase 5 | Done (implicit - Blog link exists) |
| CONT-01 | Phase 2 | Done |
| CONT-02 | Phase 2 | Done |
| CONT-03 | Phase 2 | Done |
| CONT-04 | Phase 2 | Done |
| CONT-05 | Phase 2 | Done |
| CONT-06 | Phase 3 | Done |
| CONT-07 | Phase 5 | Done (existing blog posts) |
| DESN-01 | Phase 1 | Done |
| DESN-02 | Phase 1 | Done |
| DESN-03 | Phase 1 | Done |
| DESN-04 | Phase 1 | Done |
| DESN-05 | Phase 1 | Done |
| TECH-01 | Phase 3 | Done |
| TECH-02 | Phase 3 | Done |
| TECH-03 | Phase 3 | Done |
| TECH-04 | Phase 1-6 | Ongoing |
| BLOG-01 | Phase 5 | Done (MDX works) |
| BLOG-02 | Phase 5 | In Progress |
| BLOG-03 | Phase 5 | In Progress |
| VIZ-01 | Phase 6 | Pending |
| VIZ-02 | Phase 6 | Pending |
| VIZ-03 | Phase 6 | Pending |

**Coverage:**
- v1 requirements: 27 total
- v1.1 requirements: 10 (A11Y-01-05, CONT-08, BLOG-04, FORM-01)
- v1 Completed: 22 (STRU-01-05, CONT-01-07, DESN-01-05, TECH-01-03, BLOG-01)
- v1.1 Completed: 10
- Pending: 6 (TECH-04, BLOG-02-03, VIZ-01-03)
- Mapped to phases: 27 ✓

---
*Requirements updated: 2026-04-18*
