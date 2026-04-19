# Design: Fullstack Portfolio with React Vite + Django

**Date:** 2026-04-19
**Status:** Approved

---

## Overview

Migrate personal portfolio website from static Astro (GitHub Pages) to fullstack web application with React Vite frontend and Django backend. Goal: easy content management for blog/posts without code, maintainable architecture, and Cloudflare deployment capability.

## Architecture

```
┌─────────────────────────┐     ┌─────────────────────┐
│   React Vite App        │────▶│   Django API        │
│   (Cloudflare Pages)   │     │   (Railway/Render)  │
└─────────────────────────┘     └─────────────────────┘
         │                            │
         │                     ┌─────▼─────┐
         │                     │ PostgreSQL │
         │                     │  Database │
         │                     └───────────┘
         ▼
┌─────────────────────────┐
│   D3 Visualizations  │
│   (React Context)    │
└─────────────────────────┘
```

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend Framework | React 18 + Vite |
| Styling | CSS Modules / Vanilla CSS |
| Data Viz | D3.js |
| Backend | Django 5.x |
| Database | PostgreSQL (prod), SQLite (dev) |
| Deploy Frontend | Cloudflare Pages |
| Deploy Backend | Railway / Render / Fly.io |

## Frontend Scope

### Pages
- `/` — Home (hero, intro, featured)
- `/about` — About/Bio
- `/projects` — Project portfolio
- `/cv` — Resume/CV
- `/blog` — Blog list
- `/blog/:slug` — Blog post

### Components
- `Header` — Navigation
- `Footer` — Links, contact
- `Hero` — Hero section
- `ProjectCard` — Project display
- `BlogCard` — Blog preview
- `ContactForm` — Contact submission
- `EarthquakeViz` — Interactive seismology (port from Astro)
- `ResearchDataViz` — Data visualization (port from Astro)

### API Endpoints (from Django)
```
GET    /api/projects/     — List projects
GET    /api/projects/:id/  — Project detail
GET    /api/blog/         — List posts
GET    /api/blog/:slug/  — Post detail
POST   /api/contact/     — Submit contact form
```

## Backend Scope

### Django Models

```python
# Project: title, description, tech_stack, image, link, date
# BlogPost: title, slug, content, excerpt, published, date, tags
# Contact: name, email, message, created_at
# Skill: name, category, proficiency
```

### Django Admin
- `/admin` — Manage all content
- Intuitive UI untuk non-technical use

### API Response Format

```json
{
  "projects": [
    {
      "id": 1,
      "title": "Seismic Processing",
      "description": "...",
      "tech_stack": ["Python", "ObsPy"],
      "image": "/images/project1.jpg",
      "link": "https://..."
    }
  ]
}
```

## Workflows

### Add New Blog Post
1. Login ke `/admin`
2. Navigate → Blog Posts → Add
3. Fill: title, slug (auto-generate), content, publish
4. Save → Live!

### Add New Project
1. Login ke `/admin`
2. Navigate → Projects → Add
3. Fill: title, description, tech, image, link
4. Save → Live!

### Deploy

**Frontend (Cloudflare Pages):**
```bash
npm run build
# Connect to Cloudflare, point to dist/
```

**Backend (Railway):**
```bash
# Push to GitHub
# Connect Railway to repo
# Set environment variables
```

## Migration Plan

1. Create new repo atau branch untuk fullstack
2. Set up Django project + models
3. Set up React Vite project
4. Connect API calls
5. Port D3 visualizations to React
6. Deploy backend ke Railway
7. Deploy frontend ke Cloudflare

## Out of Scope

- User authentication (public portfolio)
- Comments system
- Payment/e-commerce
- Multi-language

---

**Status:** Approved for implementation