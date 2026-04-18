# Personal Website: Ajam Jamaludin

## What This Is

A personal academic/research portfolio website and blog for Ajam Jamaludin, a junior geophysics researcher specializing in seismology and seismic exploration. The site showcases professional background, research projects, technical skills, and features a blog for posts, analysis, and interactive data visualization within a geophysics context. Deployed as a static site via GitHub Pages at https://ajamj.github.io.

## Core Value

Visitors can quickly understand Ajam's expertise, explore portfolio projects (seismic data processing, earthquake monitoring), engage with interactive data visualizations, and read in-depth geophysics analysis — conveying professional credibility and unique technical insight for a researcher building their academic presence.

## Requirements

### Active

- [ ] Personal portfolio website with About/Bio, Projects, Skills, and Contact sections
- [ ] Professional academic aesthetic suitable for research audience
- [ ] Responsive design accessible on desktop and mobile
- [ ] Fast page load (Static Site Generation using Astro)
- [ ] SEO-friendly with appropriate meta tags
- [ ] Project showcase for seismic data processing software
- [ ] Project showcase for earthquake monitoring tools
- [ ] Technical skills section (seismology, seismic processing tools)
- [ ] Contact information / contact form or links
- [ ] Clean, academic visual design
- [ ] **Blog system** with Markdown/MDX support for geophysics analysis posts
- [ ] **Interactive Data Visualization** (D3.js or similar) using geophysics datasets
- [ ] Use agents and skills for development workflow

### Out of Scope

- Multi-language support
- Backend API or server-side processing
- E-commerce or paid features
- User authentication
- Dynamic CMS (using static Markdown/MDX instead)

## Context

- **Owner**: Ajam Jamaludin — junior geophysics researcher, class of 2026, Universitas Gadjah Mada
- **Domain**: Personal portfolio / academic research / technical blog
- **Audience**: Academic peers, potential collaborators, prospective employers, geophysics enthusiasts
- **Stack preference**: Astro, TypeScript, Vanilla CSS
- **Deployment**: GitHub Pages (using git best practices: feature branches, no direct push to main)

## Constraints

- **Tech Stack**: Astro (Static Site Generation), TypeScript, Vanilla CSS — unique and interactive features
- **Deployment**: GitHub Pages via automated workflows — strictly following branch-based development (no direct main commits)
- **Design**: Clean, academic/professional — interactive but performant
- **Performance**: Fast loading essential for accessibility, optimized data visualizations

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Astro Framework | Static Site Generation, better performance, component-based development | Adopted |
| Markdown/MDX for Blog | Simplicity, version-controlled content, support for interactive components | Adopted |
| D3.js for Visualizations | Industry standard for interactive, high-performance data viz | Adopted |
| Branch-based Development | Git best practices, safety, clean history | Adopted |

## Evolution

This document evolves at phase transitions and milestone boundaries.

---

## Milestone v1.1: Enhancement Phase (2026-04-18)

### Goals for This Milestone
- Complete remaining UI/UX improvements
- Add multi-page structure (optional - besar)
- Personal portrait integration (optional - besar)
- Mobile-first design polish
- Performance optimization

### Completed This Milestone
- Fixed hamburger emoji → SVG icon
- Added 44×44pt touch targets
- Added reduced motion support
- Fixed text contrast (WCAG AA)
- Fixed GitHub workflow dependency conflict
- Updated blog description
- Disabled contact form resize
- Fixed blog scroll-reveal observer

---
*Last updated: 2026-04-18*
