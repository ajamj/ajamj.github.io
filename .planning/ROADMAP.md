# Roadmap: Personal Portfolio Website & Blog

## Overview

Build a clean, fast, academic personal portfolio website and blog for Ajam Jamaludin, deployed on GitHub Pages. This includes a geophysics portfolio, a technical blog with Markdown/MDX support, and interactive data visualizations using D3.js.

## Phases

- [x] **Phase 1: Foundation** - Astro project setup, responsive layout, typography (COMPLETE)
- [x] **Phase 2: Content** - Portfolio content with geophysics research focus (COMPLETE)
- [x] **Phase 3: Contact & SEO** - Contact section, meta tags, accessibility (COMPLETE)
- [x] **Phase 4: Polish** - Visual refinement, responsive testing, final deploy (COMPLETE)
- [x] **Phase 5: Blog Implementation** - Markdown/MDX blog system, listing, and post layouts (COMPLETE)
- [x] **Phase 6: Interactive Data Visualizations** - D3.js earthquake scatterplot (COMPLETE)

---

## v1.1 Enhancement Phase (2026-04-18)

- [x] **Phase 1.1: Accessibility Fixes** - SVG icons, 44×44pt touch, reduced motion, contrast (COMPLETE)
- [x] **Phase 1.2: UI Improvements** - Contact form resize, blog scroll-reveal (COMPLETE)

---

## v1.2 Enhancement Phase (2026-04-18)

- [x] **Phase 7: Multi-Page Structure** - Add /about, /cv, /projects pages
- [x] **Phase 8: Personal Portrait** - Add photo to Hero section

---

## v2.0 Fullstack Migration (2026-04-19)

- [ ] **Phase 07: Backend Foundation** — Django project, PostgreSQL, models, admin
- [ ] **Phase 08: Backend API** — REST Framework, endpoints, serializers
- [ ] **Phase 09: Frontend Foundation** — React Vite, routing, components
- [ ] **Phase 10: Frontend Integration** — API connection, pages
- [ ] **Phase 11: D3.js Port** — React visualizations
- [ ] **Phase 12: Deployment** — Railway + Cloudflare, launch

---

## Phase Details

### Phase 1: Foundation
**Goal**: Core site structure with Astro, responsive layout, navigation, and typography
**Depends on**: Nothing (first phase)
**Requirements**: STRU-01, STRU-02, STRU-03, STRU-04, DESN-01, DESN-02, DESN-03, DESN-04, DESN-05
**Success Criteria** (what must be TRUE):
  1. Astro project initialized with proper directory structure
  2. All four initial sections (About, Projects, Skills, Contact) exist and are navigable
  3. Site is visually clean and academic/professional in aesthetic
  4. Layout adapts to mobile viewport (single column on narrow screens)
**Plans**: 3 plans (ALL COMPLETE)
**UI hint**: yes

### Phase 2: Content
**Goal**: All portfolio sections filled with geophysics research information
**Depends on**: Phase 1
**Requirements**: CONT-01, CONT-02, CONT-03, CONT-04, CONT-05
**Success Criteria** (what must be TRUE):
  1. About section clearly introduces Ajam with background, role, and research focus
  2. Projects section showcases at least two projects (seismic processing, earthquake monitoring)
  3. Skills section lists relevant technical competencies
**Plans**: 1 plan (ALL COMPLETE)
**UI hint**: yes

### Phase 3: Contact & SEO
**Goal**: Contact section and technical requirements (SEO meta, accessibility)
**Depends on**: Phase 2
**Requirements**: CONT-06, TECH-01, TECH-02, TECH-03
**Success Criteria** (what must be TRUE):
  1. Contact section displays email address or links to professional profiles
  2. HTML head contains title, description, and Open Graph meta tags
  3. Site loads from GitHub Pages root URL without path issues
**Plans**: 2 plans (ALL COMPLETE)
**UI hint**: yes

### Phase 4: Polish
**Goal**: Visual refinement, responsive testing, and final deploy verification
**Depends on**: Phase 3
**Requirements**: (all from prior phases)
**Success Criteria** (what must be TRUE):
  1. All responsive breakpoints tested (desktop, tablet, mobile)
  2. Visual polish applied: consistent spacing, hover states, smooth scrolling
  3. Site is live at https://ajamj.github.io and loads within 2 seconds
**Plans**: 1 plan (ALL COMPLETE)
**UI hint**: yes

### Phase 5: Blog Implementation
**Goal**: Technical blog system with Markdown/MDX support and listing pages
**Depends on**: Phase 4
**Requirements**: STRU-05, CONT-07, BLOG-01, BLOG-02, BLOG-03
**Success Criteria** (what must be TRUE):
  1. User can create blog posts using .md or .mdx files
  2. Blog listing page exists with previews of posts and tag filtering
  3. Posts use a specialized layout optimized for technical geophysics analysis with code highlighting
**Plans**: 1 plan (ALL COMPLETE)
**UI hint**: yes

### Phase 6: Interactive Data Visualizations
**Goal**: Embedding interactive geophysics visualizations into the site/blog
**Depends on**: Phase 5
**Requirements**: VIZ-01, VIZ-02, VIZ-03, DATAVIZ-01, DATAVIZ-02, DATAVIZ-03
**Success Criteria** (what must be TRUE):
  1. Interactive D3.js scatterplot visualization is embedded in the site
  2. Visualizations display earthquake magnitude vs depth data (15 events)
  3. User can interact with data points (tooltips on hover)
**Plans**: 1 plan (ALL COMPLETE)
**UI hint**: yes

### Phase 07: Backend Foundation
**Goal**: Django project with PostgreSQL, models, and admin for content management
**Depends on**: Nothing
**Requirements**: FS-01, FS-02, FS-03, FS-04
**Success Criteria** (what must be TRUE):
  1. Django project initialized with api app
  2. PostgreSQL configured (with SQLite fallback for dev)
  3. All 4 models created (Project, BlogPost, Contact, Skill)
  4. Django Admin configured for easy content management
**Plans**: 1 plan
**UI hint**: no

### Phase 08: Backend API
**Goal**: REST API endpoints using Django REST Framework
**Depends on**: Phase 07
**Requirements**: FS-05, FS-06, FS-07
**Success Criteria** (what must be TRUE):
  1. Django REST Framework installed and configured
  2. All API endpoints implemented (/api/projects/, /api/blog/, /api/contact/, /api/skills/)
  3. Serializers and views created
**Plans**: 1 plan
**UI hint**: no

### Phase 09: Frontend Foundation
**Goal**: React Vite project with routing and core components
**Depends on**: Nothing
**Requirements**: FS-08, FS-09, FS-10
**Success Criteria** (what must be TRUE):
  1. React Vite project initialized
  2. React Router configured with all routes (/, /about, /projects, /cv, /blog, /blog/:slug)
  3. Header, Footer, and page components created
**Plans**: 1 plan
**UI hint**: yes

### Phase 10: Frontend Integration
**Goal**: Connect React frontend to Django API
**Depends on**: Phase 08, Phase 09
**Requirements**: FS-11, FS-12, FS-13
**Success Criteria** (what must be TRUE):
  1. API service layer created
  2. All pages fetch data from Django API
  3. Contact form submits to API
**Plans**: 1 plan
**UI hint**: yes

### Phase 11: D3.js Visualization Port
**Goal**: Port D3.js visualizations from Astro to React
**Depends on**: Phase 10
**Requirements**: FS-14, FS-15
**Success Criteria** (what must be TRUE):
  1. EarthquakeViz component ported to React
  2. ResearchDataViz component ported to React
  3. Visualizations work in React environment
**Plans**: 1 plan
**UI hint**: yes

### Phase 12: Deployment
**Goal**: Deploy backend to Railway, frontend to Cloudflare Pages
**Depends on**: Phase 11
**Requirements**: FS-16, FS-17, FS-18
**Success Criteria** (what must be TRUE):
  1. Django backend deployed to Railway with PostgreSQL
  2. React frontend deployed to Cloudflare Pages
  3. All systems tested and working
**Plans**: 1 plan
**UI hint**: no

---

## Progress

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Foundation | 3/3 | Complete | 2026-04-16 |
| 2. Content | 1/1 | Complete | 2026-04-16 |
| 3. Contact & SEO | 2/2 | Complete | 2026-04-18 |
| 4. Polish | 1/1 | Complete | 2026-04-18 |
| 5. Blog Implementation | 1/1 | Complete | 2026-04-18 |
| 6. Interactive Data Visualizations | 1/1 | Complete | 2026-04-18 |
| 7. Backend Foundation | 1/1 | Planned | - |
| 8. Backend API | 1/1 | Planned | - |
| 9. Frontend Foundation | 1/1 | Planned | - |
| 10. Frontend Integration | 1/1 | Planned | - |
| 11. D3.js Port | 1/1 | Planned | - |
| 12. Deployment | 1/1 | Planned | - |

---

## v2.0 Requirements (Fullstack Migration)

| ID | Requirement | Phase |
|----|-------------|-------|
| FS-01 | Django project setup with settings | 07 |
| FS-02 | PostgreSQL configuration | 07 |
| FS-03 | Create models (Project, BlogPost, Contact, Skill) | 07 |
| FS-04 | Django Admin configuration | 07 |
| FS-05 | Django REST Framework setup | 08 |
| FS-06 | Create serializers | 08 |
| FS-07 | Create API views and URLs | 08 |
| FS-08 | React Vite project initialization | 09 |
| FS-09 | React Router configuration | 09 |
| FS-10 | Create core components | 09 |
| FS-11 | API service layer | 10 |
| FS-12 | Fetch data in pages | 10 |
| FS-13 | Contact form API integration | 10 |
| FS-14 | Port EarthquakeViz to React | 11 |
| FS-15 | Port ResearchDataViz to React | 11 |
| FS-16 | Deploy Django to Railway | 12 |
| FS-17 | Deploy React to Cloudflare | 12 |
| FS-18 | Configure environment variables | 12 |

---
*Last updated: 2026-04-19*